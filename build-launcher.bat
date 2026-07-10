@echo off
echo ========================================
echo Building Horizon Launcher
echo ========================================
echo.

cd launcher
dotnet publish -c Release -r win-x64 --self-contained -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true

if errorlevel 1 (
    echo.
    echo BUILD FAILED!
    cd ..
    pause
    exit /b 1
)

cd ..

echo.
echo ========================================
echo BUILD SUCCESSFUL!
echo ========================================
echo.
echo Output: launcher\bin\Release\net8.0-windows\win-x64\publish\HorizonLauncher.exe
echo.
pause
