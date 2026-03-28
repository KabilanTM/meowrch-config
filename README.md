# 🐾 Meowrch Config (Hyprland Setup)

Minimal, stable, and practical Hyprland setup on EndeavourOS (Meowrch).

---

## ✨ Features

* 🪟 Hyprland configuration (modular + clean)
* 📊 Waybar setup (audio, WiFi, CPU temp, network speed)
* 🎨 Pawlette theme integration (Catppuccin)
* 🔊 Custom scripts:

  * audio status + device
  * WiFi signal
  * CPU temperature
  * network speed
* 🧹 Minimal + stability-focused (no unnecessary clutter)

---

## 📂 Structure

```
.
├── hypr/        # Hyprland configs
├── waybar/      # Waybar config + styles
├── pawlette/    # Theme configs
├── scripts/     # Custom scripts
│   ├── extras/  # Optional / upstream scripts
│   └── setup.sh # Apply configs
```

---

## ⚙️ Setup (after fresh install)

```bash
git clone https://github.com/KabilanTM/meowrch-config.git
cd meowrch-config
chmod +x scripts/setup.sh
./scripts/setup.sh
```

---

## 📦 Packages

Install base packages:

```bash
sudo pacman -S --needed - < scripts/pkglist.txt
```

> ⚠️ Some packages are from AUR / Meowrch repos and may require `yay`.

---

## 🧠 Philosophy

* Stability > bleeding edge
* Minimal > over-engineered
* Incremental improvements only

---

## ⚠️ Notes

* Backup your existing configs before applying
* Some hardware-specific configs (Bluetooth, GPU) may vary
* Earbud battery may not show (device limitation)

---

## 🚀 Future Improvements

* App launcher (rofi/walker)
* Workspace animations
* Advanced Waybar styling
* Optional wallpaper system (swww)

---

## 📜 License

MIT (or add your preferred license)

---

