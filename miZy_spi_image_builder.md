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

# LINKS

- [https://github.com/hyphop/miZy\_spi\_image\_builder](https://github.com/hyphop/miZy_spi_image_builder)
- [https://hyphop.github.io/mizy/](https://hyphop.github.io/mizy/)
- [https://github.com/hyphop/miZy-uboot](https://github.com/hyphop/miZy-uboot)
- [https://github.com/hyphop/miZy-linux-kernel](https://github.com/hyphop/miZy-linux-kernel)

# EXAMPLE image building output log

    [i] ./ miZy_spi_image_builder => CONF: ./miZy_spi_image_builder.conf
    [i] 8M bytes => orange_pi_zero_hyphop_mizy_spi_flash_demo-%s.bin
    [i]     MTD_PART 0xHEX_SIZE( DEC_SIZE){ USED_SZ} FILES
    [i]        uboot 0x00080000(   524288){  463470} u-boot-mizi.bin
    [i]       script 0x00010000(    65536){    5371} boot.all.cmd boot.all.env boot.spi.env
    [i]          dtb 0x00010000(    65536){   34364} orangepizero.bin
    [i]       kernel 0x00300000(  3145728){ 3083834} uImage.lzma
    [i]       initrd 0x00420000(  4325376){ 2170944} uinitrd.sfs
    [i]         user 0x00010000(    65536){       0} 
    [i] readed 463470(463470) bytes from bin.local/u-boot-mizi.bin
    [i] pad 463470 + 60818 => 524288
    [i] readed 2998(2998) bytes from bin.local/boot.all.cmd
    [i] pad 3142 + 954 => 4096
    [i] readed 2011(2011) bytes from bin.local/boot.all.env
    [i] readed 362(362) bytes from bin.local/boot.spi.env
    [i] pad 6469 + 59067 => 65536
    [i] readed 34364(34364) bytes from bin.local/orangepizero.bin
    [i] pad 34364 + 31172 => 65536
    [i] readed 3083834(3083834) bytes from bin.local/uImage.lzma
    [i] pad 3083834 + 61894 => 3145728
    [i] readed 2170944(2170944) bytes from bin.local/uinitrd.sfs
    [i] pad 2170944 + 2154432 => 4325376
    [i] pad 0 + 65536 => 65536
    [i] pad 8192000 + 196608 => 8388608
    [i] save orange_pi_zero_hyphop_mizy_spi_flash_demo-8M.bin 8388608 bytes
