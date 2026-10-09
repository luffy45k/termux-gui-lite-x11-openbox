# How to Setup Termux GUI Lite X11 with Openbox and Xterm

Complete step-by-step guide for installing and configuring a lightweight X11 desktop environment on Android via Termux.

---

## **Prerequisites**

- Android 7.0+ (Nougat or higher)
- Termux app (install from F-Droid, NOT Google Play)
- 512 MB RAM minimum (1 GB+ recommended)
- 50+ MB free storage
- ARM64 architecture preferred

---

## **Step 1: Install Termux**

1. Download **Termux** from **F-Droid**:
   - Visit: https://f-droid.org/packages/com.termux/
   - Tap **Download APK**
   - Install the APK

2. Open Termux and allow permissions when prompted

3. Update Termux (inside the app):
   ```bash
   pkg update && pkg upgrade -y
   ```

---

## **Step 2: Enable X11 Repository**

```bash
pkg install x11-repo -y
```

This adds access to X11 and GUI-related packages.

---

## **Step 3: Install X11 Server**

Choose one:

**Option A: Nightly (Latest)**
```bash
pkg install termux-x11-nightly -y
```

**Option B: Stable**
```bash
pkg install termux-x11 -y
```

---

## **Step 4: Install Window Manager and Terminal**

```bash
pkg install openbox xterm -y
```

**What these are:**
- **openbox**: Lightweight window manager (very minimal, no fancy effects)
- **xterm**: Simple terminal emulator for running commands in the GUI

---

## **Step 5: Create X11 Configuration Directory**

```bash
mkdir -p ~/.config/X11
```

---

## **Step 6: Create X11 Startup Script**

Create the xinitrc file:

```bash
nano ~/.config/X11/xinitrc
```

Paste this content:

```bash
#!/bin/bash
export DISPLAY=:0

# Start Openbox window manager
openbox &

# Start Xterm terminal
xterm &

# Keep the X11 session running
wait
```

Save with **Ctrl+O**, then **Enter**, then **Ctrl+X**

Make it executable:

```bash
chmod +x ~/.config/X11/xinitrc
```

---

## **Step 7: Download and Install Termux:X11 APK**

1. Visit: https://github.com/termux/termux-x11/releases
2. Download the latest `termux-x11-*-debug.apk` (the lite version)
3. Install the APK on your Android device
4. Allow **Display over other apps** permission when prompted

---

## **Step 8: Launch the X11 Desktop**

**In Termux terminal, run:**

```bash
startx ~/.config/X11/xinitrc
```

**If that doesn't work, try:**

```bash
export DISPLAY=:0
openbox &
xterm &
```

---

## **Step 9: Open Termux:X11 App**

1. Tap the **Termux:X11** icon in your app drawer
2. You should see the Openbox desktop with an Xterm window
3. You can now use the X11 GUI on your Android device!

---

## **Quick Start Using the Install Script**

If you want to automate the setup:

```bash
bash setup-termux-x11-openbox.sh
```

Then run:

```bash
startx ~/.config/X11/xinitrc
```

---

## **Testing the GUI**

Once the X11 desktop is running, try these commands in Xterm:

```bash
# Show the Xterm window info
xdpyinfo

# Launch a simple clock
xclock &

# Launch a simple eyes animation
xeyes &

# Check running processes
ps aux
```

---

## **Troubleshooting**

| Problem | Solution |
|---------|----------|
| **X11 won't start** | Restart Termux and try again. Make sure Termux:X11 APK is installed. |
| **No display appears** | Run `export DISPLAY=:0` before starting apps |
| **Xterm shows errors** | Check that `~/.config/X11/xinitrc` exists and is executable |
| **App closes immediately** | Make sure `wait` is at the end of xinitrc |
| **Touch input not working** | Check Termux:X11 settings for pointer/gesture options |
| **Low performance** | Close other apps on your Android device to free up RAM |

---

## **Size Information**

| Component | Size |
|-----------|------|
| Termux app | 10-25 MB |
| Termux:X11 APK | 15-20 MB |
| x11-repo packages | 5-10 MB |
| openbox | 1-2 MB |
| xterm | 0.5 MB |
| **Total** | **~35-60 MB** |

---

## **Performance Tips**

✅ **For better performance:**
- Close unnecessary apps before launching X11
- Use `-depth 16` for lower color depth: `startx -- :0 -depth 16`
- Disable desktop wallpapers
- Use lightweight apps (xterm, not heavy GUI apps)

✅ **For minimal size:**
- Don't install extra packages
- Skip desktop environments like XFCE or LXDE
- Stick with openbox + xterm only

---

## **Next Steps**

Once the basic setup works, you can:

1. **Add more GUI apps:**
   ```bash
   pkg install firefox  # Web browser
   pkg install geany    # Text editor
   pkg install gimp     # Image editor
   ```

2. **Configure Openbox:**
   - Edit: `nano ~/.config/openbox/rc.xml`
   - Customize keybindings, themes, and menus

3. **Add a taskbar/panel:**
   ```bash
   pkg install lxpanel
   ```

4. **Set up a full desktop environment (heavier):**
   ```bash
   pkg install lxde-core  # Lightweight DE
   # OR
   pkg install xfce4      # Medium-weight DE
   ```

---

## **Useful Links**

- Termux Wiki: https://wiki.termux.com
- Termux X11 GitHub: https://github.com/termux/termux-x11
- Openbox Documentation: http://openbox.org/wiki/Main_Page
- F-Droid: https://f-droid.org

---

## **Summary**

1. Install Termux from F-Droid
2. Run: `pkg update && pkg upgrade -y`
3. Run: `pkg install x11-repo termux-x11-nightly openbox xterm -y`
4. Create `~/.config/X11/xinitrc` with startup commands
5. Install Termux:X11 APK from GitHub
6. Run: `startx ~/.config/X11/xinitrc`
7. Open Termux:X11 app
8. Enjoy your lightweight X11 desktop on Android!

---

**Happy hacking!** 🚀
