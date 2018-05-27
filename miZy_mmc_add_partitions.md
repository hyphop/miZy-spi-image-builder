## add partition to miZy mmc image

output raw mmc image

    MMC=1 img_name=firmwares/mizy_mmc_image.bin  ./miZy_spi_image_builder 2>&1 | 
	tee /tmp/miZy_spi_image_builder.log

add one partiotion and write some readme info there

    ./miZy_mmc_add_partitions firmwares/mizy_mmc_image.bin 8x8 /tmp/miZy_spi_image_builder.log

## NOTE

```
fdisk 

    fdisk mizy_mmc_image.bin -l

    Disk mizy_mmc_image.bin: 16 MB, 16777216 bytes
    2 heads, 8 sectors/track, 2048 cylinders, total 32768 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0xdeedfeed

             Device Boot      Start         End      Blocks   Id  System
    mizy_mmc_image.bin1           16384       32767        8192   83  Linux
```

## usage image as nbd device

```
    qemu-nbd -c /dev/nbd0 mizy_mmc_image.bin

    blkid | grep miZy
    /dev/nbd0p1: SEC_TYPE="msdos" LABEL="miZy_Info" UUID="FEED-DEED" TYPE="vfat"

    fdisk -l /dev/nbd0
    ....

    mount /dev/nbd0p1 mount_point_mmc_part_1
    umount /dev/nbd0p1 

    qemu-nbd -d /dev/nbd0 

```
