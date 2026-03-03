#!/bin/sh
echo "Starting Milena's All-Key Monitoring Service..."

# משתנה שישמור את רשימת המפתחות שכבר ראינו
KNOWN_KEYS=""

while true; do
  # 1. קבלת רשימה של כל המפתחות הקיימים ב-Redis
  CURRENT_KEYS=$(redis-cli -h db KEYS "*")

  for KEY in $CURRENT_KEYS; do
    # בדיקה אם המפתח קיים ברשימת המפתחות המוכרים שלנו
    case "$KNOWN_KEYS" in
      *"|$KEY|"*) ;; # אם הוא כבר מוכר, לא עושים כלום
      *) 
        # אם הוא חדש - מתריעים!
        VALUE=$(redis-cli -h db GET "$KEY")
        echo "------------------------------------------"
        echo "🚀 ALERT: NEW KEY DETECTED ANYWHERE!"
        echo "Key Name: $KEY"
        echo "Value: $VALUE"
        echo "------------------------------------------"
        
        # הוספת המפתח לרשימת המוכרים
        KNOWN_KEYS="$KNOWN_KEYS|$KEY|"
        ;;
    esac
  done

  # עדכון המפתח הרגיל כדי להראות שהמערכת חיה
  DATE=$(date)
  redis-cli -h db SET last_check "$DATE"
  
  sleep 5 # הורדתי ל-5 שניות כדי שזה יגיב מהר יותר
done
