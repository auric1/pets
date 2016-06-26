pettab() {
	local cur=${COMP_WORDS[COMP_CWORD]}
	local prev=${COMP_WORDS[COMP_CWORD-1]}

	petcage="/etc/pets/cage/"
	petfiles="$(find $petcage -maxdepth 1 -type f -exec basename {} \;)"


	if [ $COMP_CWORD -eq 1 ] ;then
		COMPREPLY=( $(compgen -W "start stop sync list" -- $cur) )
	elif [ $COMP_CWORD -eq 2 ] ;then
		case "$prev" in
			list|start|sync|stop)
				COMPREPLY=( $( compgen -W "$petfiles" -- $cur ) );return 0
			;;
               esac
	elif [ $COMP_CWORD -ge 3 ] ;then return 1
	fi
}

complete -F pettab pets
