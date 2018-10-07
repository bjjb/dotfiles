# Local Ruby installation
chruby="/usr/local/share/chruby/chruby.sh"
[ -f "$chruby" ] && . $chruby
# Use the .ruby-version trick
auto="/usr/local/share/chruby/auto.sh"
[ -f "$auto" ] && . $auto

rake () { [ -e bin/rake ] && bin/rake $@ || $(which -s rake) $@ ; }
rails () { [ -e bin/rails ] && bin/rails $@ || $(which -s rails) $@ ; }
rspec () { [ -e bin/rspec ] && bin/rspec $@ || $(which -s rspec) $@ ; }
guard () { [ -e bin/guard ] && bin/guard $@ || $(which -s guard) $@ ; }
rackup () { [ -e bin/rackup ] && bin/rackup $@ || $(which -s rackup) $@ ; }
dotenv () { [ -e bin/dotenv ] && bin/dotenv $@ || $(which -s dotenv) $@ ; }
rubocop () { [ -e bin/rubocop ] && bin/rubocop $@ || $(which -s rubocop) $@ ; }
