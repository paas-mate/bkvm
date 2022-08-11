#!/bin/bash
# copy from https://github.com/diennea/bookkeeper-visual-manager
set -e
env | while IFS='=' read -r n v; do
    if [[ "$n" == BKVM_* ]]; then
      property=${n/BKVM_/}
      property=${property/_/\.}
      escaped_value=$(printf '%s\n' "$v" | sed -e 's/[\/&]/\\&/g')
      sed -i "s/$property.*/$property=$escaped_value/g" /opt/sh/bkvm/conf/server.properties
      printf "Setting configuration entry %s: %s\n" "$property" "$v"
    fi
done

exec "$@"
