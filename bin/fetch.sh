user="${USER}"
shell="$(basename ${SHELL})"
distro=$(. /etc/os-release ; echo "$ID")

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    wm="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"
fi
kernel="$(uname -r | cut -d '-' -f1)"
ram="$(free -t | awk 'NR == 2 {printf("%.2f%"), $3/$2*100}')"

white='\033[37m'
cyan='\033[36m'
blue='\033[34m'
green='\033[32m'
purple='\033[35m'
bold='\033[1m'
end='\033[0m'

# Функция
repeat_by_len () {
  local str=$1
  local char=$2
  local len=${#str}
  for ((i = 1; i < len; i++)); do
      printf "$char"
  done
}

printf '%b' "
${bold}${blue}           ██           ${end}${bold}${blue}${user}${cyan}@${purple}$(cat /etc/hostname)${end}
${bold}${blue}          ████          ${end}${green}$(repeat_by_len "${user}@$(cat /etc/hostname)" "─")
${bold}${blue}          ▀████         ${end}
${bold}${blue}        ██▄ ████        ${end}${bold}${purple}  ${blue}os ${green}  ${magenta}${cyan}${distro}${end}
${bold}${blue}       ██████████       ${end}${bold}${purple}  ${blue}sh ${green}  ${magenta}${cyan}${shell}${end}
${bold}${blue}      ████▀  ▀████      ${end}${bold}${purple}  ${blue}wm ${green}  ${magenta}${cyan}${wm}${end}
${bold}${blue}     ████▀    ▀████     ${end}${bold}${purple}  ${blue}kr ${green}  ${magenta}${cyan}${kernel}${end}
${bold}${blue}    ▀▀▀          ▀▀▀    ${end}${bold}${purple}  ${blue}ram ${green} ${magenta}${cyan}${ram}${end}

"
