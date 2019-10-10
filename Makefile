CFLAGS+=$(shell pkg-config --cflags --libs libbsd-overlay) -D_GNU_SOURCE

all: man

man: man.c manconf.c raise_default_signal.c

install: all
	install -d $(DESTDIR)/usr/bin
	install man $(DESTDIR)/usr/bin
	install -d $(DESTDIR)/usr/share/man/man1
	install -m644 man.1 $(DESTDIR)/usr/share/man/man1
	install -d $(DESTDIR)/usr/share/man/man5
	install -m644 man.conf.5 $(DESTDIR)/usr/share/man/man5
	install -d $(DESTDIR)/etc
	install -m644 man.conf $(DESTDIR)/etc
