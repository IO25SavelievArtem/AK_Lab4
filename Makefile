
ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := hello.o
EXTRA_CFLAGS += -std=gnu99
else
# normal makefile
KDIR ?= /home/arti/repos/linux-stable
ARCH := arm
CROSS_COMPILE := ccache\ arm-linux-gnueabihf-

default:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif
