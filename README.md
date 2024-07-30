# Windows Build
1. Go to project folder
1. flutter build windows --release
1. Execute build-windows.iss with inno setup


# Linux Build
1. Go to project folder and open the terminal
1. `flutter build linux --release`
1. `cp -r ./build/linux/x64/release/bundle/ HasherSha512.AppDir`
1. `cp ./_build_res/linux_icon.png HasherSha512.AppDir/`
1. `cp ./_build_res/linux_appimage.desktop HasherSha512.AppDir/`
1. Download appimage kit: https://github.com/AppImage/AppImageKit
    1. Move it to project folder
1. `chmod +x appimagetool-x86_64.AppImage`
1. `./appimagetool-x86_64.AppImage HasherSha512.AppDir`
1. Done :)