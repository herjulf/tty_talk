
To build:
make

To install:
make install


Can be used to trigger a SW reboot so flashing can be done without pressing
the HW reset button.

For RIOT-OS applications the command below should be added to the commands

static int cmd_upgr(__attribute__((unused)) int ac, __attribute__((unused)) char **av)
{
 printf("OK\n");
 pm_reboot();
 return 0;
}

An example script is provided upgrade-RSS2.sh.
Example uploading a RIOT firmware:

> upgrade-RSS2.sh bin/avr-rss2/track.elf

Using device=/dev/ttyUSB0 baud=115200 firmware=bin/avr-rss2/track.elf

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.04s

avrdude: Device signature = 0x1ea802 (probably m256rfr2)
avrdude: erasing chip
avrdude: reading input file "./bin/avr-rss2/track.elf"
avrdude: input file ./bin/avr-rss2/track.elf auto detected as ELF
avrdude: writing flash (54662 bytes):

Writing | ################################################## | 100% 13.69s

avrdude: 54662 bytes of flash written
avrdude: safemode: Fuses OK (E:F6, H:98, L:46)
avrdude done.  Thank you.

