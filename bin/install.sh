#!/bin/sh
if [ "$(uname -s)" = "Linux" ] ;then

	PETS=/etc/pets/bin/pets
	LINK=/usr/sbin/pets

	if [ -r "$LINK" ] ;then
		unlink "$LINK"
	fi
	ln -sfv "$PETS" "$LINK"

	if [ -d /etc/systemd/system ] ;then
		INIT=/etc/systemd/system/pets.service
		echo systemd detected - creating unit
		if [ -r "$INIT" ] ;then
			systemctl disable pets
			rm -rfv "$INIT"
		fi
		cp -av /etc/pets/doc/pets.service "$INIT"
		systemctl enable pets
	else
		INIT=/etc/init.d/pets
		echo using initserv - copying file
		if [ -r "$INIT" ] ;then
			rm -rfv "$INIT"
		fi
		cp -av /etc/pets/doc/pets.init "$INIT"
	fi

fi
