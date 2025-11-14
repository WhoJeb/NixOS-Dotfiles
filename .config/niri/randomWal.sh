# Path to your wallpaper directory
WALLPAPER_DIR="/home/jeremiah/Pictures/Wallpapers/Hollow" # Change this to your wallpaper folder

# CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Generate a Pywal colorscheme and apply it
wal -i "$WALLPAPER"

WAYBAR_COLOR="$HOME/.cache/wal/colors-waybar.css"
WAYBAR_DIR="$HOME/.config/waybar"
WOFI_DIR="$HOME/.config/wofi"
cp "$WAYBAR_COLOR" "$WAYBAR_DIR"
cp "$WAYBAR_COLOR" "$WOFI_DIR"

# Apply the wallpaper using Hyprpaper
# hyprctl hyprpaper reload ,"$WALLPAPER"
swaybg -i "$WALLPAPER" -m fill

# Reload Hyprpaper (optional, depending on your setup)
# hyprctl reload
