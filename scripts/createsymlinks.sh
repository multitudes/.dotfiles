#!/bin/bash
# Login setup for 42 Berlin. Home is already mounted when this runs.
# ~/goinfre -> /goinfre/$USER (local disk on this machine)
# ~/sgoinfre -> /sgoinfre/goinfre/Perso/$USER (NFS, shared across machines)

systemctl --user stop docker.service 2>/dev/null || true

if [ ! -d "$HOME/goinfre" ]; then
    echo "createsymlinks: $HOME/goinfre is not a directory" >&2
    exit 1
fi
GOINFRE="$(readlink -f "$HOME/goinfre")"
DOCKER_DATA="$GOINFRE/docker"

# mkdir -p reports "File exists" when the path is a dangling symlink, and
# then creating daemon.json fails with "No such file or directory".
ensure_dir() {
    local dir="$1"
    if [ -L "$dir" ] && [ ! -d "$dir" ]; then
        echo "createsymlinks: removing dangling symlink $dir -> $(readlink "$dir")" >&2
        rm -f "$dir"
    elif [ -e "$dir" ] && [ ! -d "$dir" ]; then
        echo "createsymlinks: $dir exists and is not a directory" >&2
        ls -ld "$dir" >&2
        exit 1
    fi
    mkdir -p "$dir"
}

ensure_dir "$GOINFRE/.docker"
ensure_dir "$GOINFRE/.cache"
ensure_dir "$DOCKER_DATA"
ensure_dir "$HOME/.config"
ensure_dir "$HOME/.config/docker"
ensure_dir "$HOME/.local/share"

rm -rf "$HOME/.docker"
ln -sfn "$GOINFRE/.docker" "$HOME/.docker"

rm -rf "$HOME/.cache"
ln -sfn "$GOINFRE/.cache" "$HOME/.cache"

# Rootless dockerd follows ~/.local/share/docker and then tries to mount
# overlay2. On sgoinfre that mount fails with "permission denied" because the
# filesystem is NFS, and the daemon exits. Image data has to live on the
# local goinfre disk, addressed by its real path in daemon.json.
# A symlink here would send the daemon back to sgoinfre, so remove only a
# symlink and leave a normal directory in its place.
if [ -L "$HOME/.local/share/docker" ]; then
    rm -f "$HOME/.local/share/docker"
fi
mkdir -p "$HOME/.local/share/docker"

python3 - "$DOCKER_DATA" "$HOME/.config/docker/daemon.json" <<'PY'
import json
import sys

root, path = sys.argv[1], sys.argv[2]
try:
    with open(path) as fh:
        cfg = json.load(fh)
    if not isinstance(cfg, dict):
        cfg = {}
except (FileNotFoundError, json.JSONDecodeError):
    cfg = {}
cfg["data-root"] = root
with open(path, "w") as fh:
    json.dump(cfg, fh, indent=2)
    fh.write("\n")
PY

ln -sfn "$HOME/.dotfiles/gdb/.gdbinit" "$HOME/.gdbinit"
rm -rf "$HOME/.oh-my-zsh"
ln -sfn "$HOME/.dotfiles/oh-my-zsh" "$HOME/.oh-my-zsh"

# A failed unit is rate-limited ("Start request repeated too quickly")
# until the failure is cleared.
systemctl --user reset-failed docker.service 2>/dev/null || true
if ! systemctl --user start docker.service; then
    echo "createsymlinks: docker.service failed to start" >&2
    systemctl --user status docker.service --no-pager >&2 || true
    journalctl --user -u docker.service -n 30 --no-pager >&2 || true
    exit 1
fi
