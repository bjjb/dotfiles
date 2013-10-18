if [ -r /usr/local/share/chruby/chruby.sh ] ; then
  . /usr/local/share/chruby/chruby.sh
fi 

if [ -r /usr/local/share/chruby/auto.sh ] ; then
  . /usr/local/share/chruby/auto.sh
fi 

chruby 2.0
