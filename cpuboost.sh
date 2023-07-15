#!/bin/bash

while true; do
    sleep 2
    echo "
▒█▀▀█ ▒█▀▀█ ▒█░▒█ ▒█▀▀█ ▒█▀▀▀█ ▒█▀▀▀█ ▒█▀▀▀█ ▀▀█▀▀ 
▒█░░░ ▒█▄▄█ ▒█░▒█ ▒█▀▀▄ ▒█░░▒█ ▒█░░▒█ ░▀▀▀▄▄ ░▒█░░ 
▒█▄▄█ ▒█░░░ ░▀▄▄▀ ▒█▄▄█ ▒█▄▄▄█ ▒█▄▄▄█ ▒█▄▄▄█ ░▒█░░"
    sleep 2
    echo "Pilih mode:"
    echo "1. Gaming mode"
    echo "2. Normal mode"
    echo "3. Cek mode saat ini"
    echo "4. Exit"
    read -p "Masukkan pilihan (1, 2, 3, atau 4): " mode_choice

    if [ "$mode_choice" == "1" ]; then
        echo "Cₚᵤ ᵦₒₒₛₜ ₗᵢₙᵤₓ (Gaming Mode)"
        sleep 2
        # Menscan jumlah core yang kita miliki
        num_cores=$(nproc)

        echo "Jumlah core yang dimiliki: $num_cores"
        sleep 2
        echo "Menyiapkan perintah sesuai core kamu"
        sleep 5

        # Perulangan untuk menjalankan perintah cpufreq-set untuk setiap core
        for ((core = 0; core < num_cores; core++)); do
            echo "Mengatur core $core ke mode performance..."
            sudo cpufreq-set -c $core -g performance
            sleep 2
        done

        echo "Gaming mode telah diaktifkan."
    elif [ "$mode_choice" == "2" ]; then
        echo "Cₚᵤ ᵦₒₒₛₜ ₗᵢₙᵤₓ (Normal Mode)"
        sleep 2
        # Menscan jumlah core yang kita miliki
        num_cores=$(nproc)

        echo "Jumlah core yang dimiliki: $num_cores"
        sleep 2
        echo "Menyiapkan perintah sesuai core kamu"
        sleep 5

        # Perulangan untuk menjalankan perintah cpufreq-set untuk setiap core
        for ((core = 0; core < num_cores; core++)); do
            echo "Mengatur core $core ke mode normal..."
            sudo cpufreq-set -c $core -g ondemand
            sleep 2
        done

        echo "Normal mode telah diaktifkan."
    elif [ "$mode_choice" == "3" ]; then
        governor_output=$(cpufreq-info -o)
        if echo "$governor_output" | grep -q "ondemand"; then
            echo "Saat ini berada dalam Normal Mode."
        elif echo "$governor_output" | grep -q "performance"; then
            echo "Saat ini berada dalam Gaming Mode."
        else
            echo "Mode saat ini tidak dapat diidentifikasi."
        fi
    elif [ "$mode_choice" == "4" ]; then
        sleep 1
        echo "Arigato..."
        sleep 1
        break
    else
        echo "Pilih yang bener lah woi, 1,2,3 atau 4."
    fi
done
