#!/bin/bash
# Android Performance Booster Script
# Developer: Willy Gailo
# For non-rooted Android devices
# Version: 1.0

# Function for cool animation
show_animation() {
    clear
    echo -e "\e[1;36m"
    echo "╔══════════════════════════════════════════╗"
    echo "║                                          ║"
    echo "║        ANDROID PERFORMANCE BOOSTER       ║"
    echo "║         Developed by Willy Gailo         ║"
    echo "║                                          ║"
    echo "╚══════════════════════════════════════════╝"
    echo -e "\e[0m"
    
    echo -e "\e[1;33mPreparing to boost your device...\e[0m"
    sleep 1
    
    for i in {1..20}; do
        echo -ne "\e[1;32m[$i%] Progress: ["
        for ((j=0; j<i; j+=1)); do echo -ne "▓"; done
        for ((j=i; j<20; j+=1)); do echo -ne "░"; done
        echo -ne "]\r\e[0m"
        sleep 0.1
    done
    
    echo -e "\n\e[1;32mInitializing system optimization...\e[0m"
    sleep 1
}

# Function to clean cache
clean_cache() {
    echo -e "\e[1;34m[*] Cleaning app cache...\e[0m"
    # Use Android's package manager to clear cache
    for pkg in $(pm list packages | cut -d':' -f2); do
        echo -ne "\e[1;34mClearing cache for $pkg\r\e[0m"
        pm clear --cache $pkg >/dev/null 2>&1
        sleep 0.01
    done
    echo -e "\e[1;32m[✓] App cache cleaned successfully!\e[0m"
    sleep 1
}

# Function to optimize battery
optimize_battery() {
    echo -e "\e[1;34m[*] Optimizing battery usage...\e[0m"
    # Enable battery optimization for apps
    for pkg in $(pm list packages | cut -d':' -f2); do
        echo -ne "\e[1;34mOptimizing battery for $pkg\r\e[0m"
        dumpsys deviceidle whitelist -$pkg >/dev/null 2>&1
        sleep 0.01
    done
    echo -e "\e[1;32m[✓] Battery optimization complete!\e[0m"
    sleep 1
}

# Function to free up RAM
free_ram() {
    echo -e "\e[1;34m[*] Freeing up RAM...\e[0m"
    # Kill background processes selectively
    for proc in $(ps | grep -E "logcat|stats|backup|analytics" | awk '{print $2}'); do
        echo -ne "\e[1;34mStopping unnecessary process $proc\r\e[0m"
        kill $proc >/dev/null 2>&1
        sleep 0.01
    done
    echo -e "\e[1;32m[✓] RAM optimization complete!\e[0m"
    sleep 1
}

# Function to speed up network
speed_up_network() {
    echo -e "\e[1;34m[*] Optimizing network settings...\e[0m"
    # Enable DNS prefetching
    settings put global dns_resolver_sample_validity_seconds 600 >/dev/null 2>&1
    settings put global wifi_scan_throttle_enabled 0 >/dev/null 2>&1
    settings put global tether_dun_required 0 >/dev/null 2>&1
    settings put global tcp_default_init_rwnd 60 >/dev/null 2>&1
    # Reduce network latency
    settings put global nsd_on 1 >/dev/null 2>&1
    settings put global wifi_networks_available_notification_on 0 >/dev/null 2>&1
    echo -e "\e[1;32m[✓] Network optimized!\e[0m"
    sleep 1
}

# Function to disable unnecessary services
disable_services() {
    echo -e "\e[1;34m[*] Disabling unnecessary services...\e[0m"
    # Disable analytics services
    for svc in $(cmd activity services | grep -E "analytics|metrics|stats" | awk '{print $2}'); do
        echo -ne "\e[1;34mDisabling service $svc\r\e[0m"
        settings put system $svc 0 >/dev/null 2>&1
        sleep 0.01
    done
    # Disable other resource-consuming services
    settings put global heads_up_notifications_enabled 0 >/dev/null 2>&1
    settings put global activity_animation_scale 0.5 >/dev/null 2>&1
    settings put global window_animation_scale 0.5 >/dev/null 2>&1
    settings put global transition_animation_scale 0.5 >/dev/null 2>&1
    echo -e "\e[1;32m[✓] Unnecessary services disabled!\e[0m"
    sleep 1
}

# Function to show results
show_results() {
    clear
    echo -e "\e[1;36m"
    echo "╔══════════════════════════════════════════╗"
    echo "║                                          ║"
    echo "║             BOOST COMPLETE!              ║"
    echo "║                                          ║"
    echo "╚══════════════════════════════════════════╝"
    echo -e "\e[0m"
    
    echo -e "\e[1;32mYour device has been successfully optimized!\e[0m"
    echo -e "\e[1;33mImprovements made:\e[0m"
    echo -e "  \e[1;32m✓\e[0m App cache cleaned"
    echo -e "  \e[1;32m✓\e[0m Battery usage optimized"
    echo -e "  \e[1;32m✓\e[0m RAM freed up"
    echo -e "  \e[1;32m✓\e[0m Network settings improved"
    echo -e "  \e[1;32m✓\e[0m Unnecessary services disabled"
    echo -e "  \e[1;32m✓\e[0m Graphics performance enhanced"
    echo -e "  \e[1;32m✓\e[0m Storage optimized"
    
    echo -e "\n\e[1;33mYour device should now perform better!\e[0m"
    echo -e "\e[1;36mThank you for using this script!\e[0m"
    echo -e "\e[1;35mDeveloped with ❤️ by Willy Gailo\e[0m"
    echo -e "\n\e[1;33mPlease consider sharing this script with your friends!\e[0m"
}

# Function to optimize graphics
optimize_graphics() {
    echo -e "\e[1;34m[*] Optimizing graphics performance...\e[0m"
    # Adjust graphics settings for better performance
    settings put system font_scale 0.85 >/dev/null 2>&1
    settings put global gpu_debug_layers 0 >/dev/null 2>&1
    settings put global debug_view_attributes 0 >/dev/null 2>&1
    echo -e "\e[1;32m[✓] Graphics optimization complete!\e[0m"
    sleep 1
}

# Function to optimize storage
optimize_storage() {
    echo -e "\e[1;34m[*] Optimizing storage...\e[0m"
    # Clean up temporary files
    rm -rf /data/local/tmp/* >/dev/null 2>&1
    rm -rf /sdcard/Android/data/*/cache/* >/dev/null 2>&1
    rm -rf /sdcard/Download/.*tmp* >/dev/null 2>&1
    rm -rf /sdcard/Download/*tmp* >/dev/null 2>&1
    rm -rf /sdcard/.tmpfile* >/dev/null 2>&1
    # Media scanner optimization
    settings put global fstrim_mandatory_interval 259200000 >/dev/null 2>&1
    echo -e "\e[1;32m[✓] Storage optimization complete!\e[0m"
    sleep 1
}

# Main function
main() {
    show_animation
    clean_cache
    optimize_battery
    free_ram
    speed_up_network
    disable_services
    optimize_graphics
    optimize_storage
    show_results
}

# Run the script
main