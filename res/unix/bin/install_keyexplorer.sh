#!/bin/sh

. "$HOME/_install_toSource.sh" || exit 0
cd "$INSTALL_PATH"

if test -f keyexplorer -a -f plug
then
	echo "Enabling the KeyExplorer plugin"
	if test ! -d plugins; then mkdir plugins; fi 2>&1 >/dev/null
	PLUGINS="`cat plug`"
	echo "KeyExplorer;$PLUGINS" > plug2
	mv -f plug2 plug
	if test ! -f offline
	then
		java $JOPTS -jar bin/sha1test.jar KeyExplorer.jar plugins "$CAFILE" >/dev/null 2>&1
	fi
	rm -f keyexplorer
fi