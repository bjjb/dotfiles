# Function definitions. Sourced by ~/.bash_profile

# This insanely useful option ensures that the result of a pipe is the result
# of the last failing command
set -o pipefail

# Check whether an executable can be found
have() {
  which $@ > /dev/null
}

# Music Player Client
mp () { have mpc && mpc toggle; }
opus123 () {
  have opusdec out123 || echo "Need opusdec and out123" && return
  for f in "$@"
  do
    opusdec --quiet --force-wav "$*" - | out123
  done
}

# git aliases
g () { have git && git $*; }

# docker aliases
d () { have docker && docker $*; }
dm () { have docker-machine && docker-machine $@; }
devbox () { docker run --rm -it bjjb/devbox sh; }
alpine () { docker run --rm -it bjjb/devbox:alpine ${*:-sh}; }
ubuntu () { docker run --rm -it bjjb/devbox:ubuntu ${*:-bash}; }

# tmux aliases
tn () { tmux new-session -s ${1:-${PWD##*/}}; }
ta () { tmux attach-session; }

# Randomize the args
shuffle () {
  have ruby || echo "Missing ruby" && return
  ruby -e <<EOF
  puts ARGF.read.split("\n").reject(&:nil?).compact.shuffle.join("\n")
EOF
}

# Simple digitalocean client
digitalocean () {
  have curl jsonpp || echo "Missing curl or jsonpp" && return
  curl -X GET                                             \
    -H "Content-Type: application/json"                   \
    -H "Authorization: Bearer $DIGITALOCEAN_ACCESS_TOKEN" \
    "https://api.digitalocean.com/v2/$1" | jsonpp;
}

# Gets the locally set IP address
myipv6 () {
  have ip || echo "Missing ip" && return
  ip -o -6 address \
    | grep -v 'deprecated' \
    | awk '/global/ { print $4 }' \
    | cut -d '/' -f1 \
    | head -1;
}

# Use imagemagick to remove a white background from an image
transparentize () {
  have convert || echo "Missing imagemagick (convert)"
  input=${1:?'Usage: transparentize <input> <output>'}
  output=${2:?'Usage: transparentize <input> <output>'}
  convert "$input" -fill none -draw "color 1,1 floodfill" "$output"
}

# Source local functions also, if present.
[[ -x "$HOME/.functions.bash" ]] && . "$HOME/.functions.bash"
