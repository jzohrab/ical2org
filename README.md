# Syncing google cal to emacs

Ref https://orgmode.org/worg/org-tutorials/org-google-sync.html

Perhaps `chmod a+x ical2org.awk`

Copy `ical2org.config.example` to `ical2org.config` and edit it.


## Script to wget and run awk (example):

Save this and `chmod a+x`.

```
#!/bin/bash

URL=your-google-private-url
TEMPFILE=/path/to/temp.ics
ICSFILE=/path/to/final/basic.ics
ORGFILE=~/path/to/org/schedule.org
CONFIGFILE=/path/to/ical2org.config
PROGFILE=/path/to/ical2org.awk

# Run it
/usr/local/bin/wget -O $TEMPFILE $URL

# Testing
# rm "$TEMPFILE"

if [[ -s $TEMPFILE ]] ; then
    echo "got data in $TEMPFILE , updating calendar."
    cp "$TEMPFILE" "$ICSFILE"
    set -o allexport \
        && source "$CONFIGFILE" \
        && set +o allexport \
        && /usr/local/bin/gawk -f "$PROGFILE" < $ICSFILE > $ORGFILE
else
    echo "$TEMPFILE is empty or doesn't exist, leaving existing file."
fi
```

## Crontab (on mac, at least)


Then set the crontab (`crontab -e`)


```
$ crontab -l
5,20,35,50 * * * * /path/to/your/script.sh
```

Refs:

* https://ole.michelsen.dk/blog/schedule-jobs-with-crontab-on-mac-osx/
* https://stackoverflow.com/questions/15395479/why-ive-got-no-crontab-entry-on-os-x-when-using-vim