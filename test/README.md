# Sort-of-testing

Copy a downloaded .ics file to somewhere for testing.

Get baseline:

```
./runprog.sh ../ical2org.config input.ics output_1.org
```

Make changes to ../ical2org.awk

Run and check:

```
./runprog.sh ../ical2org.config input.ics output_2.org; diff output_1.org output_2.org
```