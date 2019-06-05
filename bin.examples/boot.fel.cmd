## hyphop ##

## miZy advanced boot script 
## FEL|SPI|MMC|SD|USB boot ready

## alias
se=setenv

$se devtype_old	${devtype}
$se target_old	${target}
$se boot_part	"${devnum}:${distro_bootpart}"
$se boot_part	0:1
$se rootdev	/dev/ram0
$se verbosity	3
$se machid	1029
$se bootm_boot_mode  sec
$se led_red	PA17
$se led_green	PL10
$se initrd	/boot/uInitrd
$se kernel	/boot/uImage
$se fdt		/boot/script.bin
$se script	/boot/boot.scr
$se env_addr	0x43101000
$se env_file	/boot/boot.env
$se led_boot	${led_red}
$se readspi	spiread.xd
$se bootargs	""
$se consoleargs	"earlyprintk=ttyS0,115200"
$se consoleargs	"${consoleargs} console=tty1 console=ttyS0,115200"
$se mtd		"mtdparts=m25p80-flash.0:-(full)"
$se itype	"itype=busybox init=/init"
$se itype	"itype=openwrt"
$se filesize	4096
$se env_size	4096

##

gpio set ${led_boot}

if test ${bootfrom} = "" ; then 
    
    itest.b *0x28 == 0x00 && $se bootfrom sd
    itest.b *0x28 == 0x02 && $se bootfrom mmc
    itest.b *0x28 == 0x03 && $se bootfrom spi
    ### fix fel booted detection #### itest.b *9 == 0x46 
    test "${fel_booted}" = "1" && $se bootfrom fel
    echo "detect boot source $bootfrom"

fi

$se loadenv_usb  "usb reset && load usb ${boot_part} ${env_addr} ${env_file}"
$se loadenv_usb0 "${loadenv_usb}"
$se loadenv_mmc  "load mmc ${boot_part} ${env_addr} ${env_file}"
$se loadenv_mmc0 "${loadenv_mmc}"
$se loadenv_sd   "${loadenv_mmc}"
$se loadenv_spi  "test -n ${env_offset} && $readspi ${env_addr} ${env_offset} ${env_size} && $se filesize ${env_size}"
$se loadenv_MMC  "echo env_MMC; $se filesize ${env_size}"
$se loadenv_fel  "echo env_fel; $se filesize ${env_size}"
$se loadenv_MMC0 "${loadenv_MMC}"
$se loadenv_MMC1 "${loadenv_MMC}"

$se loadseq "${loadseq}>${target}"

if test ${noenv} = "" ; then 

    loadenv="loadenv_${target}"
    echo $loadenv
    run $loadenv
    env import -t ${env_addr} ${filesize}

    if test $target != $target_old; then
	$se loadseq "${loadseq}>${target}"

	loadenv="loadenv_${target}"
	echo "FORCE $loadenv"
	run $loadenv 
	env import -t ${env_addr} ${filesize}
    fi
fi

bootargs_env="${bootargs}"

$se bootargs "${bootargs} ${rescue} ${itype} root=${rootdev} rw ${consoleargs} ${mtd} panic=10 consoleblank=0 loglevel=${verbosity}"
#$se bootargs "${bootargs} sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_fb_mem_reserve=16"

test "${bootargs_reset}" = "1" && echo "bootargs_reset: ${bootargs_reset}" && $se bootargs "${bootargs_env}"

## usb
l="load usb ${boot_part}"
$se loadlinux_usb "echo loadlinux usb ${boot_part};
    usb reset &&
    $l ${fdt_addr_r} ${fdt} &&
    $l ${kernel_addr_r} ${kernel} &&
    $l ${ramdisk_addr_r} ${initrd}"

$se loadlinux_usb0 "${loadlinux_usb}"

## mmc mmc0 sd
l="load mmc ${boot_part}"
$se loadlinux_mmc "echo loadlinux mmc ${boot_part};
    $l ${fdt_addr_r} ${fdt} &&
    $l ${kernel_addr_r} ${kernel} &&
    $l ${ramdisk_addr_r} ${initrd}"

$se loadlinux_mmc0 "${loadlinux_mmc}"
$se loadlinux_sd "${loadlinux_mmc}"

## MMC raw blocks
l="mmc read"
test -n ${fdt_ob} && $se loadlinux_MMC "echo loadlinux MMC RAW; 
    $l ${fdt_addr_r} ${fdt_ob} ${fdt_sb} &&
    $l ${kernel_addr_r} ${kernel_ob} ${kernel_sb} &&
    $l ${ramdisk_addr_r} ${ramdisk_ob} ${ramdisk_sb}"

$se loadlinux_MMC0 "${loadlinux_MMC}"
$se loadlinux_MMC1 "${loadlinux_MMC}"

## spi
l="${readspi}"
test -n ${fdt_offset} && $se loadlinux_spi "echo loadlinux spi;
    $l ${fdt_addr_r} ${fdt_offset} ${fdt_size} &&
    $l ${kernel_addr_r} ${kernel_offset} ${kernel_size} &&
    $l ${ramdisk_addr_r} ${ramdisk_offset} ${ramdisk_size}"

## fel
$se loadlinux_fel "echo loadlinux_fel"

gpio clear ${led_boot}

## add boot info
$se bootargs "${bootargs} bootfrom=${bootfrom} loadfrom=${target} loadseq=${loadseq} mmcparts=${mmcparts}"

loadlinux="loadlinux_$target"
echo "$loadlinux fdt + kernel + ramdisk"
run $loadlinux

echo "START linux + args:"
echo "${bootargs}"

## start linux
bootm ${kernel_addr_r} ${ramdisk_addr_r}

gpio set ${led_red}

echo "fail back to uboot shell"

#end