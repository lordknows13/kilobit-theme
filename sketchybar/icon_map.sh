#!/usr/bin/env bash

### START-OF-ICON-MAP
function __icon_map() {
    case "$1" in
    "Activity Monitor") icon_result=":activity_monitor:" ;;
    "Alacritty") icon_result=":alacritty:" ;;
    "Alfred") icon_result=":alfred:" ;;
    "Android Studio") icon_result=":android_studio:" ;;
    "App Store") icon_result=":app_store:" ;;
    "Arc") icon_result=":arc:" ;;
    "Bitwarden") icon_result=":bit_warden:" ;;
    "Brave Browser") icon_result=":brave_browser:" ;;
    "Calendar" | "Fantastical" | "Notion Calendar") icon_result=":calendar:" ;;
    "Claude") icon_result=":claude:" ;;
    "Code" | "Code - Insiders") icon_result=":code:" ;;
    "Copilot") icon_result=":copilot:" ;;
    "Cursor") icon_result=":cursor:" ;;
    "Discord" | "Discord Canary" | "Discord PTB") icon_result=":discord:" ;;
    "Docker" | "Docker Desktop") icon_result=":docker:" ;;
    "FaceTime") icon_result=":face_time:" ;;
    "Figma") icon_result=":figma:" ;;
    "Finder") icon_result=":finder:" ;;
    "Firefox") icon_result=":firefox:" ;;
    "Ghostty") icon_result=":ghostty:" ;;
    "GitHub Desktop") icon_result=":git_hub:" ;;
    "Chromium" | "Google Chrome" | "Google Chrome Canary") icon_result=":google_chrome:" ;;
    "Hyper") icon_result=":hyper:" ;;
    "IntelliJ IDEA") icon_result=":idea:" ;;
    "iTerm" | "iTerm2") icon_result=":iterm:" ;;
    "kitty") icon_result=":kitty:" ;;
    "Linear") icon_result=":linear:" ;;
    "Canary Mail" | "Mail" | "Spark" | "Superhuman") icon_result=":mail:" ;;
    "Maps" | "Google Maps") icon_result=":maps:" ;;
    "Messages") icon_result=":messages:" ;;
    "Messenger") icon_result=":messenger:" ;;
    "Microsoft Edge") icon_result=":microsoft_edge:" ;;
    "Microsoft Excel") icon_result=":microsoft_excel:" ;;
    "Microsoft Outlook") icon_result=":microsoft_outlook:" ;;
    "Microsoft PowerPoint") icon_result=":microsoft_power_point:" ;;
    "Microsoft Teams") icon_result=":microsoft_teams:" ;;
    "Microsoft Word") icon_result=":microsoft_word:" ;;
    "Music") icon_result=":music:" ;;
    "Neovim" | "neovim" | "nvim") icon_result=":neovim:" ;;
    "Notes") icon_result=":notes:" ;;
    "Notion") icon_result=":notion:" ;;
    "Obsidian") icon_result=":obsidian:" ;;
    "1Password") icon_result=":one_password:" ;;
    "ChatGPT") icon_result=":openai:" ;;
    "OrbStack") icon_result=":orbstack:" ;;
    "Photos" | "Fotos") icon_result=":photos:" ;;
    "Podcasts") icon_result=":podcasts:" ;;
    "Postman") icon_result=":postman:" ;;
    "Preview" | "Skim") icon_result=":preview:" ;;
    "Raycast") icon_result=":raycast:" ;;
    "Reminders") icon_result=":reminders:" ;;
    "Safari" | "Safari Technology Preview") icon_result=":safari:" ;;
    "Signal") icon_result=":signal:" ;;
    "Slack") icon_result=":slack:" ;;
    "Spotify") icon_result=":spotify:" ;;
    "Steam") icon_result=":steam:" ;;
    "Sublime Text") icon_result=":sublime_text:" ;;
    "System Preferences" | "System Settings") icon_result=":gear:" ;;
    "Telegram") icon_result=":telegram:" ;;
    "Terminal") icon_result=":terminal:" ;;
    "Warp") icon_result=":warp:" ;;
    "WezTerm") icon_result=":wezterm:" ;;
    "WhatsApp") icon_result=":whats_app:" ;;
    "Xcode") icon_result=":xcode:" ;;
    "Zed") icon_result=":zed:" ;;
    "Zen" | "Zen Browser") icon_result=":zen_browser:" ;;
    "zoom.us") icon_result=":zoom:" ;;
    *) icon_result=":default:" ;;
    esac
}
### END-OF-ICON-MAP
