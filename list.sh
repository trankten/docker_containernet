#!/bin/bash

# Ensure script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)."
  exit 1
fi

# Function to draw a horizontal line
draw_line() {
  printf '+%-30s+%-20s+%-50s+\n' "$(printf '%0.1s' '-'{1..30})" "$(printf '%0.1s' '-'{1..20})" "$(printf '%0.1s' '-'{1..50})"
}

# Function to truncate text
truncate_text() {
  local text="$1"
  local max_length="$2"
  if [ "${#text}" -gt "$max_length" ]; then
    echo "${text:0:$((max_length - 3))}..."
  else
    echo "$text"
  fi
}

# Array to hold rows
rows=()

# Iterate through all container IDs
for CONTAINER_ID in $(docker ps -aq); do
  # Extract container information
  NAME=$(docker inspect -f '{{.Name}}' "$CONTAINER_ID" | sed 's/^\/\(.*\)/\1/')
  HOSTNAME=$(docker inspect -f '{{.Config.Hostname}}' "$CONTAINER_ID")

  # Extract all IPs associated with the container
  IP_ADDRESSES=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$CONTAINER_ID")

  # Iterate over each IP and prepare a row
  for IP in $IP_ADDRESSES; do
    # Truncate long values
    NAME_TRUNC=$(truncate_text "$NAME" 30)
    IP_TRUNC=$(truncate_text "$IP" 20)
    HOSTNAME_TRUNC=$(truncate_text "$HOSTNAME" 50)

    # Add the row to the array
    rows+=("$IP|$NAME_TRUNC|$IP_TRUNC|$HOSTNAME_TRUNC")
  done
done

# Sort rows by IP address
sorted_rows=($(printf '%s\n' "${rows[@]}" | sort -t. -k1,1n -k2,2n -k3,3n -k4,4n))

# Print table header
draw_line
printf '| %-28s | %-18s | %-48s |\n' "Container Name" "Internal IP" "Hostname"
draw_line

# Print sorted rows
for row in "${sorted_rows[@]}"; do
  IFS='|' read -r _ NAME_TRUNC IP_TRUNC HOSTNAME_TRUNC <<< "$row"
  printf '| %-28s | %-18s | %-48s |\n' "$NAME_TRUNC" "$IP_TRUNC" "$HOSTNAME_TRUNC"
done

# Print footer
draw_line
