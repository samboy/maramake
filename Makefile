# Makefile for make!
.POSIX:

PREFIX = /usr/local
BINDIR = $(PREFIX)/bin

BIN = maramake
OBJS = check.o input.o macro.o main.o make.o modtime.o rules.o target.o utils.o

$(BIN): $(OBJS)
	$(CC) -o $@ $(OBJS)

$(OBJS): make.h

install: $(BIN)
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -f $(BIN) $(DESTDIR)$(BINDIR)/

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(BIN)

clean:
	rm -f $(BIN) $(OBJS)
