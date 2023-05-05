# primesieve winget package

This repo is used to build an ```exe``` installer (using Inno Setup)
for the [primesieve](https://github.com/kimwalisch/primesieve)
command-line application for Windows x64 & arm64.

* Copy primesieve binary to: `inno-setup/primesieve-i.j-win-*`
* Update version number in: `inno-setup/main-*.iss`
* Open `inno-setup/main-*.iss` with the Inno Setup program and build the new installer.
