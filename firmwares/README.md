firmware images output there in ../firmwares/

== HYBRYD IMAGE

fdisk orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin

first partition offset is 16384 (16384 * 512 = 8388608 = 8M)

== HOST/DEVICE image SD/MMC write

    dd of=/dev/mmcblk0 < orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin

== HOST mkfs for iamge

make loop     

    losetup --show -f -o 8388608 orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin
    >/dev/loop3

makefs on loop

    mkfs.vfat /dev/loop3

mount loop

    mount /dev/loop3

== HOST mount image partition

    mount -o offset=8388608 orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin mmc_part_1

== DEVICE check boot source 

if booted from sd/mmc

    cat /proc/cmdline | egrep -o bootfrom=\\w+
    > bootfrom=MMC

if booted from spi

    cat /proc/cmdline | egrep -o bootfrom=\\w+
    > bootfrom=spi

== DEVICE mount partition

    mkdir /tmp/mmc_part_1
    mount /dev/mmcblk0p1 /tmp/mmc_part_1

== MMC IMAGE write 

    dd of=/dev/mmcblk0 < orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin

