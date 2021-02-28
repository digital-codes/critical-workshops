#!/bin/bash

m5dir="$HOME/local/m5burner/"
m5b="m5burner"
m5bin="$m5dir/bin/$m5b"
if [ ! -x "$m5bin" ] ; then
    echo "m5burner not found in default location ($m5dir), searching..."
    if [ -n "$(which m5burner)" ] ;then
        m5bin=$(which m5burner)
    else
        m=$(find "$HOME" -maxdepth 4 -type f -name "$m5b"| head -n 1)
        if [ -x "$m" ] ; then
            m5bin="$m"
        else
            echo "...not found, exiting"
            exit 1
        fi
    fi
fi

"$m5bin" --no-sandbox
