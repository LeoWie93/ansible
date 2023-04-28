#!/usr/bin/env bash

# Makes the script more portable
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Optional icon to display before the text
# Insert the absolute path of the icon
# Recommended size is 24x24 px
readonly ICON="${DIR}/icons/cpu/chip.png"

# Array of available logical CPUs
declare -r GPU_TEMP=($(nvidia-smi --query-gpu=temperature.gpu --format=csv | sed -n '2p'))
declare -r GPU_MEM_TOTAL=($(nvidia-smi --query-gpu=memory.total --format=csv | sed -n '2p'))
declare -r GPU_MEM_USED=($(nvidia-smi --query-gpu=memory.used --format=csv | sed -n '2p'))

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="┌ $(nvidia-smi --query-gpu=name --format=csv | sed -n '2p')\n"
MORE_INFO+="├─ Memory: $GPU_MEM_USED MiB / $GPU_MEM_TOTAL MiB\n"
MORE_INFO+="├─ Temperature: $GPU_TEMP C\n"
MORE_INFO+="</tool>"

# Panel
if [[ $(file -b "${ICON}") =~ PNG|SVG ]]; then
  INFO="<img>${ICON}</img>"
  if hash xfce4-taskmanager &> /dev/null; then
    INFO+="<click>xfce4-taskmanager</click>"
  fi
  INFO+="<txt>"
else
  INFO="<txt>"
fi
INFO+="${GPU_MEM_USED} MiB"
INFO+="</txt>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"
