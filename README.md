# Introduction

I recently bought MacOS, but it happened to be broken. Namely, it lacked package manager, it had it's keyboard shortcuts all over the place AND the latest OS version does not allow you to customize these shortcuts to be more aligned with all other operating systems (like CTRL+C and ALT+TAB). I heard Apple is a great brand and I could not wait any longer to start using MacOS, so instead of sending it to Apple to fix it, I fixed it myself. Hopefully Apple fixes these issues in next release and this repo becomes obsolete.

# MacOS Keyboard Shortcut Fix with Hammerspoon

This repository hosts a Hammerspoon configuration (`init.lua`) aimed at modifying MacOS keyboard shortcuts to more closely resemble those found on Linux and Windows systems. It's designed for users who frequently switch between operating systems and seek a more consistent keyboard shortcut experience across platforms.

## Features

- **Key Remappings:** Remap common shortcuts like Select All, Copy, Paste, Undo, Redo, Save, and more to use CTRL, aligning with other operating systems
- **Window Management:** Use shortcuts to move and resize windows into halves, thirds, and corners of the screen.
- **Window Switching:** Bind Alt+Tab and Alt+Shift+Tab for switching between windows, mirroring the behavior on Linux and Windows.

## Installation

### Prerequisites

- [Hammerspoon](http://www.hammerspoon.org/) installed on your MacOS. Free.
- The `SpoonInstall` Spoon, which can be downloaded from the [official Spoon repository](https://www.hammerspoon.org/Spoons/). Free.
- [Homebrew](https://brew.sh/), the missing package manager for MacOS, to install other necessary tools and utilities. Free.

### Setup

1. **Install Homebrew:** My MacOS lacked a built-in package manager, which is a significant oversight. To fix this, install Homebrew by following the instructions on [their website](https://brew.sh/).
   
2. **Install Hammerspoon:** If not already installed, download and install Hammerspoon from [here](http://www.hammerspoon.org/).

3. **Configure Hammerspoon:**

    - Launch Hammerspoon.
    - Navigate to `~/.hammerspoon/` in your file system.
    - Create `init.lua` file (copy it from this repository).
    - Reload Hammerspoon configuration or restart Hammerspoon.

4. **Install Required Spoons:**

    The script automatically sets up the necessary Spoon repository and installs these Spoons on the first run. You might need to download install `SpoonInstall` manually from the official repo, the other spoon(s) will be downloaded automatically.

## Usage

Once installed, the keyboard shortcuts outlined in the `init.lua` script will be active. This includes window management hotkeys (e.g., moving windows to the right or left half of the screen with `Cmd + Right` or `Cmd + Left`) and remapped shortcuts (e.g., using `Ctrl + C` to copy instead of `Cmd + C`). Old hotkeys will work just like before. Whenever you need to, you might edit and customize shortcuts easily in `init.lua`.

### Customization

Feel free to modify the `init.lua` script to suit your preferences. For example, you can change shortcut keys or add new functionalities.

## Contributing

Contributions are welcome! If you have improvements or bug fixes, please open a pull request or issue.

## License

This project is released under the MIT License. Copy, edit, do whatever you want.
