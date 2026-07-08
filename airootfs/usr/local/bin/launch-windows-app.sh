#!/bin/bash
APP_PATH="$1"

if [[ "$APP_PATH" == *.exe || "$APP_PATH" == *.msi ]]; then
    # Bottles가 설치되어 있으면 Bottles 런처 사용
    if command -v bottles &> /dev/null; then
        bottles run -e "$APP_PATH"
    else
        # 없으면 기본 Wine 사용
        wine "$APP_PATH"
    fi
else
    # 윈도우 파일이 아니면 기본 리눅스 프로그램으로 실행
    xdg-open "$APP_PATH"
fi
