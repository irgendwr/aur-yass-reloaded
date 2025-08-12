#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/yass-reloaded.conf ]]; then
	YASS_RELOADED_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/yass-reloaded-flags.conf | tr '\n' ' ')"
fi

# prefer java 24 or later
export PATH="/usr/lib/jvm/java-24-openjdk/bin/:/usr/lib/jvm/java-25-openjdk/bin/:/usr/lib/jvm/java-26-openjdk/bin/:$PATH"

java --module-path /usr/lib/jvm/java-*-openjfx/lib --add-modules "javafx.base,javafx.web,javafx.graphics,javafx.fxml,javafx.media,javafx.swing,javafx.controls" -jar "/usr/share/java/yass-reloaded.jar" "$@" $YASS_RELOADED_USER_FLAGS
