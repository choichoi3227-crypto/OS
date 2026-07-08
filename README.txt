CloudOS/
├── airootfs/                   # 실제 OS에 들어갈 파일 시스템
│   ├── etc/
│   │   ├── skel/               # 새 사용자 생성 시 복사될 파일 (기존 CloudOS UI 설정 등)
│   │   │   └── .config/
│   │   │       └── cloudos/    # 기존 프로젝트의 웹/프론트엔드 소스를 여기에 배치
│   │   └── systemd/            # 부팅 시 실행될 서비스들
│   │       └── system/
│   │           ├── cloudos-ui.service      # 기존 CloudOS UI 자동 실행 서비스
│   │           ├── winapps.service         # 윈도우 앱 호환 백엔드
│   │           └── macos-vm.service        # 맥 앱 호환 백엔드 (옵션)
│   └── usr/
│       ├── share/
│       │   └── cloudos-apps/   # 윈도우/맥 앱 실행용 스크립트 묶음
│       └── local/bin/
│           ├── launch-windows-app.sh
│           └── launch-mac-app.sh
├── efiboot/                    # 부트로더 커스텀 (CloudOS 로고 등)
├── pacman.conf                 # CloudOS 전용 패키지 저장소 설정
├── profiledef.sh               # archiso 빌드 프로필
└── packages.x86_64             # CloudOS에 기본으로 탑재될 패키지 리스트
