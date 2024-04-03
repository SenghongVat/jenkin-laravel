#!/bin/bash
export TZ="Asia/Phnom_Penh"
# Git Log Pretty Format
COMMITTER=$(git log -1 --pretty=format:%cN)
COMMIT_MSG=$(git log -1 --pretty=format:%s)
COMMIT_LINK=$(git log -1 --pretty=format:%h)

# Date Format: e.g, Thursday, 29-Feb-2024
DATE=$(date "+%A, %d-%b-%Y")

# Time Format: HH:MM:SS
TIME="<i>$(date +%T)</i>"

# Text message
# $BUILD_NUMBER - Set for current build number "e.g, 1,2,3"
EMAIL="DEPLOYMENT STATUS"
MESSAGE="<b>🚀DEPLOYMENT STATUS</b>: $1%0A%0A<b>🔁VERSION</b>: $BUILD_NUMBER%0A%0A<b>👨🏻‍💻COMMITTER</b>: $COMMITTER%0A%0A<b>✍️MESSAGE</b>: $COMMIT_MSG%0A%0A<b>📅DATETIME</b>: $DATE $TIME⏰%0A%0A<u>LINK TO SEE COMMIT</u>: https://github.com/SenghongVat/jenkin-laravel/commits/tp03/$COMMIT_LINK"

# Send Message to Telegram
curl https://api.telegram.org/bot${BOT_TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d text="${MESSAGE}" -d parse_mode="HTML"

# Send Email
# echo -e "${MESSAGE}" | mail -s "DEPLOYMENT STATUS" "${EMAIL_RECIPIENT}"

# echo "Test message" | mail -s "Test subject" vatsenghong.com
