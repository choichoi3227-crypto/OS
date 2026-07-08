#!/bin/bash
# CloudOS 환경 부팅 스크립트

# 1. 기존 CloudOS 백엔드/프론트엔드 서버 실행 (예: Node.js)
echo "Starting CloudOS Core Backend..."
cd /opt/cloudos-original
# npm install이 안 되어 있다면 실행
if [ ! -d "node_modules" ]; then
    npm install
fi
# 백그라운드에서 서버 실행 (포트 8080 예시, 실제 프로젝트 포트로 수정)
nohup npm start > /var/log/cloudos-core.log 2>&1 &

# 2. 서버가 켜질 때까지 대기
echo "Waiting for CloudOS UI to load..."
while ! curl -s http://localhost:8080 > /dev/null; do
    sleep 1
done

# 3. Chromium을 Kiosk(전체화면 앱) 모드로 실행하여 기존 OS UI 표시
# --no-first-run 등의 옵션으로 완벽한 앱처럼 보이게 함
chromium --noerrdialogs --disable-infobars --kiosk http://localhost:8080 --start-maximized &
