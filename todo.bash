# Prints the contents of ~/TODO, if there is one.
# Put this in the .bash_profile to always be reminded of what you need to do
# today.
if [ -f ~/TODO ] ; then
  stat -f "%N - %t%Sm" TODO
  echo
  cat ~/TODO
  echo
else
  echo "Nothing to do..."
fi
