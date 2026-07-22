# 📦 Microsoft 365 & Office 2024 Deployment Suite

![License](https://img.shields.io/badge/License-MIT-blue.svg)
![OS](https://img.shields.io/badge/OS-Windows_10%2F11-0078D4.svg)
![Language](https://img.shields.io/badge/Language-Auto--Detect_System_OS-brightgreen.svg)
![Architecture](https://img.shields.io/badge/Architecture-64--Bit-orange.svg)

Automated deployment & permanent activation suite for **Microsoft 365** and **Office LTSC 2024** (Includes Excel, Word, and PowerPoint in your OS language).

---

## ⚡ 1-Click Quick Start

### Option A: Standard Setup (Recommended)
1. **Clone or Download the Repository**:
   ```cmd
   git clone https://github.com/moritzpolster14-oss/Office_M365_Setup.git
   cd Office_M365_Setup
   ```
2. **Run `start.bat`**:
   Right-click `start.bat` $\rightarrow$ **Run as Administrator**.
   - Choose `[1]` to Install Microsoft 365.
   - Choose `[3]` to Activate Office permanently.

---

### Option B: Instant PowerShell Command (No Git Required)
Open **PowerShell (as Administrator)** and paste the following line:

```powershell
powershell -Command "irm https://raw.githubusercontent.com/moritzpolster14-oss/Office_M365_Setup/main/start.bat -OutFile start.bat; .\start.bat"
```

---

## 🌟 Included Components

| File | Description |
| :--- | :--- |
| **`start.bat`** | **Single 1-Click interactive menu** for installation and activation. |
| **`install_office.bat`** | Downloads official Microsoft ODT (`setup.exe`) and installs Office. |
| **`activate_office.bat`** | Executes permanent Ohook activation via Microsoft Activation Scripts (MAS). |
| **`configuration-Office365-x64.xml`** | Pre-configured XML template for Microsoft 365 Apps (Current Channel, Auto-Detect Language). |
| **`configuration-LTSC2024-x64.xml`** | Pre-configured XML template for Office LTSC 2024 (Auto-Detect Language). |

---

## ❓ FAQ

<details>
<summary><b>Which language will be installed?</b></summary>
The XML configuration uses <code>MatchOS</code>, meaning Microsoft Office automatically installs in the exact language of your Windows operating system (English, German, French, Spanish, etc.).
</details>

<details>
<summary><b>Is activation permanent?</b></summary>
Yes! The activation uses the popular <b>Ohook</b> method via Microsoft Activation Scripts (MAS), providing local, permanent activation without needing any background subscription services.
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
└── README.md                        # Documentation
```
