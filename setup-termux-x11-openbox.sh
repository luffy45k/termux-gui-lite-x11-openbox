#!/bin/bash
set -e

echo "Installing minimal Termux GUI X11 environment with Openbox + Xterm..."

pkg update && pkg upgrade -y
pkg install x11-repo -y
pkg install termux-x11-nightly -y
pkg install openbox xterm -y

mkdir -p "$HOME/.config/X11"
cat > "$HOME/.config/X11/xinitrc" <<'EOF'
#!/bin/bash
export DISPLAY=:0
openbox &
xterm &
wait
EOF

chmod +x "$HOME/.config/X11/xinitrc"

echo "Setup complete."
echo "Run this command in Termux:"
echo "startx $HOME/.config/X11/xinitrc"
echo ""
echo "If it fails, try:"
echo "export DISPLAY=:0"
