# Function definitions. Sourced by ~/.bash_profile
rake () if [ -e bin/rake ]; then (bin/rake $*); else (`which rake` $*); fi
rspec () if [ -e bin/rspec ]; then (bin/rspec $*); else (`which rspec` $*); fi
bundle () if [ -e bin/bundle ]; then (bin/bundle $*); else (`which bundle` $*); fi
rails () if [ -e bin/rails ]; then (bin/rails $*); else (`which rails` $*); fi

mp () { mpc toggle; }

g () { git $*; }
d () { docker $*; }

alpine () { docker run --rm -it bjjb/devbox:alpine ${*:-sh}; }
ubuntu () { docker run --rm -it bjjb/devbox:ubuntu ${*:-bash}; }

shuffle () {
  ruby -e 'puts ARGF.read.split("\n").reject(&:nil?).compact.shuffle.join("\n")'
}

digitalocean () {
  curl -X GET                                             \
    -H "Content-Type: application/json"                   \
    -H "Authorization: Bearer $DIGITALOCEAN_ACCESS_TOKEN" \
    "https://api.digitalocean.com/v2/$1" | jsonpp;
}

cfddns () {
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

[[ -x "$HOME/.functions.bash" ]] && . "$HOME/.functions.bash"
