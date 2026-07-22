# 📦 Microsoft 365 & Office 2024 Setup

Automatisches Installations- & Aktivierungsprojekt für **Microsoft 365** und **Office LTSC 2024** (64-Bit, Deutsch: Excel, Word, PowerPoint).

---

## 🌟 Enthaltene Komponenten

- **`install_office.bat`**: 
  Download- & Installations-Starter (lädt das offizielle Microsoft Office Deployment Tool herunter und installiert Excel, Word & PowerPoint).
- **`activate_office.bat`**: 
  Startet die dauerhafte lokale Ohook-Aktivierung über Microsoft Activation Scripts.
- **`configuration-Office365-x64.xml`**: 
  Vorkonfigurierte XML für Microsoft 365 Apps (Current Channel, Deutsch, x64).
- **`configuration-LTSC2024-x64.xml`**: 
  Vorkonfigurierte XML für Office LTSC Professional Plus 2024 (Deutsch, x64).

---

## ⚡ Schnellstart auf einem frischen PC

1. **Repository klonen**:
   ```cmd
   git clone https://github.com/moritzpolster14-oss/Office_M365_Setup.git
   cd Office_M365_Setup
   ```

2. **Installation starten**:
   Rechtsklick auf `install_office.bat` $\rightarrow$ **Als Administrator ausführen**.
   - Wähle `[1]` für Microsoft 365 oder `[2]` für Office LTSC 2024.

3. **Aktivierung ausführen**:
   Rechtsklick auf `activate_office.bat` $\rightarrow$ **Als Administrator ausführen**.
   - Drücke **`2`** für **[Ohook]** und anschließend **`1`** zum Installieren.

4. **Fertig**: Excel, Word und PowerPoint sind dauerhaft freigeschaltet.

---

## 📁 Ordnerstruktur

```
.
├── install_office.bat          # Starter für Download & Installation
├── activate_office.bat         # Starter für die Ohook-Aktivierung
├── configuration-Office365-x64.xml # XML-Vorlage für Microsoft 365
├── configuration-LTSC2024-x64.xml  # XML-Vorlage für Office LTSC 2024
├── .gitignore                  # Ausschluss von lokalen temporären Dateien
└── README.md                   # Dokumentation
```
