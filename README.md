# Horizon Launcher

A Windows launcher for Ratchet & Clank: Up Your Arsenal and Ratchet: Deadlocked on PCSX2.

Horizon Launcher helps set up PCSX2, launch supported games, apply common online patches, download custom maps, and update itself from GitHub releases.

## Features

- Launch Up Your Arsenal or Deadlocked through PCSX2
- Optional embedded PCSX2 window
- First-run setup for ISO and BIOS paths
- Patch support for multiplayer boot, widescreen, and DNAS skip
- Custom map downloads from the Horizon server
- GitHub-based launcher updates
- Hotkeys for map updates and settings

## Requirements

- Windows 10 or newer
- .NET 8.0 SDK for building
- .NET 8.0 Runtime for running framework-dependent builds
- PCSX2
- Ratchet & Clank: Up Your Arsenal ISO, NTSC or PAL
- Ratchet: Deadlocked ISO, NTSC-U only

## First Run

1. Launch Horizon Launcher.
2. Select your ISO file.
3. Select your BIOS file.
4. Configure patches and settings.
5. Click `Launch`.

## Hotkeys

- `F11` - update custom maps
- `Ctrl+F11` - open settings

## Patches

Horizon Launcher can write PCSX2 `.pnach` patches for supported games.

- **Boot to Multiplayer** - skips directly to multiplayer
- **Widescreen** - enables 16:9 widescreen support
- **DNAS Skip** - skips the DNAS screen when connecting online

## Custom Maps

Custom multiplayer maps are downloaded from the Horizon server.

- UYA maps are downloaded to `<ISO directory>\uya\`
- Maps update automatically on launch
- Maps can be updated manually with `F11`

## Building

Run build commands from the `horizon-launcher` folder.

### First Steps

Download the required data files from the `data` GitHub release:

```text
https://github.com/Horizon-Private-Server/horizon-launcher/releases/tag/data
```

Extract the files to:

```text
horizon-launcher\installer\data\
```

### Build Everything

```bat
build-all.bat
```

This builds the launcher, updater, and installer, then copies the release files into `release/`.

Output:

```text
release\
  HorizonLauncherInstaller.exe
  HorizonLauncherUpdater.exe
  HorizonLauncher\
    HorizonLauncher.exe
    data\
```

### Build Launcher Only

```bat
build-launcher.bat
```

Output:

```text
launcher\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncher.exe
```

### Build Installer Only

```bat
build-installer.bat
```

Output:

```text
installer\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncherInstaller.exe
```

## Installer

### What It Does

`HorizonLauncherInstaller.exe` is a standalone installer. It extracts `HorizonLauncher.exe` and the bundled `data/` folder to the selected install location, optionally creates a desktop shortcut, and can launch Horizon Launcher when setup finishes.

### How To Build

```bat
build-installer.bat
```

For a full release build, use:

```bat
build-all.bat
```

## Updater

### What It Does

`HorizonLauncherUpdater.exe` contains the files for a specific release. It can replace the installed `HorizonLauncher.exe` and update files in the installed `data/` folder.

On startup, Horizon Launcher checks the latest GitHub release. If a newer version exists and the release includes `HorizonLauncherUpdater.exe`, the launcher downloads it, closes PCSX2, starts the updater, and exits.

### How To Build

```bat
build-updater.bat
```

Build the updater after the launcher has been published. Upload this file to the matching GitHub release:

```text
updater\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncherUpdater.exe
```

To include data updates, place files under:

```text
updater\updates\
```

Files in `updater\updates\data\` are embedded into the updater and written into the installed `data/` folder.

## Configuration

User settings are stored at:

```text
%APPDATA%\HorizonLauncher\config.json
```

## Uninstalling

The installer is extraction-based. To uninstall Horizon Launcher, delete the install folder.
