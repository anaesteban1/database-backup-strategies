param(
    [string]$OutputDirectory = ".\backups_output"
)

if (-not $env:DATABASE_URL) {
    Write-Host "Falta la variable DATABASE_URL."
    exit 1
}

if (-not (Get-Command pg_dump -ErrorAction SilentlyContinue)) {
    Write-Host "pg_dump no se encuentra instalado o no esta en PATH."
    exit 1
}

New-Item -ItemType Directory -Force $OutputDirectory | Out-Null

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupFile = Join-Path $OutputDirectory "postgres_backup_$timestamp.dump"

Write-Host "Generando backup PostgreSQL..."

& pg_dump `
    --dbname=$env:DATABASE_URL `
    --format=custom `
    --file=$backupFile

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al generar el backup."
    exit 1
}

Write-Host "Backup generado:"
Write-Host $backupFile
