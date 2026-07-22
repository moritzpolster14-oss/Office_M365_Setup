# 📦 Microsoft 365 & Office 2024 International Setup

Automated deployment & activation suite for **Microsoft 365** and **Office LTSC 2024** (64-Bit, Auto-Detect System Language, includes Excel, Word, and PowerPoint).

---

## 🌟 Included Components

- **`install_office.bat`**: 
  Automated setup launcher. Downloads official Microsoft Office Deployment Tool (`setup.exe`) and installs Excel, Word & PowerPoint matching your system language.
- **`activate_office.bat`**: 
  Launches permanent local Ohook activation via Microsoft Activation Scripts (MAS).
- **`configuration-Office365-x64.xml`**: 
  Pre-configured XML template for Microsoft 365 Apps (Current Channel, Auto-Detect Language, x64).
- **`configuration-LTSC2024-x64.xml`**: 
  Pre-configured XML template for Office LTSC Professional Plus 2024 (Auto-Detect Language, x64).

---

## ⚡ Quick Start

1. **Clone the Repository**:
   ```cmd
   git clone https://github.com/moritzpolster14-oss/Office_M365_Setup.git
   cd Office_M365_Setup
   ```

2. **Run Installation**:
   Right-click `install_office.bat` $\rightarrow$ **Run as Administrator**.
   - Select `[1]` for Microsoft 365 Apps or `[2]` for Office LTSC 2024.

3. **Run Activation**:
   Right-click `activate_office.bat` $\rightarrow$ **Run as Administrator**.
   - Press **`2`** for **[Ohook]** and then **`1`** to Install.

4. **Done!**: Excel, Word, and PowerPoint are permanently activated and ready to use in your local OS language.

---

## 📁 Repository Structure

```
.
├── install_office.bat               # Setup starter script (English)
├── activate_office.bat              # Activation starter script (English)
├── configuration-Office365-x64.xml  # XML config for Microsoft 365
├── configuration-LTSC2024-x64.xml   # XML config for Office LTSC 2024
├── .gitignore                       # Temporary files exclusion
└── README.md                        # Documentation (English)
```
