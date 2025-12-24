#!/bin/bash

HTML_FILE="./web/index.html"

cat > "$HTML_FILE" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Max's DevOps Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <meta http-equiv="refresh" content="30">
</head>
<body>
    <div class="container">
        <h1>Max's DevOps Dashboard</h1>
        <p class="update">Last update: $(date +"%Y-%m-%d %H:%M:%S")</p>

        <div class="grid">
            <div class="card">
                <h2>Disk Usage</h2>
                <pre>$(df -h / | tail -n +2)</pre>
            </div>

            <div class="card">
                <h2>Memory</h2>
                <pre>$(free -h)</pre>
            </div>

            <div class="card">
                <h2>Load & Uptime</h2>
                <pre>$(uptime)</pre>
            </div>

            <div class="card">
                <h2>Top CPU Processes</h2>
                <pre>$(ps aux --sort=-%cpu | head -n 8)</pre>
            </div>
        </div>

        <footer>
            <p>Made by Max-ohne-stress</p>
        </footer>
    </div>
</body>
</html>
EOF

echo "Dashboard updated at $(date)"