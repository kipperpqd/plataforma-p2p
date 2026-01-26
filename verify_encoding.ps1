
$path = "c:\dev\site-p2p\backup_full_p2p.sql"
$bytes = Get-Content -Path $path -Encoding Byte -TotalCount 50
Write-Host "First 50 bytes:"
$bytes | ForEach-Object { Write-Host -NoNewline "$_ " }
Write-Host ""
Write-Host "As Char (ASCII prediction):"
$bytes | ForEach-Object { Write-Host -NoNewline "$([char]$_) " }
Write-Host ""

$fileItem = Get-Item $path
Write-Host "File size: $($fileItem.Length) bytes"
