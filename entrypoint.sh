#!/bin/sh

# Set default values if not provided
UUID=${UUID:-$(cat /proc/sys/kernel/random/uuid)}
PORT=${PORT:-443}
WS_PATH=${WS_PATH:-/v2}

# Generate config.json
cat > /etc/xray/config.json <<EOF
{
  "inbounds": [{
    "port": $PORT,
    "protocol": "vmess",
    "settings": {
      "clients": [{
        "id": "$UUID",
        "alterId": 0
      }]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "$WS_PATH"
      }
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
EOF

echo "Starting V2Ray with UUID: $UUID on port $PORT path $WS_PATH"
/usr/bin/xray -config /etc/xray/config.json
