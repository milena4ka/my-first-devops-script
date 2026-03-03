#!/bin/sh
echo "Starting Milena's Monitoring Service..."

while true; do
  # בדיקה אם המפתח החדש שנוצר מהטרמינל קיים
  NEW_KEY_VAL=$(redis-cli -h db GET devops_status)
  
  if [ -n "$NEW_KEY_VAL" ]; then
    echo "------------------------------------------"
    echo "🌟 NEW KEY DETECTED: devops_status"
    echo "Value: $NEW_KEY_VAL"
    echo "------------------------------------------"
  fi

  # עדכון והדפסה של המפתח הרגיל
  DATE=$(date)
  redis-cli -h db SET last_check "$DATE"
  echo "[$(date)] Monitoring active..."
  
  sleep 10
done
