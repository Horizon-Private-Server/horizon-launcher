@echo off
echo Horizon Launcher - Complete Build Script
echo ======================================
echo.

REM Check if dotnet is installed
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: .NET SDK not found!
    echo Please install .NET 8.0 SDK from: https://dotnet.microsoft.com/download
    pause
    exit /b 1
)

echo Step 1: Building HorizonLauncher...
echo.
cd launcher
dotnet publish -c Release -r win-x64 --self-contained -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true

if errorlevel 1 (
    echo.
    echo BUILD FAILED: HorizonLauncher
    cd ..
    pause
    exit /b 1
)

cd ..

echo.
echo Step 2: Building HorizonLauncherUpdater...
echo.
cd updater
dotnet publish -c Release -r win-x64 --self-contained -p:PublishSingleFile=true

if errorlevel 1 (
    echo.
    echo BUILD FAILED: HorizonLauncherUpdater
    cd ..
    pause
    exit /b 1
)

cd ..

echo.
echo Step 3: Building HorizonLauncherInstaller...
echo.
cd installer
dotnet publish -c Release -r win-x64 --self-contained -p:PublishSingleFile=true

if errorlevel 1 (
    echo.
    echo BUILD FAILED: HorizonLauncherInstaller
    cd ..
    pause
    exit /b 1
)

cd ..

echo.
echo Step 4: Copying to release folder...
echo.

REM Create release directory structure
if not exist "release" mkdir release
if not exist "release\HorizonLauncher" mkdir release\HorizonLauncher

REM Copy launcher exe
copy "launcher\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncher.exe" "release\HorizonLauncher\" >nul

REM Copy data folder if it exists
if exist "installer\data" (
    echo Copying data folder...
    xcopy "installer\data" "release\HorizonLauncher\data\" /E /I /Y >nul
) else (
    echo WARNING: installer\data folder not found, skipping...
)

REM Copy installer exe to release root
copy "installer\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncherInstaller.exe" "release\" >nul

REM Copy updater exe to release root (for GitHub releases)
copy "updater\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncherUpdater.exe" "release\" >nul

echo.
echo ======================================
echo BUILD SUCCESSFUL!
echo ======================================
echo.
echo Release folder structure:
echo release\
echo   HorizonLauncherInstaller.exe (installer - for new users)
echo   HorizonLauncherUpdater.exe (updater - for GitHub releases)
echo   HorizonLauncher\
echo     HorizonLauncher.exe
echo     data\
echo.