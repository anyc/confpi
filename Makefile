
INSTALL?=install

prefix?=/usr/local
bindir?=$(prefix)/bin
sysconfdir?=/etc
libexecdir?=$(prefix)/libexec

all:

install:
	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
	
	$(INSTALL) -m 755 -d $(DESTDIR)$(sysconfdir)
	$(INSTALL) -m 755 -d $(DESTDIR)$(sysconfdir)/confpi.d
	
	$(INSTALL) -m 755 -d $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 755 -d $(DESTDIR)$(libexecdir)/confpi.d
	
	$(INSTALL) -m 755 confpi $(DESTDIR)$(bindir)
	
	sed -i "s,/etc,$(sysconfdir)," $(DESTDIR)$(bindir)/confpi
	
	$(INSTALL) -m 755 confpi.d/*.sh $(DESTDIR)$(libexecdir)/confpi.d/

postinst:
	[ -e $(sysconfdir)/confpi.d/99-models.sh ] || ln -s $(libexecdir)/confpi.d/99-models.sh $(sysconfdir)/confpi.d/
	confpi
