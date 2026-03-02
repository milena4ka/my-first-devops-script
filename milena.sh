#!/bin/bash

# 1. הדפסת כותרת יפה
echo "--- SERVER STATUS REPORT ---"

# 2. מי המשתמש שמריץ את הסקריפט?
echo "Hello, $(whoami)!"

# 3. מה התאריך והשעה עכשיו?
echo "Current date: $(date)"

# 4. בדיקת מקום פנוי בדיסק (בצורה נוחה לקריאה)
echo "Disk space status:"
df -h | grep '^/'

echo "---------------------------"
