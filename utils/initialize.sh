#!/bin/bash

# fullname="USER INPUT"
read -p "Enter username: " USERNAME

if [ -z "$USERNAME" ]; then
  echo "Username and password cannot be empty"
  exit 1
fi

PASSWORD=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 16)
echo "Password: $PASSWORD"

echo "Initializing gost configuration..."

# Create the gost.yml file with the provided user and password
mkdir -p ./gost
cat <<EOF > ./gost/gost.yml
services:
  - name: http
    addr: ":3128"
    handler:
      type: http
      authers:
      - basic
    listener:
      type: tcp
  - name: socks5
    addr: ":1080"
    handler:
      type: socks
      udp: true
    listener:
      type: tcp
authers:
  - name: basic
    auths:
      - username: $USERNAME
        password: $PASSWORD
log:
  level: warn
  format: json
  output: /var/log/gost/gost.log
  rotation:
    maxSize: 100
    maxAge: 10
    maxBackups: 3
    localTime: false
    compress: false
EOF