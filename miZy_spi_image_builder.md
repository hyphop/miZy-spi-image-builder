# ABOUT miZy\_spi\_image\_builder

SPI-flash firmware image builder (for sunxi Orange Pi Zero, another sunxi boards maybe work too )

Its just a part or miZy project, and same as other our parts can standalone used

This perl script no need any libs or another deps

# USAGE

help

    ./miZy_spi_image_builder --help

common usage for 8M image, output to out/orange\_pi\_zero\_hyphop\_mizy\_spi\_flash\_demo-8M.bin

    ./miZy_spi_image_builder

custom config

    ./miZy_spi_image_builder miZy-spi_image_builder_custom.conf

set 16M image size

    img_size=16M ./miZy_spi_image_builder

not padded by flash size, save only used space

    img_size=0 ./miZy_spi_image_builder

override image out name

    img_name=out/my_image_name%s.bin ./miZy_spi_image_builder

check build status in shell 

    ./miZy_spi_image_builder && echo "build ok"
    ./miZy_spi_image_builder || echo "build fail"

# Hybrid image 

by default miZy\_spi\_image\_builder generate hybrid image its simple raw image,
which can used for SPI and same for SD/MMC. this image equal spi-flash rom and
ready for direct write to SPI flash, but we can write this image to SD/MMC
for test work on device, and next copy this image to SPI from booted SD/MMC, 

write hybrid image to SD/MMC

    dd seek=16 bs=512 of=/dev/mmcblk0 < firmwares/mizy_spi_flash_demo-8M.bin

write hybrid image direct to SPI ( /dev/mtdblock5 - full size spi-flash mtd block dev)

    dd bs=65536 of=/dev/mtdblock5 < /tmp/mizy_spi_flash_demo-8M.bin

write hybrid image direct to SPI via mtd

    mtd write /tmp/mizy_spi_flash_demo-8M.bin full

write hybrid image to SPI via sunxi-tooll FEL mode from host machine

    sunxi-fel -p spiflash-write 0 firmwares/mizy_spi_flash_demo-8M.bin

# generate MMC image 

output raw mmc image (this image usable for mmc, not for SPI )

    MMC=1 img_name=firmwares/mizy_mmc_image.bin ./miZy_spi_image_builder 

add one partiotion and write some readme info there

    ./miZy_mmc_add_partitions firmwares/mizy_mmc_image.bin 8x8

write mmc image to SD/MMC

    dd of=/dev/mmcblk0 < firmwares/mizy_mmc_image.bin

# copy from booted MMC image to SPI, directly from working device 

    mmc_copy_to_spi
    mmc_copy_to_spi yes

    ## FOUND mizy hybrid image info:
    8388608                                                        
    mizy_mmc_image.bin                                             
    miZy_spi_image_builder Thu Apr  6 16:17:17 2017 ## hyphop ##   

    ## WRITE IMAGE CMD:
    > dd if=/dev/mmcblk0 skip=1 bs=8192 count=1024 of=/dev/mtdblock5
    1024+0 records in
    1024+0 records out
    8388608 bytes (8.0MB) copied, 45.987770 seconds, 178.1KB/s

ok system is ready for full loading from spi
now u can remove sd card, and reboot system from spi already!

# CONFIG FILE

default config

    miZy-spi_image_builder.conf

config file its a same pure perl code!

# PATHS

put your files (uboot scripts env fex/dtc kernel squashfs initramfs userdata) in @SCAN\_PATH dirs
by default are

    .
    ./bin
    ./bin.local

# miZy

tiny fast embedded linux, for sunxi Orange Pi Zero (and maybe other boards) and mods.
Now under active development, but is usable already )

# write image to device in FEL mode

in FEL mode via sunxi-fel tools

check spi flash size

    ./tools/fel_spi_info
    Manufacturer: Winbond (EFh), model: 40h, size: 16777216 bytes.

ok! write image - u can write any image size <= flash size

    ./tools/fel_spi_write firmwares/orange_pi_zero_hyphop_mizy_spi_flash_demo-8M.bin

# LINKS

- [https://github.com/hyphop/miZy-spi-image-builder](https://github.com/hyphop/miZy-spi-image-builder)
- [https://hyphop.github.io/mizy/](https://hyphop.github.io/mizy/)
- [https://github.com/hyphop/miZy-uboot](https://github.com/hyphop/miZy-uboot)
- [https://github.com/hyphop/miZy-linux-kernel](https://github.com/hyphop/miZy-linux-kernel)
