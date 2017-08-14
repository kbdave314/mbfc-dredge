# left.html center-left.html center.html center-right.html right.html questionable.html
echo -e "conspiracy" | \
  while read politics
  do
  wget "https://mediabiasfactcheck.com/$politics/" -O - | \
    sed -n "s/.*\"https:\/\/mediabiasfactcheck\.com\/\(.*\)\/\">\(.*\)<br \/>/\1/p" \
    | while read title 
    do
      wget -q -i"http://mediabiasfactcheck.com/$title/" -O - | \
        sed -n -f"sedscript.sed" | \
        LC_ALL=C sort -gb | \
        (tr '\n' ' ' "$@" && echo ) >> "$politics.dat" && sleep 0.02s &
    done
  done


# cat wonkette.html | \
#  sed -n -f"sedscript.sed" |\
#  sort -rg |\
#  tr '\n' ' '

# cat viral-liberty.html | \
#  sed -n -f"sedscript.sed" |\
#  sort -rg |\
#  tr '\n' ' '
