#!/bin/sh
if [ "$(uname -s)" = "Linux" ] ;then
	PETS=/etc/pets/bin/pets
	LINK=/usr/sbin/pets
	INIT=/etc/init.d/pets
	if [ -r "$LINK" ] ;then unlink "$LINK" ;fi
	ln -sfv "$PETS" "$LINK"
	if [ -r "$INIT" ] ;then rm -rfv "$INIT" ;fi
	cp -av /etc/pets/doc/pets.init "$INIT"
fi
