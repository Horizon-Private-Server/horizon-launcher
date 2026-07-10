# Horizon Launcher Setup

This is the installer project for Horizon Launcher.

## Building

### Build Everything (Recommended)
```bash
build-all.bat
```

This will:
1. Build HorizonLauncher.exe
2. Build installer.exe (which embeds HorizonLauncher.exe)

### Build Launcher Only (for testing)
```bash
build-launcher.bat
```

## Adding PCSX2 to the Installer

To embed PCSX2 in the installer, you need to:

1. Place PCSX2 files in a folder (e.g., `pcsx2-bundle/`)
2. Add them as embedded resources in `installer.csproj`:

```xml
<ItemGroup>
  <EmbeddedResource Include="pcsx2-bundle\**\*">
    <LogicalName>%(RecursiveDir)%(Filename)%(Extension)</LogicalName>
  </EmbeddedResource>
</ItemGroup>
```

3. Update `MainWindow.xaml.cs` to extract these files during installation

## How It Works

1. **installer.exe** is a standalone installer
2. It contains HorizonLauncher.exe embedded as a resource
3. User runs the installer, selects install location
4. Installer extracts everything to chosen folder:
   ```
   InstallLocation/
   ├── HorizonLauncher.exe
   └── data/
       ├── config.json (created on first run)
       ├── emulator/
       │   ├── pcsx2-qt.exe
       │   └── patches/
       └── defaults/
           └── PCSX2.ini
   ```
5. Optionally creates desktop shortcut
6. Launches HorizonLauncher.exe
7. Installer closes

## No Uninstaller

This is a simple extraction-based installer. To uninstall, just delete the folder.
