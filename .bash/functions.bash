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
  have ruby || return "Missing ruby"
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
  have ip || return "Missing ip"
  ip -o -6 address \
    | grep -v 'deprecated' \
    | awk '/global/ { print $4 }' \
    | cut -d '/' -f1 \
    | head -1;
}

# Simple cloudflare DDNS client
cfddns () {
  have cloudflarer || echo "Missing cloudflarer" && return
  name=${1:?'Usage: cfddns <fqdn>'} # 1st arg (required): the full domain name
  zone=${1#*.} # the zone - everything after the first dot
  zid=$(cloudflarer zones | grep "$zone" | cut -d' ' -f1) # the CF zone ID
  newip=$(dig +short myip.opendns.com @resolver1.opendns.com) # new address
  record=$(cloudflarer records -z $zid | grep $name) # existing CF record
  oldip=${record##* } # existing address according to CF record
  if [ "$oldip" != "$newip" ]; then # we need to update
    echo "Old: ${oldip:-unset}: -> New: $newip"
    if [ "$oldip" != "" ]; then # we need to delete the old record
      rid=${record%% *} # the CF record ID
      cloudflarer records delete -z $zid $rid
    fi
    # create a new record for the entry
    cloudflarer records create -z $zid --name $name --type A --content $newip
  fi
}

# Source local functions also, if present.
[[ -x "$HOME/.functions.bash" ]] && . "$HOME/.functions.bash"
