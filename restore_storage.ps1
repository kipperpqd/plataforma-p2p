# Script para restaurar arquivos do Storage Supabase
# Usa a API do Supabase Storage para fazer upload dos arquivos PDF

$SUPABASE_URL = "http://127.0.0.1:54321"
$SERVICE_ROLE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU"
$BUCKET = "faturas"
$BACKUP_DIR = "c:\dev\site-p2p\backup_storage_p2p\stub\stub\faturas"

Write-Host "=== Restaurando Storage do Supabase ===" -ForegroundColor Cyan
Write-Host "Bucket: $BUCKET"
Write-Host "Diretorio de backup: $BACKUP_DIR"
Write-Host ""

# Verificar se o diretório existe
if (-not (Test-Path $BACKUP_DIR)) {
    Write-Host "ERRO: Diretorio nao encontrado: $BACKUP_DIR" -ForegroundColor Red
    exit 1
}

# Encontrar todos os arquivos PDF recursivamente
$files = Get-ChildItem -Path $BACKUP_DIR -Recurse -File

Write-Host "Encontrados $($files.Count) arquivos PDF para upload" -ForegroundColor Yellow
Write-Host ""

$successCount = 0
$errorCount = 0

foreach ($file in $files) {
    # Obter o caminho relativo (ex: triagem/arquivo.pdf ou arquivo.pdf)
    $relativePath = $file.FullName.Substring($BACKUP_DIR.Length + 1).Replace("\", "/")
    
    Write-Host "Uploading: $relativePath" -NoNewline
    
    try {
        $url = "$SUPABASE_URL/storage/v1/object/$BUCKET/$relativePath"
        
        $headers = @{
            "Authorization" = "Bearer $SERVICE_ROLE_KEY"
            "Content-Type"  = "application/pdf"
            "x-upsert"      = "true"
        }
        
        $fileBytes = [System.IO.File]::ReadAllBytes($file.FullName)
        
        $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $fileBytes -ErrorAction Stop
        
        Write-Host " [OK]" -ForegroundColor Green
        $successCount++
    }
    catch {
        Write-Host " [ERRO]" -ForegroundColor Red
        Write-Host "  -> $($_.Exception.Message)" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host ""
Write-Host "=== Resumo ===" -ForegroundColor Cyan
Write-Host "Uploads com sucesso: $successCount" -ForegroundColor Green
Write-Host "Uploads com erro: $errorCount" -ForegroundColor Red
