CFLAGS?=-Wall
LDFLAGS?=-static
tty_talk:	tty_talk.o devtag-allinone.o
install:	tty_talk
	strip tty_talk
	mkdir -p $(DESTDIR)/$(PREFIX)/bin
	cp -p tty_talk $(DESTDIR)/$(PREFIX)/bin
clean:
	rm -f *.o tty_talk

