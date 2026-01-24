# Script para restaurar arquivos do Storage Supabase (Versão Coolify/Remota)
# Uso: .\restore_storage_coolify.ps1 -Url "https://seu-projeto.coolify.io" -Key "service_role_key"

param (
    [Parameter(Mandatory = $true)]
    [string]$Url,

    [Parameter(Mandatory = $true)]
    [string]$Key
)

$BUCKET = "faturas"
# Caminho confirmado durante a analise
$BACKUP_DIR = "c:\dev\site-p2p\backup_storage_p2p\stub\stub\faturas"

Write-Host "=== Restaurando Storage do Supabase (Remoto) ===" -ForegroundColor Cyan
Write-Host "Target URL: $Url"
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
    # Ajuste: removemos o prefixo do backup dir para pegar o caminho relativo correto dentro do bucket
    $relativePath = $file.FullName.Substring($BACKUP_DIR.Length + 1).Replace("\", "/")
    
    Write-Host "Uploading: $relativePath" -NoNewline
    
    try {
        # Nota: Ajustado para o endpoint padrao do Supabase Storage
        $endpoint = "$Url/storage/v1/object/$BUCKET/$relativePath"
        
        $headers = @{
            "Authorization" = "Bearer $Key"
            "Content-Type"  = "application/pdf"
            "x-upsert"      = "true"
        }
        
        $fileBytes = [System.IO.File]::ReadAllBytes($file.FullName)
        
        $response = Invoke-RestMethod -Uri $endpoint -Method Post -Headers $headers -Body $fileBytes -ErrorAction Stop
        
        Write-Host " [OK]" -ForegroundColor Green
        $successCount++
    }
    catch {
        Write-Host " [ERRO]" -ForegroundColor Red
        Write-Host "  -> $($_.Exception.Message)" -ForegroundColor Red
        if ($_.Exception.Response) {
            # Tenta ler o corpo do erro se disponivel
            $reader = New-Object System.IO.StreamReader $_.Exception.Response.GetResponseStream()
            $errBody = $reader.ReadToEnd()
            Write-Host "  -> Detalhes: $errBody" -ForegroundColor DarkRed
        }
        $errorCount++
    }
}

Write-Host ""
Write-Host "=== Resumo ===" -ForegroundColor Cyan
Write-Host "Uploads com sucesso: $successCount" -ForegroundColor Green
Write-Host "Uploads com erro: $errorCount" -ForegroundColor Red
