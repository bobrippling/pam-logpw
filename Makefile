.PHONY: all install

all:
	@echo run \'make install\'

install:
	cp pam-logpw /usr/local/sbin/pam-logpw
	cp pwattempts /etc/logrotate.d/
