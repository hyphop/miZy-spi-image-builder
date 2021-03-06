# BUILD EXAMPLES

## OrangePI R1 / BUILD SPI IMAGE 

```
cd /tmp/zero_builder/miZy-spi-image-builder
time ./scripts/r1_net  1>/tmp/r1_net.log 2>&1

real	0m1.845s
user	0m3.220s
sys	0m0.293s

```

OUTPUT LOG

```
./scripts
[CONFIG] initrd.img.base.R1.net => 
initrd.dir-00-base 
initrd.dir-00-base.busybox 
initrd.dir-00-base.help 
initrd.dir-00-base.www 
initrd.dir-01-modules 
initrd.dir-02-base.local 
initrd.dir-00-base.opkg

 initrd.dir-??-rsync initrd.dir-??-curl initrd.dir-??-networks initrd.dir-??-modules-usbnet initrd.dir-??-wireless initrd.dir-??-wireless.r1 initrd.dir-00-base.mkfs initrd.dir-01-modules-fs initrd.dir-01-modules-exfat initrd.dir-01-modules-netfs initrd.dir-??-fast initrd.dir-??-r12
fex: bin/orangepizero.fex.h2d.spi2.h2
[ADD] initrd.dir-00-base
[ADD] initrd.dir-00-base.busybox
[ADD] initrd.dir-00-base.help
[ADD] initrd.dir-00-base.www
[ADD] initrd.dir-01-modules
[ADD] initrd.dir-02-base.local
[ADD] initrd.dir-00-base.opkg
[ADD] initrd.dir-02-rsync
[ADD] initrd.dir-05-rsync
[ADD] initrd.dir-05-curl
[ADD] initrd.dir-50-networks
[ADD] initrd.dir-01-modules-usbnet
[ADD] initrd.dir-03-wireless
[ADD] initrd.dir-03-wireless.r1
[ADD] initrd.dir-00-base.mkfs
[ADD] initrd.dir-01-modules-fs
[ADD] initrd.dir-01-modules-exfat
[ADD] initrd.dir-01-modules-netfs
[ADD] initrd.dir-76-fast
[ADD] initrd.dir-77-fast
[ADD] initrd.dir-77-r12
[OVL] clean ./etc/rc.d/S98gpio_switch -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/S96led -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/S60dnsmasq -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/S35odhcpd -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/S20network -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/S19firewall -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/K90network -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/K85odhcpd -> (overlay-whiteout)
[OVL] clean ./etc/rc.d/K10gpio_switch -> (overlay-whiteout)
[POST CONFIG]
[ alternative usbnet config ] 
ip_dev=10.1.1.1
ip_host=10.1.1.2
dev_addr=62:ef:11:22:11:11
host_addr=ea:c9:35:d4:66:11

[ alternative wifi config ] IP1=10.20.20.1
[CONFIG] initrd.img.base.R1.net => 
initrd.dir-00-base 
initrd.dir-00-base.busybox 
initrd.dir-00-base.help 
initrd.dir-00-base.www 
initrd.dir-01-modules 
initrd.dir-02-base.local 
initrd.dir-00-base.opkg

 initrd.dir-??-rsync initrd.dir-??-curl initrd.dir-??-networks initrd.dir-??-modules-usbnet initrd.dir-??-wireless initrd.dir-??-wireless.r1 initrd.dir-00-base.mkfs initrd.dir-01-modules-fs initrd.dir-01-modules-exfat initrd.dir-01-modules-netfs initrd.dir-??-fast initrd.dir-??-r12
initrd.dir-00-base initrd.dir-00-base.busybox initrd.dir-00-base.help initrd.dir-00-base.www initrd.dir-01-modules initrd.dir-02-base.local initrd.dir-00-base.opkg initrd.dir-02-rsync initrd.dir-05-rsync initrd.dir-05-curl initrd.dir-50-networks initrd.dir-01-modules-usbnet initrd.dir-03-wireless initrd.dir-03-wireless.r1 initrd.dir-00-base.mkfs initrd.dir-01-modules-fs initrd.dir-01-modules-exfat initrd.dir-01-modules-netfs initrd.dir-76-fast initrd.dir-77-fast initrd.dir-77-r12
[cmd] mksquashfs ,out/initrd.dir ,out/Initrd.sfs -b 512k -comp gzip 
Parallel mksquashfs: Using 4 processors
Creating 4.0 filesystem on ,out/Initrd.sfs, block size 524288.
[===============================================================-] 780/780 100%

Exportable Squashfs 4.0 filesystem, gzip compressed, data block size 524288
	compressed data, compressed metadata, compressed fragments, compressed xattrs
	duplicates are removed
Filesystem size 4787.03 Kbytes (4.67 Mbytes)
	38.75% of uncompressed filesystem size (12352.90 Kbytes)
Inode table size 11751 bytes (11.48 Kbytes)
	29.38% of uncompressed inode table size (39998 bytes)
Directory table size 11763 bytes (11.49 Kbytes)
	51.52% of uncompressed directory table size (22831 bytes)
Number of duplicate files found 29
Number of inodes 1192
Number of files 780
Number of fragments 19
Number of symbolic links  326
Number of device nodes 5
Number of fifo nodes 0
Number of socket nodes 0
Number of directories 81
Number of ids (unique uids + gids) 4
Number of uids 2
	master (1000)
	root (0)
Number of gids 4
	master (1000)
	root (0)
	tty (5)
	dialout (20)
Image Name:   uInitrd
Created:      Mon May 28 00:42:02 2018
Image Type:   ARM Linux RAMDisk Image (uncompressed)
Data Size:    4902912 Bytes = 4788.00 kB = 4.68 MB
Load Address: 43300000
Entry Point:  43300000
[i] ./ miZy_spi_image_builder => CONF: miZy_spi_image_builder.conf.fast
[i] rewrite @IMG
[i] 16M bytes => firmwares/orange_pi_R1_net.MMC.hybrid.%s.bin
[i]     MTD_PART 0xHEX_SIZE( DEC_SIZE){ USED_SZ} FILES
[i]        uboot 0x00080000(   524288){  464279} u-boot-mizi.bin
[i]       script 0x00010000(    65536){    6099} boot.all.cmd boot.all.env boot.spi.env
[i]          dtb 0x00010000(    65536){   35048} script.bin
[i]       kernel 0x003A0000(  3801088){ 3751621} uImage.lzo
[i]       initrd 0x004B0000(  4915200){ 4902976} uInitrd.sfs
[i]         user 0x00710000(  7405568){       0} 
[i] readed 464279(464279) bytes from bin.local/u-boot-mizi.bin
[i] pad 464279 + 60009 => 524288
[i] readed 3988(3988) bytes from bin.local/boot.all.cmd
[i] pad 4060 + 36 => 4096
[i] readed 1749(1749) bytes from bin.local/boot.all.env
[i] readed 362(362) bytes from bin.local/boot.spi.env
[i] pad 2111 + 59329 => 61440
[i] readed 35048(35048) bytes from bin.local/script.bin
[i] pad 35048 + 30488 => 65536
[i] 3801088 = int( 3751621 / 65536 ) * 65536; at ./miZy_spi_image_builder line 386.
[i] readed 3751621(3751621) bytes from bin.local/uImage.lzo
[i] pad 3751621 + 49467 => 3801088
[i] 4915200 = int( 4902976 / 65536 ) * 65536; at ./miZy_spi_image_builder line 386.
[i] readed 4902976(4902976) bytes from bin.local/uInitrd.sfs
[i] pad 4902976 + 12224 => 4915200
[i] free_size 7405568 bytes!
[i] pad 0 + 7405568 => 7405568
[i] pad 16777216 + 0 => 16777216
[i] mmcparts=uboot=524288;script=65536;dtb=65536;kernel=3801088;initrd=4915200;user=7405568
[i] readed 1749(1749) bytes from bin.local/boot.all.env
[i] pad 2271 + 59169 => 61440
[i] override env (boot.spi.env) =>
# auto generated by ./miZy_spi_image_builder - Mon May 28 00:42:02 2018
script_ob=410
script_sb=10
env_ob=418
env_sb=8
fdt_size=65536
fdt_offset=90000
fdt_sb=80
fdt_ob=490
kernel_size=3751621
kernel_offset=a0000
kernel_sb=1ca0
kernel_ob=510
ramdisk_size=4902976
ramdisk_offset=440000
ramdisk_sb=2569
ramdisk_ob=2210
mtd=mtdparts=W25q128-flash.0:512k(uboot),64k(script),64k(dtb),3712k(kernel),4800k(initrd),7232k(user),-@0(full)
mmcparts=uboot=524288;script=65536;dtb=65536;kernel=3801088;initrd=4915200;user=7405568

#end

MMC_INFO_HEADER
16777216
orange_pi_R1_net.MMC.hybrid.16M.8192.bin
miZy_spi_image_builder Mon May 28 00:42:02 2018 ## hyphop ##
BLOCKS
32768

[i] save firmwares/orange_pi_R1_net.MMC.hybrid.16M.8192.bin 16785408 bytes
[i] ./ miZy_spi_image_builder => CONF: miZy_spi_image_builder.conf.fast
[i] rewrite @IMG
[i] 16M bytes => firmwares/orange_pi_R1_net.SPI.%s.bin
[i]     MTD_PART 0xHEX_SIZE( DEC_SIZE){ USED_SZ} FILES
[i]        uboot 0x00080000(   524288){  464279} u-boot-mizi.bin
[i]       script 0x00010000(    65536){    6099} boot.all.cmd boot.all.env boot.spi.env
[i]          dtb 0x00010000(    65536){   35048} script.bin
[i]       kernel 0x003A0000(  3801088){ 3751621} uImage.lzo
[i]       initrd 0x004B0000(  4915200){ 4902976} uInitrd.sfs
[i]         user 0x00710000(  7405568){       0} 
[i] readed 464279(464279) bytes from bin.local/u-boot-mizi.bin
[i] pad 464279 + 60009 => 524288
[i] readed 3988(3988) bytes from bin.local/boot.all.cmd
[i] pad 4060 + 36 => 4096
[i] readed 1749(1749) bytes from bin.local/boot.all.env
[i] readed 362(362) bytes from bin.local/boot.spi.env
[i] pad 2111 + 59329 => 61440
[i] readed 35048(35048) bytes from bin.local/script.bin
[i] pad 35048 + 30488 => 65536
[i] 3801088 = int( 3751621 / 65536 ) * 65536; at ./miZy_spi_image_builder line 386.
[i] readed 3751621(3751621) bytes from bin.local/uImage.lzo
[i] pad 3751621 + 49467 => 3801088
[i] 4915200 = int( 4902976 / 65536 ) * 65536; at ./miZy_spi_image_builder line 386.
[i] readed 4902976(4902976) bytes from bin.local/uInitrd.sfs
[i] pad 4902976 + 12224 => 4915200
[i] free_size 7405568 bytes!
[i] pad 0 + 7405568 => 7405568
[i] pad 16777216 + 0 => 16777216
[i] readed 1749(1749) bytes from bin.local/boot.all.env
[i] pad 2183 + 59257 => 61440
[i] override env (boot.spi.env) =>
# auto generated by ./miZy_spi_image_builder - Mon May 28 00:42:02 2018
script_ob=410
script_sb=10
env_ob=418
env_sb=8
fdt_size=65536
fdt_offset=90000
fdt_sb=80
fdt_ob=490
kernel_size=3751621
kernel_offset=a0000
kernel_sb=1ca0
kernel_ob=510
ramdisk_size=4902976
ramdisk_offset=440000
ramdisk_sb=2569
ramdisk_ob=2210
mtd=mtdparts=W25q128-flash.0:512k(uboot),64k(script),64k(dtb),3712k(kernel),4800k(initrd),7232k(user),-@0(full)

#end
[i] save firmwares/orange_pi_R1_net.SPI.16M.bin 16777216 bytes
[i] pack gzip > /tmp/orange_pi_R1_net.MMC.hybrid.16M.8192.bin.gz
[i] pack gzip > /tmp/orange_pi_R1_net.SPI.16M.bin.gz

```