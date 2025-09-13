#!/bin/bash
export LANG="id_ID.UTF-8"

show_banner() {
    clear
    echo -e "\e[1;36m"
    echo "╔══════════════════════════════════════════════╗"
    echo "║             NOOKTHEME AUTO INSTALLER           "
    echo "║                  by RENDZZ                      "
    echo "╚══════════════════════════════════════════════╝"
    echo -e "\e[1;33m"
    echo "            🔥 Versi Terbaru 2024 🔥"
    echo ""
    echo -e "\e[1;32m📱 FOLLOW SOCIAL MEDIA RENDZZ:\e[0m"
    echo -e "\e[1;35m📺 YouTube: https://www.youtube.com/@renmodz45\e[0m"
    echo -e "\e[1;34m📷 Instagram: @rendzz\e[0m"
    echo -e "\e[1;36m👥 Facebook: Rendzz Modz\e[0m"
    echo -e "\e[1;33m"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║     © 2025 RENDZZ - All Rights Reserved         ║"
    echo "╚══════════════════════════════════════════════════╝"
    echo -e "\e[0m"
    echo ""
}

install_nooktheme() {
    echo -e "\e[1;32m🚀 Memulai instalasi NookTheme...\e[0m"
    echo ""
    
    # Progress animation
    echo -ne "\e[1;33m⏳ Memperbarui paket sistem...\e[0m"
    sudo apt update > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Menginstall dependencies...\e[0m"
    sudo apt install -y software-properties-common > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Menambahkan repository PHP...\e[0m"
    sudo add-apt-repository ppa:ondrej/php -y > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Menginstall PHP 8.3...\e[0m"
    sudo apt update > /dev/null 2>&1
    sudo apt install -y php8.3 > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Mematikan panel sementara...\e[0m"
    cd /var/www/pterodactyl && php artisan down > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Mendownload NookTheme...\e[0m"
    curl -L https://github.com/Nookure/NookTheme/releases/latest/download/panel.tar.gz | tar -xzv > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Mengatur permissions...\e[0m"
    chmod -R 755 storage/* bootstrap/cache > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Menginstall composer...\e[0m"
    composer install --no-dev --optimize-autoloader > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Membersihkan cache...\e[0m"
    php artisan view:clear && php artisan config:clear > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Migrasi database...\e[0m"
    php artisan migrate --seed --force > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Mengatur kepemilikan file...\e[0m"
    chown -R www-data:www-data /var/www/pterodactyl/* > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Merestart queue...\e[0m"
    php artisan queue:restart > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo -ne "\e[1;33m⏳ Menyalakan panel kembali...\e[0m"
    php artisan up > /dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 0.5
    done
    echo -e " \e[1;32m✓\e[0m"
    
    echo ""
    echo -e "\e[1;32m"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║          INSTALASI BERHASIL DILAKUKAN!          ║"
    echo "║        NookTheme berhasil diinstall!           ║"
    echo "╚══════════════════════════════════════════════════╝"
    echo -e "\e[0m"
    echo -e "\e[1;33m📝 Informasi:\e[0m"
    echo -e "\e[1;36m• Theme: NookTheme\e[0m"
    echo -e "\e[1;36m• Versi: Terbaru\e[0m"
    echo -e "\e[1;36m• Developer: RENDZZ\e[0m"
    echo -e "\e[1;36m• Status: Aktif\e[0m"
    echo ""
    read -p "Tekan Enter untuk kembali ke menu..."
}

main_menu() {
    while true; do
        show_banner
        echo -e "\e[1;34m📋 MENU UTAMA:\e[0m"
        echo -e "\e[1;32m1. 📥 Install NookTheme\e[0m"
        echo -e "\e[1;31m2. ❌ Keluar\e[0m"
        echo ""
        read -p "Pilih opsi [1-2]: " choice
        
        case $choice in
            1)
                install_nooktheme
                ;;
            2)
                echo -e "\e[1;33m👋 Terima kasih telah menggunakan script ini!\e[0m"
                echo -e "\e[1;35m✨ Jangan lupa subscribe YouTube: @renmodz45\e[0m"
                sleep 2
                exit 0
                ;;
            *)
                echo -e "\e[1;31m❌ Pilihan tidak valid. Silakan coba lagi.\e[0m"
                sleep 2
                ;;
        esac
    done
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "\e[1;31m❌ Jangan jalankan script ini sebagai root!\e[0m"
    echo -e "\e[1;33m💡 Gunakan user biasa dengan sudo privileges\e[0m"
    exit 1
fi

# Check if in correct directory
if [ ! -f "artisan" ]; then
    echo -e "\e[1;31m❌ Harap jalankan script ini di directory Pterodactyl!\e[0m"
    echo -e "\e[1;33m💡 Biasanya di /var/www/pterodactyl\e[0m"
    exit 1
fi

# Start main menu
main_menu