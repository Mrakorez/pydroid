#!/bin/python3

import tarfile
from io import BytesIO
from pathlib import Path
from zipfile import ZipFile

INCLUDE = {
    "CHANGELOG.md",
    "customize.sh",
    "LICENSE",
    "META-INF/com/google/android/update-binary",
    "META-INF/com/google/android/updater-script",
    "module.prop",
    "README.md",
    "system/bin/pydoc3.13",
    "system/bin/python3.13-config",
    "system/bin/python3.13",
    "uninstall.sh",
}

INCLUDE_XZ = {
    "python/arm",
    "python/arm64",
    "python/stdlib",
}


def xz_compress(target: Path) -> bytes:
    buffer = BytesIO()

    with tarfile.open(fileobj=buffer, mode="w:xz", preset=9) as tar:
        tar.add(target, target.name)

    return buffer.getvalue()


def create_zip(file_data: dict[str, bytes], output: Path) -> None:
    buffer = BytesIO()

    with ZipFile(buffer, "w") as zipbuf:
        for key, value in file_data.items():
            zipbuf.writestr(key, value)

    with output.open("wb") as fout:
        fout.write(buffer.getvalue())

    print(f"Written file: {output}")


def read_file(file: Path) -> bytes:
    with file.open("rb") as fin:
        return fin.read()


def getprop(key: str) -> str:
    props = Path("module.prop")

    with props.open("r") as fin:
        for line in fin:
            k, v = line.split("=")
            if k == key:
                return v.strip()

    return "none"


def get_output() -> Path:
    mod_id = getprop("id")
    mod_version = getprop("version")

    return Path(f"{mod_id}-{mod_version}.zip")


def main() -> None:
    file_data: dict[str, bytes] = {}

    for entry in INCLUDE:
        file_data[entry] = read_file(Path(entry))

    for entry in INCLUDE_XZ:
        file_data[entry + ".tar.xz"] = xz_compress(Path(entry))

    create_zip(file_data, get_output())


if __name__ == "__main__":
    main()
