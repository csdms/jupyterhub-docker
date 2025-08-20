#! /usr/bin/env bash
# See https://github.com/pyvista/pyvista/issues/155#issuecomment-480281636

export DISPLAY=:99.0
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
sleep 3
exec "$@"
