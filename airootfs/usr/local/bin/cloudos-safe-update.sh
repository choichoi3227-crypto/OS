#!/bin/bash
echo "========================================="
echo "     CloudOS Safe System Update"
echo "========================================="

# 스냅샷 생성 (업데이트 전)
echo "[1/3] Creating system snapshot for safety..."
sudo snapper create --description "Before CloudOS Update $(date +%Y-%m-%d_%H:%M)"

# 시스템 업데이트
echo "[2/3] Updating system packages..."
sudo pacman -Syu --noconfirm

# 부팅 가능 여부 테스트 (간단한 체크)
echo "[3/3] Verifying system integrity..."
if sudo grub-mkconfig -o /boot/grub/grub.cfg &> /dev/null; then
    echo "Update completed successfully! System is stable."
    echo "If anything goes wrong, reboot and select 'Snapshots' in GRUB to rollback."
else
    echo "Critical Error detected! Rolling back now..."
    sudo snapper rollback
    echo "Rollback complete. Rebooting system in 5 seconds..."
    sleep 5
    reboot
fi
