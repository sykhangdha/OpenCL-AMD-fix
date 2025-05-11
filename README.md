[Download Fix Here](https://github.com/sykhangdha/OpenCL-AMD-fix/releases/tag/Release1)

# OpenCL.dll Installer for AMD Drivers

## Overview

This batch script is designed to **fix issues with newer AMD driver installers** that may not properly add `OpenCL.dll` to the `C:\Windows\System32` directory. The script automatically **downloads the correct version of OpenCL.dll** directly from the official **Khronos Group** GitHub release and installs it to the system folder.

### Purpose

Recent versions of AMD drivers may fail to include the necessary `OpenCL.dll` in the `System32` folder, leading to compatibility issues with OpenCL applications. This script resolves that problem by:

1. Downloading the correct version of `OpenCL.dll` from a trusted source.
2. Installing the downloaded DLL to `C:\Windows\System32`.

If the `OpenCL.dll` file is already in use by other system processes, the script will schedule the file replacement for the next reboot.

---

## Features

- Downloads `OpenCL.dll` directly from the official **Khronos Group** GitHub repository.
- Installs `OpenCL.dll` to `C:\Windows\System32`.
- If `OpenCL.dll` is in use, schedules the replacement for the next reboot.
- Easy-to-use batch script that requires **administrator privileges**.

---

## Requirements

- **Windows 7 or later** (64-bit version recommended).
- **Administrator privileges** to copy files to `System32`.

---

## Usage

1. **Download the script:**
   - Download the `install_opencl.bat` file from this repository.

2. **Run the script as Administrator:**
   - Right-click the `install_opencl.bat` file and select **Run as Administrator**.

3. **Follow the prompts:**
   - The script will notify you of its action and ask for confirmation to proceed.
   - If `OpenCL.dll` is already in use by another process, the script will automatically schedule the replacement to occur after a reboot.

4. **Reboot (if necessary):**
   - If the script encounters a file-in-use issue, reboot your system to apply the changes.

---

## Important Notes

- This script only downloads the `OpenCL.dll` file and installs it into the **System32** directory. The file is sourced directly from the official **Khronos Group OpenCL SDK** release.
- If you encounter any issues with the download, please ensure your internet connection is stable and retry running the script.

---

## Source of OpenCL.dll

The script grabs the `OpenCL.dll` file from the following GitHub repository:

- **Khronos Group OpenCL SDK Release:**
  - [https://github.com/KhronosGroup/OpenCL-SDK/releases/tag/v2024.10.24](https://github.com/KhronosGroup/OpenCL-SDK/releases/tag/v2024.10.24)

This ensures that the DLL is the most up-to-date and official version available.

---

## License

This script is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute it.

---

## Troubleshooting

- **Error: "The process cannot access the file because it is being used by another process."**
  - This error occurs if the `OpenCL.dll` file is in use by another system process. The script will automatically schedule the replacement on the next reboot. After rebooting, the new DLL will be copied over.
  
- **Manual Installation:**
  - If the script fails to download or install `OpenCL.dll` from the github here

