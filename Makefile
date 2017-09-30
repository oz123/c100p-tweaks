.PHONY: install modprodbe

default:
	gcc -O2 -lm c100p.tablet-mode.c -o c100p.tablet-mode && strip c100p.tablet-mode

systemd:
	gcc -O2 -DUSE_SYSTEMD -DXAUTHDIR=$(HOME) -lm c100p.tablet-mode.c -o c100p.tablet-mode `pkg-config --cflags --libs glib-2.0` && strip c100p.tablet-mode

modprobe:
	# keeps wifi alive after suspend
	cp c100p.modules.conf /etc/modprobe.d/c100p.modules.conf 
	# allows normal user to control the backlight
	cp c100p.backlight.conf /etc/tmpfiles.d/c100p.backlight.conf

install:
	cp c100p.tablet-mode /usr/bin
	cp c100p.service /etc/systemd/system
	mkdir -p /etc/c100p
	cp c100p.conf /etc/c100p


