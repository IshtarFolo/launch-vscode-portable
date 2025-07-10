# vscode-ssd.ps1
<#
	Lance la version portable de VS Code qui est installee sur un appareil de stockage externe.
	Renvoie tous les arguments (folder, file, --install-extension, etc.).
	Se comporte comme le CLI `code` normal.
#>
$codePath = 'D:\portable-apps\VSCode\Code.exe' # Mettre le chemin vers l'app ici
$expectedHash = 'Mettre_Votre_Hash_Ici' 

# Test de securite : Regarde si le chemin existe
if (-Not (Test-Path $codePath)) {
	Write-Error "SSD manquant"
	exit 1
}

# Verification hash SHA256 de l'executable
try {
	$actualHash = (Get-FileHash -Path $codePath -Algorithm SHA256).Hash

	if ($actualHash -ne $expectedHash) {
		Write-Error "Mauvais hash : Code.exe pourrait avoir ete tempere."
		exit 1
	}
	else {
		Write-Host "Hash Ok. Execution de Code.exe." -ForegroundColor Green
	}
}
catch {
	Write-Error "Echec de verification du hash : $_"
	exit 1
}

# Lance VSCode
if ($args.Count -gt 0) {
	$allowedArgs = $args | Where-Object { $_ -notmatch '[;&|]' }

	Start-Process -FilePath "$codePath" -ArgumentList $allowedArgs
}
else {
	Start-Process -FilePath "$codePath"
}
