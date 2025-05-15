
#!/bin/bash

# Define an array of time zones
timezones=("UTC" "America/New_York" "Europe/London" "Asia/Tokyo" "Australia/Sydney")

# Loop through the time zones and display the current time
for tz in "${timezones[@]}"; do
    echo "Current time in $tz: $(TZ=$tz date '+%Y-%m-%d %H:%M:%S')"
done
