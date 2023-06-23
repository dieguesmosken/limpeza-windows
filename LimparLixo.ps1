# -*- coding: utf-8 -*-
# Função para calcular o tamanho de uma pasta
function Get-FolderSize {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'Container'})]
        [string]$Path
    )

    $size = 0

    $files = Get-ChildItem -Path $Path -File -Recurse -Force -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        $size += $file.Length
    }

    $folders = Get-ChildItem -Path $Path -Directory -Recurse -Force -ErrorAction SilentlyContinue
    foreach ($folder in $folders) {
        $subfolderSize = Get-FolderSize -Path $folder.FullName
        $size += $subfolderSize
    }

    return $size
}

# Função para remover arquivos com tratamento de erros
function Remove-Files {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    $removedCount = 0
    $notRemovedCount = 0

    $files = Get-ChildItem -Path $Path -File -Recurse -Force -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        try {
            Remove-Item $file.FullName -Recurse -Force -ErrorAction Stop
            $removedCount++
        }
        catch {
            $notRemovedCount++
        }
    }

    return $removedCount, $notRemovedCount
}

# Calcula o tamanho da Lixeira
$recycleBinPath = "$env:SystemDrive\`$Recycle.Bin"
$recycleBinSize = Get-FolderSize -Path $recycleBinPath

# Calcula o tamanho da pasta Temp
$tempPath = [System.IO.Path]::GetTempPath()
$tempSize = Get-FolderSize -Path $tempPath

# Exibe o tamanho da Lixeira e da pasta Temp
Write-Host "Tamanho total da Lixeira: $recycleBinSize bytes"
Write-Host "Tamanho total da pasta Temp: $tempSize bytes"
Write-Host ""

# Pergunta se deseja limpar
$limpar = Read-Host "Deseja limpar a Lixeira e a pasta Temp? (S/N)"

if ($limpar -eq "S" -or $limpar -eq "s") {
    # Limpa a Lixeira
    $RecycleBin = New-Object -ComObject Shell.Application
    $RecycleBin.Namespace(0xa).Items() | ForEach-Object {
        Remove-Item $_.Path -Recurse -Force -ErrorAction SilentlyContinue
    }

    # Limpa a pasta Temp
    $removedCount, $notRemovedCount = Remove-Files -Path $tempPath

    Write-Host "Quantidade de arquivos removidos da pasta Temp: $removedCount"
    Write-Host "Quantidade de arquivos não removidos da pasta Temp: $notRemovedCount"
    Write-Host ""
    Write-Host "Limpeza concluída!"
}
else {
    Write-Host "OperaÃ§Ã£o de limpeza cancelada."
}

Read-Host "Pressione Enter para sair"

