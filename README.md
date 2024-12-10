# Pydroid

![Python Version](https://img.shields.io/badge/Python-3.13.1-blue) ![Magisk](https://img.shields.io/badge/Magisk-Module-green)

A Magisk module to install **Python 3.13.1** on Android (**ARM only**), including the standard library (stdlib). This was built according to the official [Python for Android guidelines](https://github.com/python/cpython/blob/3.13/Android/README.md).

## Installation

1. Download the latest ZIP file from [Releases](https://github.com/Mrakorez/pydroid/releases/latest).
2. In **Magisk Manager**, go to **Modules**.
3. Tap **Install from storage** and select the downloaded ZIP.
4. Reboot your device.

## Usage

Access Python from any terminal with:

```shell
su -c python3
# or
su -c python3.13
```

## Known Issues

- **Pyrepl Doesn't Work**: You may see the warning below when starting Python:

  ```plaintext
  warning: can't use pyrepl: No module named 'msvcrt'
  ```

  This occurs because `msvcrt` is a Windows-only module, unavailable on Android. It doesn’t affect core functionality but disables enhanced REPL features like line editing and history in `pyrepl`.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more details.
