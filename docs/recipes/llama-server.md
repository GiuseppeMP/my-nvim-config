# LLAMA CPP Recipes


## Installation

```bash
brew install llama-cpp
```

## How to create MacOS background service


### Create script

mkdir -p ~/bin
nano ~/bin/llama-server.sh

### Script Content

``` 
#!/bin/bash

# Ensure predictable PATH (launchd has a minimal environment)
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

exec llama-server \
  --hf-repo ggml-org/Qwen2.5-Coder-1.5B-Instruct-Q8_0-GGUF \
  --hf-file qwen2.5-coder-1.5b-instruct-q8_0.gguf \
  -c 2048 \
  --port 11435
```

### Make script executable

chmod +x ~/bin/llama-server.sh

### Create service

nano ~/Library/LaunchAgents/com.llama.server.plist

### Service Content

``` 
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.<yourusername>.llama-server</string>

    <key>ProgramArguments</key>
    <array>
        <string>/Users/<yourusername>/bin/llama-server.sh</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardOutPath</key>
    <string>/Users/<yourusername>/Library/Logs/llama-server.out.log</string>

    <key>StandardErrorPath</key>
    <string>/Users/<yourusername>/Library/Logs/llama-server.err.log</string>
</dict>
</plist>
```

### Load service

launchctl load ~/Library/LaunchAgents/com.llama.server.plist
launchctl start com.llama-server


### Verify service

launchctl list | grep llama-server

### Stop service

launchctl stop com.llama-server
launchctl unload ~/Library/LaunchAgents/com.llama.server.plist
