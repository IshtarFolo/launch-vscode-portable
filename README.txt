![PowerShell](https://raw.githubusercontent.com/tandpfun/skill-icons/65dea6c4eaca7da319e552c09f4cf5a9a8dab2c8/icons/Powershell-Dark.svg)
# Launch Portable VS Code

## 🇫🇷 Script simple pour lancer une version portable de VS Code à l'aide d'un alias avec PowerShell.

Ce petit projet est un premier essai de scripting Shell avec PowerShell.

Le script effectue les opérations suivantes :

1. ✅ Vérifie si le périphérique de stockage externe est connecté.  
2. ✅ Vérifie l'intégrité du fichier `.exe` en comparant le hachage SHA256 généré à un hachage connu et de confiance.  
3. ✅ Lance l'application avec ou sans arguments, selon les paramètres fournis par l'utilisateur.

---

### 🔧 Configuration (FR)

Avant d’utiliser le script, modifiez les variables suivantes :

- `$codePath` : chemin vers votre exécutable VS Code portable.  
- `$expectedHash` : hachage SHA256 du fichier `Code.exe`, que vous pouvez obtenir avec `Get-FileHash`.

L'utilisateur doit créer une variable d’environnement pointant vers ce script, puis ajouter un alias dans un fichier de profil (`$PROFILE`) pour y accéder rapidement via la ligne de commande.

---

## 🇬🇧 Simple script to launch a portable version of VS Code using an alias in PowerShell.

This small project is a first attempt at Shell scripting with PowerShell.

The script performs the following:

1. ✅ Checks if the external storage device is connected.  
2. ✅ Verifies the integrity of the `Code.exe` file by comparing its SHA256 hash to a known and trusted one.  
3. ✅ Launches the app with or without arguments, depending on what the user passes (e.g., folder path, file, or CLI options).

---

### 🔧 Configuration (EN)

Before using the script, edit the following variables:

- `$codePath`: the full path to your portable VS Code executable.  
- `$expectedHash`: the trusted SHA256 hash of `Code.exe`, which you can generate using `Get-FileHash`.

You should then add an environment variable pointing to this script, and define a PowerShell alias in your profile (`$PROFILE`) to use it like a command.

---

### ▶️ Examples / Exemples d’utilisation

```powershell
# Just open VS Code normally
vscode-ssd

# Open a specific folder
vscode-ssd "C:\Users\YourName\Projects\MyApp"

# Open a file
vscode-ssd "C:\Users\YourName\Documents\notes.txt"

# Install an extension
vscode-ssd --install-extension ms-python.python
