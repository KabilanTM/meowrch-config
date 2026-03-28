#!/usr/bin/env bash

interface=$(ip route | awk '/default/ {print $5; exit}')

rx1=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx1=$(cat /sys/class/net/$interface/statistics/tx_bytes)

sleep 1

rx2=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$interface/statistics/tx_bytes)

rx_rate=$((rx2 - rx1))
tx_rate=$((tx2 - tx1))

rx_kb=$((rx_rate / 1024))
tx_kb=$((tx_rate / 1024))

echo "<span color=\"#89b4fa\">↓ ${rx_kb}KB/s</span> <span color=\"#f38ba8\">↑ ${tx_kb}KB/s</span>"
