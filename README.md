# Horizon Launcher

A modern modern Launcher for Ratchet and Clank: Up Your Arsenal and Ratchet: Deadlocked for PCSX2.

## Features

- 🎮 Launch PCSX2 with Ratchet and Clank: Up Your Arsenal or ratchet: Deadlocked automatically
- 🪟 Embed PCSX2 window inside the launcher (optional)
- 🎨 Modern Windows 10/11 UI with WPF
- 🔧 Automatic game patches (widescreen, boot to multiplayer, etc.)
- 🗺️ Custom multiplayer map downloader
- 🔄 Auto-update functionality
- ⚙️ Easy configuration with tabbed settings dialog
- 🎮 Hotkey support (F11 for map updates, Ctrl+F11 for settings)

## Requirements

- Windows 10/11
- .NET 8.0 SDK (for building)
- .NET 8.0 Runtime (for running)
- PCSX2 emulator
- Ratchet & Clank: Up Your Arsenal ISO (NTSC or PAL)
- Ratchet: Deadlocked (NTSCU Only)

## Building

### Option 1: Visual Studio (Easiest)
1. Open `HorizonLauncher.csproj` in Visual Studio 2022
2. Press F5 to build and run
3. Or Build → Build Solution (Ctrl+Shift+B)

### Option 2: Command Line
```bash
# Make sure you're in the HorizonLauncher directory
cd HorizonLauncher

# Restore dependencies and build
dotnet build

# Or build in Release mode for better performance
dotnet build -c Release

# Run the application
dotnet run

# Or run the built executable directly
.\bin\Debug\net8.0-windows\HorizonLauncher.exe
```

### Creating a Standalone Executable

To create a single-file executable that doesn't require .NET to be installed:

```bash
# Publish as a self-contained single-file exe
dotnet publish -c Release -r win-x64 --self-contained -p:PublishSingleFile=true

# The executable will be in:
# bin\Release\net8.0-windows\win-x64\publish\HorizonLauncher.exe
```

## First Run

1. Launch the application
2. Select your ISO file
3. Select your BIOS File.
4. Configure patches and settings
5. Click "Launch"


## Hotkeys

- **F11**: Update custom maps
- **Ctrl+F11**: Open settings dialog

## Patches

The launcher can apply the following patches to PCSX2:

- **Boot to Multiplayer**: Skip the single-player intro and boot directly to multiplayer
- **Widescreen**: Enable 16:9 widescreen support
- **DNAS Skip**: Skips the DNAS Screen when connecting online.

Patches are automatically written to PCSX2's `.pnach` files.

## Custom Maps

The launcher automatically downloads custom multiplayer maps from the Horizon server:
- Maps are downloaded to `<ISO directory>\uya\`
- Updated automatically on launch
- Manual update via F11 hotkey

## Updates

The launcher checks GitHub for updates on startup (if auto-update is enabled).
