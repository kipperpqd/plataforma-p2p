
$inputFile = "c:\dev\site-p2p\backup_full_p2p.sql"
$outputFile = "c:\dev\site-p2p\backup_cleaned.sql"

Write-Host "Reading $inputFile..."
$reader = [System.IO.StreamReader]::new($inputFile)
$writer = [System.IO.StreamWriter]::new($outputFile)

$lineCount = 0
$keptCount = 0
$foundPostgres = $false

try {
    while ($null -ne ($line = $reader.ReadLine())) {
        $lineCount++
        
        if ($lineCount % 50000 -eq 0) {
            Write-Host "Processing line $lineCount..." -NoNewline -ForegroundColor Gray
            [Console]::SetCursorPosition(0, [Console]::CursorTop)
        }

        # Skip until we find "\connect postgres"
        if (-not $foundPostgres) {
            if ($line.Trim() -eq "\connect postgres") {
                $foundPostgres = $true
                Write-Host "Found '\connect postgres' at line $lineCount. Starting extraction." -ForegroundColor Cyan
            }
            else {
                continue
            }
        }

        # Check for bad commands (start of line)
        if ($line.StartsWith("\restrict") -or $line.StartsWith("\unrestrict")) {
            continue
        }

        # Also remove the \connect command itself if it might cause issues (optional, but safer to keep if we trust it, or remove if assuming piping to already connected session)
        # We will keep it for now as a marker, but standard pg_restore/psql might complain if user differs.
        # Actually, let's COMMENT it out to be safe, since we are already piping to a specific DB string.
        if ($line.StartsWith("\connect")) {
            $writer.WriteLine("-- $line")
        }
        else {
            $writer.WriteLine($line)
        }
        $keptCount++
    }
}
finally {
    $reader.Close()
    $writer.Close()
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Green
Write-Host "Total lines scanned: $lineCount"
Write-Host "Lines saved: $keptCount"
Write-Host "Cleaned file saved to: $outputFile"
