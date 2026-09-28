# backup.ps1 — резервное копирование каталога docs (аналог backup.sh)

$Src     = Join-Path $HOME "ict_lab2\docs"
$Dest    = Join-Path $HOME "ict_lab2\backup"
$Log     = Join-Path $HOME "ict_lab2\logs\backup.log"
$Stamp   = Get-Date -Format "yyyyMMdd_HHmmss"
$Archive = Join-Path $Dest "docs_$Stamp.zip"

$ErrorActionPreference = "Stop"   # аналог set -e: остановиться при ошибке

# Проверка: существует ли исходный каталог
if (-not (Test-Path $Src -PathType Container)) {
    Write-Host "Ошибка: каталог $Src не существует. Резервное копирование остановлено." -ForegroundColor Red
    exit 1
}

# Создаём каталоги назначения и лога, если их нет
New-Item -ItemType Directory -Force -Path $Dest, (Split-Path $Log) | Out-Null

# Создаём zip-архив каталога docs
Compress-Archive -Path $Src -DestinationPath $Archive

# Записываем строку в лог
Add-Content -Path $Log -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') OK: создан архив $Archive"

# Удаляем архивы старше 7 дней
Get-ChildItem $Dest -Filter "docs_*.zip" |
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } |
    Remove-Item
