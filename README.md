# Pydroid

![Python Version](https://img.shields.io/badge/Python-3.13.1-blue) ![Magisk](https://img.shields.io/badge/Magisk-Module-green)

A Magisk module to install **Python 3.13.1** on Android (**ARM only**), including the standard library (stdlib). This was built according to the official [Python for Android guidelines](https://github.com/python/cpython/blob/3.13/Android/README.md).

## Installation

1. Download the latest ZIP file from [Releases](https://github.com/Mrakorez/pydroid/releases/latest).
2. In **Magisk Manager**, go to **Modules**.
3. Tap **Install from storage** and select the downloaded ZIP.
4. Reboot your device.

## Usage

### Python

Access Python from any terminal with:

```shell
su -c python3
# or
su -c python3.13
```

### Installing Pip

Install pip, the Python package manager, using the following command:

```shell
su -c python3 -m ensurepip
```

Once installed, you can access pip using:

```shell
su -c python3 -m pip
```

This gives you access to pip for installing and managing Python packages.

### Installing Packages with Native Modules (Using Termux)

For packages that require native modules (like those with C/C++ dependencies), you will need to use [Termux](https://github.com/termux/termux-app). Follow these steps to set it up:

1. **Upgrade Packages**
   ```shell
   pkg update && pkg upgrade
   ```

2. **Install Required Tools**
   ```shell
   pkg install clang tsu
   ```

3. **Install Packages with Pip**
   ```shell
   sudo -E python3 -m pip install <package>
   ```

## Known Issues

- **Pyrepl Doesn't Work**: You may see the warning below when starting Python:

  ```plaintext
  warning: can't use pyrepl: No module named 'msvcrt'
  ```

  This occurs because `msvcrt` is a Windows-only module, unavailable on Android. It doesn’t affect core functionality but disables enhanced REPL features like line editing and history in `pyrepl`.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more details.
