#!/usr/bin/env bash
set -e

echo "🔹 Starting Newt inside Home Assistant OS..."

CONFIG_PATH="/data/options.json"

if [[ ! -f "$CONFIG_PATH" ]]; then
    echo "❌ ERROR: Configuration file not found at $CONFIG_PATH!"
    exit 1
fi

PANGOLIN_ENDPOINT=$(jq -r '.PANGOLIN_ENDPOINT' "$CONFIG_PATH")
NEWT_ID=$(jq -r '.NEWT_ID' "$CONFIG_PATH")
NEWT_SECRET=$(jq -r '.NEWT_SECRET' "$CONFIG_PATH")
LOG_LEVEL=$(jq -r '.LOG_LEVEL' "$CONFIG_PATH")
if [[ "$LOG_LEVEL" == "null" ]]; then
    LOG_LEVEL="info"
fi

if [[ -z "$PANGOLIN_ENDPOINT" || -z "$NEWT_ID" || -z "$NEWT_SECRET" || "$PANGOLIN_ENDPOINT" == "null" ]]; then
    echo "❌ ERROR: Missing required configuration values!"
    exit 1
fi

echo "✅ Configuration Loaded:"
echo "  PANGOLIN_ENDPOINT=$PANGOLIN_ENDPOINT"

# 🔁 Auto-reconnect loop
while true; do
    echo "🔹 Starting Newt..."
    PANGOLIN_ENDPOINT="$PANGOLIN_ENDPOINT" NEWT_ID="$NEWT_ID" NEWT_SECRET="$NEWT_SECRET" /usr/bin/newt --log-level "$LOG_LEVEL"

    echo "⚠️ Newt stopped! Waiting 5 second before reconnecting..."
    sleep 5
done
