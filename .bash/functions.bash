# Function definitions. Sourced by ~/.bash_profile
rake () if [ -e bin/rake ]; then (bin/rake $*); else (`which rake` $*); fi
bundle () if [ -e bin/bundle ]; then (bin/bundle $*); else (`which bundle` $*); fi
rails () if [ -e bin/rails ]; then (bin/rails $*); else (`which rails` $*); fi

mp () { mpc toggle; }

g () { git $*; }
d () { docker $*; }

digitalocean () {
  curl -X GET                                             \
    -H "Content-Type: application/json"                   \
    -H "Authorization: Bearer $DIGITALOCEAN_ACCESS_TOKEN" \
    "https://api.digitalocean.com/v2/$1" | jsonpp;
}
