# 📦 Microsoft 365 & Office 2024 Deployment Suite

![License](https://img.shields.io/badge/License-MIT-blue.svg)
![OS](https://img.shields.io/badge/OS-Windows_10%2F11-0078D4.svg)
![Language](https://img.shields.io/badge/Language-Auto--Detect_System_OS-brightgreen.svg)
![Architecture](https://img.shields.io/badge/Architecture-64--Bit-orange.svg)
![Logging](https://img.shields.io/badge/Logging-Automated_Diagnostics-purple.svg)
![Status](https://img.shields.io/badge/Status-Battle--Tested-success.svg)

⚡ 1-Click Automated Deployment & Permanent Activation Suite for **Microsoft 365 Apps** and **Office LTSC 2024** (Includes Word, Excel, PowerPoint, and Outlook in your native OS language with built-in activity logging).

---

## 📋 Prerequisites

- **Operating System**: Windows 10 or Windows 11 (64-Bit).
- **Permissions**: **Administrator privileges** are required to install Office services.
- **Internet Connection**: Active internet connection to download Office files directly from Microsoft CDN.

---

## ⚡ Quick Start Guide

### Option A: Using Git (Recommended)

1. **Clone the Repository**:
   ```cmd
   git clone https://github.com/moritzpolster14-oss/Office_M365_Setup.git
   cd Office_M365_Setup
   ```
2. **Run the Installer**:
   - Right-click `start.bat` $\rightarrow$ **Run as Administrator**.
   - Press `[1]` to install **Microsoft 365 Apps** or `[2]` for **Office LTSC 2024**.
   - After installation, press `[3]` to launch the permanent **Ohook Activation**.

---

### Option B: 1-Click PowerShell Command (No Git Required)

Open **PowerShell (as Administrator)** and paste the following line:

```powershell
powershell -Command "iwr https://github.com/moritzpolster14-oss/Office_M365_Setup/archive/refs/heads/main.zip -OutFile setup.zip; Expand-Archive -Path setup.zip -DestinationPath . -Force; cd Office_M365_Setup-main; .\start.bat"
```

---

## 🚶 Step-by-Step Walkthrough

Follow these 5 simple steps to download, install, and activate Microsoft Office on your system:

### 1️⃣ Step 1: Open Command Prompt / PowerShell as Administrator
Right-click the Start Menu button $\rightarrow$ select **Terminal (Admin)** or **Command Prompt (Admin)**.

### 2️⃣ Step 2: Download / Clone the Repository
Run the following command to download the suite to your PC:
```cmd
git clone https://github.com/moritzpolster14-oss/Office_M365_Setup.git
cd Office_M365_Setup
```

### 3️⃣ Step 3: Launch the Master Starter Menu
Right-click `start.bat` $\rightarrow$ **Run as Administrator** (or run `.\start.bat` in Command Prompt).
You will be greeted with the main menu:

```text
==========================================================
  Microsoft Office Deployment & Activation Suite
==========================================================

Select an option:
  [1] Install Microsoft 365 Apps (Recommended)
  [2] Install Office LTSC 2024 (Perpetual Volume)
  [3] Activate Installed Office (Ohook / MAS Permanent)
  [4] Exit

Enter your choice (1-4):
```

### 4️⃣ Step 4: Install Office
1. Type **`1`** and press `Enter` to install **Microsoft 365 Apps** (or **`2`** for **Office LTSC 2024**).
2. The script will automatically fetch the official Microsoft Deployment Tool (`setup.exe`) and start downloading Office directly from Microsoft's servers in your computer's native language.
3. Wait until Microsoft shows the completion screen: *"You're all set! Office is installed now."*

### 5️⃣ Step 5: Activate Office Permanently
1. Return to `start.bat` and enter option **`3`** (**Activate Installed Office**).
2. The official **Microsoft Activation Script (MAS)** prompt will launch.
3. Inside the MAS window:
   - Press key **`2`** on your keyboard for **[Ohook] Activation**.
   - Press key **`1`** on your keyboard to **Install Ohook**.
4. You will see a green success banner confirming permanent activation!

---

## 🛠️ Menu Overview & Options

When running `start.bat`, you can choose between these actions:

| Option | Action | Description |
| :--- | :--- | :--- |
| **`[1]`** | **Install Microsoft 365 Apps** | Recommended. Installs the latest subscription edition of Word, Excel, PowerPoint with all modern features. |
| **`[2]`** | **Install Office LTSC 2024** | Installs the perpetual Volume License version of Office 2024. Ideal for offline or fixed environments. |
| **`[3]`** | **Activate Installed Office** | Runs Microsoft Activation Script (MAS) using the permanent **Ohook** method. |
| **`[4]`** | **Open Logs Folder** | Opens the `logs\` folder containing detailed setup activity and ODT diagnostic logs. |
| **`[5]`** | **Exit** | Closes the setup menu. |

---

## 📄 Automated Logging & Diagnostics

The deployment suite automatically generates detailed log files to track progress and diagnose any installation errors:
- **Activity Log**: Saved to `logs\setup_activity.log` with timestamps for script execution, ODT downloads, and exit codes.
- **ODT Diagnostic Log**: Configured via `<Logging Level="Standard" />` in XML templates. If `setup.exe` encounters an error, detailed diagnostic logs are saved to `%TEMP%` and `logs\`.
- **Quick Access**: Select option `[4]` in `start.bat` to instantly open the `logs\` directory.

---

## 🔍 Detailed Troubleshooting & Error Debugging

### 🔴 1. Error: `The command "Activation" is either misspelled or could not be found.`
* **Cause**: Older versions of `start.bat` had an unescaped `&` character in the header banner.
* **Fix**: Update your repository by running:
  ```cmd
  git pull
  ```
  Or download the latest ZIP from GitHub.

---

### 🔴 2. Error: `[ERROR] setup.exe could not be downloaded` / `Invoke-WebRequest 404`
* **Cause**: PowerShell failed to fetch `setup.exe` due to network/firewall restriction or an outdated Microsoft link.
* **Fix (Automated)**: Run `git pull` to fetch the updated `install_office.bat` which uses Microsoft's updated direct download path.
* **Fix (Manual Fallback)**:
  1. Download the Office Deployment Tool manually from Microsoft: [Microsoft ODT Download Page](https://www.microsoft.com/en-us/download/details.aspx?id=49117).
  2. Run the downloaded file (`officedeploymenttool.exe`) and extract `setup.exe`.
  3. Place `setup.exe` directly into the `Office_M365_Setup` folder next to `start.bat`.
  4. Run `start.bat` again.

---

### 🔴 3. Error: `Access Denied`
* **Cause**: The script was launched without Administrator rights.
* **Fix**: Right-click `start.bat` and select **Run as Administrator**.

---

### 🔴 4. Error: Office installation fails or hangs
* **Cause**: Conflicting older Microsoft Office installations (e.g. Office 2016/2019/365 trial) already present on the system.
* **Fix**:
  1. Open Windows **Settings** $\rightarrow$ **Apps & features** / **Installed Apps**.
  2. Uninstall any existing versions of Microsoft Office or Office 365.
  3. Reboot your PC and run `start.bat` again.

---

### 🔴 5. Activation Step (`[3]`) Guidance
* **How does Activation work?** Option `[3]` launches the Microsoft Activation Script (MAS).
* **Selection in MAS menu**:
  - In the MAS window, press key **`2`** for **Ohook**.
  - Then press key **`1`** for **Install Ohook**.
* This permanently activates Office locally without running background services.

---

## 🌟 Included Components

| File | Description |
| :--- | :--- |
| **`start.bat`** | Unified 1-Click interactive starter script with escaped syntax. |
| **`install_office.bat`** | Auto-downloads Microsoft ODT (`setup.exe`) and installs Office. |
| **`activate_office.bat`** | Launches permanent Ohook activation via MAS. |
| **`configuration-Office365-x64.xml`** | M365 XML configuration (Current Channel, Auto-Detect Language). |
| **`configuration-LTSC2024-x64.xml`** | Office 2024 XML configuration (Perpetual Volume, Auto-Detect Language). |

---

## ❓ FAQ

<details>
<summary><b>Which language will be installed?</b></summary>
The XML configuration uses <code>MatchOS</code>, meaning Microsoft Office automatically installs in the exact language of your Windows operating system (English, German, French, Spanish, etc.).
</details>

<details>
<summary><b>Is activation permanent?</b></summary>
Yes! The activation uses the popular <b>Ohook</b> method via Microsoft Activation Scripts (MAS), providing local, permanent activation.
</details>

---

## 📁 Repository Structure

```
.
├── start.bat                        # Unified 1-click menu starter
├── install_office.bat               # Office deployment script
├── activate_office.bat              # Ohook activation script
├── configuration-Office365-x64.xml  # XML config for Microsoft 365
├── configuration-LTSC2024-x64.xml   # XML config for Office LTSC 2024
├── .gitignore                       # Temp files exclusion
└── README.md                        # Detailed documentation & troubleshooting
```
