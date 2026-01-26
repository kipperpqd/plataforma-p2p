
import sys

input_file = r"c:\dev\site-p2p\backup_full_p2p.sql"
output_file = r"c:\dev\site-p2p\backup_filtered.sql"

print(f"Filtering {input_file} to {output_file}...")

start_marker = r"\connect postgres"
found_marker = False
lines_written = 0

try:
    with open(input_file, 'r', encoding='utf-8', errors='replace') as fin, \
         open(output_file, 'w', encoding='utf-8') as fout:
        
        for line in fin:
            # 1. Look for start marker
            if not found_marker:
                if line.startswith(start_marker):
                    found_marker = True
                    print(f"Found marker '{start_marker}'. Starting extraction.")
                    # We write the connect command too, or comment it out if we want to rely on CLI connection?
                    # The CLI connection is to 'postgres' DB. Ideally irrelevant, but safe to keep or comment.
                    # Let's keep it, but stripped of weird args if any.
                    fout.write("-- " + line) # Commenting out to be safe and use Docker CLI DB
                continue
            
            # 2. Filter invalid commands in the target section
            if line.startswith(r"\restrict") or line.startswith(r"\unrestrict"):
                fout.write("-- " + line)
                continue
            
            # 3. Filter Role stuff if it appears here (unlikely but safe)
            if line.startswith("CREATE ROLE") or line.startswith("ALTER ROLE"):
                fout.write("-- " + line)
                continue

            # 4. Write line
            fout.write(line)
            lines_written += 1

    print(f"Done. Written {lines_written} lines to {output_file}.")

except Exception as e:
    print(f"Error: {e}")
