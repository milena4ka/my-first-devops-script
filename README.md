# 🚀 Redis Monitoring Dashboard System

פרויקט DevOps המציג מערכת ניטור אוטומטית המבוססת על Docker ו-Redis.

## 🛠 טכנולוגיות בפרויקט
* **Docker & Docker Compose**: ניהול קונטיינרים.
* **Redis**: בסיס נתונים מהיר לאחסון סטטוסים.
* **Redis Commander**: ממשק ויזואלי (Dashboard) לניהול הנתונים.
* **Bash Scripting**: אוטומציה של ניטור ועדכון נתונים.

## 🏗 ארכיטקטורה
המערכת מורכבת מ-3 שירותים מרכזיים:
1. **App**: סקריפט Bash שדוגם את ה-Redis ומקפיץ התראות.
2. **DB**: שרת Redis יציב עם שמירת נתונים (Volumes).
3. **Dashboard**: ממשק גרפי הנגיש בפורט 8081.

## 🚀 איך להריץ את הפרויקט?
```bash
# שכפול הפרויקט
git clone https://github.com/milena4ka/my-first-devops-script

# הרצה בלחיצת כפתור
sudo docker-compose up -d --build

---

### 3. שמירה ושליחה ל-GitHub
אחרי שהדבקת ושמרת את הקובץ (`Ctrl+O` ו-`Ctrl+X`), נשלח את העדכון לענן:

```bash
git add README.md
git commit -m "Added a professional README to the project"
git push
