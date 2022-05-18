CONFIGFILE="$1"
INFILE="$2"
OUTFILE="$3"

# "set -o allexport" gleaned from
# https://stackoverflow.com/questions/19331497/
#  set-environment-variables-from-file-of-key-value-pairs
set -o allexport \
    && source "$CONFIGFILE" \
    && set +o allexport \
    && /usr/local/bin/gawk -f ../ical2org.awk < $INFILE > $OUTFILE
