param(
    [string]$OutputDirectory = ".\backups_output"
)

$requiredVariables = @(
    "MYSQLHOST",
    "MYSQLPORT",
    "MYSQLUSER",
    "MYSQLPASSWORD",
    "MYSQLDATABASE"
)

foreach ($variable in $requiredVariables) {
    if (-not (Get-Item "Env:$variable" -ErrorAction SilentlyContinue)) {
        Write-Host "Falta la variable de entorno $variable"
        exit 1
    }
}

if (-not (Get-Command mysqldump -ErrorAction SilentlyContinue)) {
    Write-Host "mysqldump no se encuentra en PATH."
    exit 1
}

New-Item -ItemType Directory -Force $OutputDirectory | Out-Null

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

$backupFile = Join-Path `
    $OutputDirectory `
    "mysql_backup_$timestamp.sql"

Write-Host "Generando respaldo..."

& mysqldump `
    --host=$env:MYSQLHOST `
    --port=$env:MYSQLPORT `
    --user=$env:MYSQLUSER `
    "--password=$($env:MYSQLPASSWORD)" `
    --single-transaction `
    --routines `
    --triggers `
    $env:MYSQLDATABASE |
    Out-File -Encoding utf8 $backupFile

if ($LASTEXITCODE -ne 0) {
    Write-Host "El respaldo fallo."
    exit 1
}

Write-Host "Backup generado correctamente:"
Write-Host $backupFile
