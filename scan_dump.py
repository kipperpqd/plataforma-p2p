
import sys

filepath = r"c:\dev\site-p2p\backup_full_p2p.sql"

print(f"Scanning {filepath}...")

try:
    with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
        line_num = 0
        for line in f:
            line_num += 1
            if line.startswith(r"\connect"):
                print(f"Line {line_num}: {line.strip()}")
            if "CREATE TABLE public.clientes" in line:
                print(f"Line {line_num}: {line.strip()}")
            if line.startswith(r"\restrict"):
                # Print first few restrict only to avoid spam if many
                if line_num < 1000:
                    print(f"Line {line_num}: {line.strip()}")
            
            if line_num % 1000000 == 0:
                print(f"Scanned {line_num} lines...")

    print(f"Total lines: {line_num}")

except Exception as e:
    print(f"Error: {e}")
