#!/usr/bin/env python3

import re
import argparse
import sys
from pathlib import Path

def replace_single_dollars(text):
    # Regex to match single dollars, but not double dollars or escaped dollars
    pattern = r'(?<!\\)((?<!\$)\$(?!\$))((?:\\.|[^\$])+?)(?<!\\)(?<!\$)\$(?!\$)'
    return re.sub(pattern, r'\\(\2\\)', text)

def process_file(input_file, output_file):
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        modified_content = replace_single_dollars(content)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(modified_content)
        
        print(f"Processed {input_file} and saved results to {output_file}")
    except IOError as e:
        print(f"Error processing file {input_file}: {e}", file=sys.stderr)

def main():
    parser = argparse.ArgumentParser(description="Replace single LaTeX dollar signs with \\( and \\)")
    parser.add_argument('files', nargs='+', help='Files to process')
    parser.add_argument('-i', '--in-place', action='store_true', help='Edit files in-place')
    args = parser.parse_args()

    for file in args.files:
        input_path = Path(file)
        if not input_path.is_file():
            print(f"Warning: '{file}' is not a regular file. Skipping.", file=sys.stderr)
            continue

        if args.in_place:
            temp_file = input_path.with_suffix(input_path.suffix + '.tmp')
            process_file(input_path, temp_file)
            temp_file.replace(input_path)
            print(f"Processed {file} in-place")
        else:
            output_path = input_path.with_suffix('.fixed' + input_path.suffix)
            process_file(input_path, output_path)

    print("All files processed successfully.")

if __name__ == "__main__":
    main()
