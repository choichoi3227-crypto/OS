#!/bin/bash
# 부팅 시 자동으로 Btrfs 볼륨 설정 (Snapper용)
if [ ! -f /etc/cloudos-fs-initialized ]; then
    sudo snapper create-config /
    sudo systemctl enable snapper-timeline.timer
    sudo systemctl start snapper-timeline.timer
    touch /etc/cloudos-fs-initialized
fi
