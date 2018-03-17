# Local Ruby installation
chruby="/usr/local/share/chruby/chruby.sh"
[ -f "$chruby" ] && . $chruby
# Use the .ruby-version trick
auto="/usr/local/share/chruby/auto.sh"
[ -f "$auto" ] && . $auto
