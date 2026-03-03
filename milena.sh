#!/bin/sh
# הגדרת צבעים להודעות בטרמינל
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Milena's Advanced Monitoring Service is LIVE...${NC}"

# רשימת מפתחות שכבר ראינו
KNOWN_KEYS=""

# עדכון סטטוס התחלה ב-Redis
redis-cli -h db SET system_status "Running since $(date)"

while true; do
  # 1. בדיקת פקודת חירום (Kill Switch)
  EMERGENCY=$(redis-cli -h db GET emergency)
  if [ "$EMERGENCY" = "STOP" ]; then
    echo -e "${RED}🚨🚨🚨 EMERGENCY STOP RECEIVED! 🚨🚨🚨${NC}"
    
    # עדכון סטטוס יציאה ב-Redis - כדי שנדע בדפדפן למה זה נעצר
    redis-cli -h db SET system_status "Stopped manually at $(date)"
    redis-cli -h db SET emergency "COMPLETED"
    
    echo "System is shutting down... Goodbye Milena."
    break 
  fi

  # 2. סריקת כל המפתחות בבסיס הנתונים
  CURRENT_KEYS=$(redis-cli -h db KEYS "*")
  for KEY in $CURRENT_KEYS; do
    case "$KNOWN_KEYS" in
      *"|$KEY|"*) ;; # מפתח מוכר, דלג
      *) 
        VALUE=$(redis-cli -h db GET "$KEY")
        echo -e "${YELLOW}✨ Discovery:${NC} New Key [${GREEN}$KEY${NC}] = $VALUE"
        KNOWN_KEYS="$KNOWN_KEYS|$KEY|"
        ;;
    esac
  done

  # 3. עדכון דופק (Heartbeat) - סימן חיים בדפדפן
  redis-cli -h db SET last_heartbeat "$(date)"
  
  sleep 5
done
