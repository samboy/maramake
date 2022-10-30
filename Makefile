# Makefile for make!
.POSIX:

PREFIX = /usr/local
BINDIR = $(PREFIX)/bin

OBJS = check.o input.o macro.o main.o make.o modtime.o rules.o target.o utils.o

maramake: $(OBJS)
	$(CC) -o maramake $(OBJS)

$(OBJS): make.h

install: make
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -f make $(DESTDIR)$(BINDIR)/pdpmake

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/pdpmake

clean:
	rm -f $(OBJS) make maramake
