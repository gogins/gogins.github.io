import os
import subprocess

def generate_html_links(directory, output_file):
    # Get list of .htl files tracked by Git in the specified directory
    try:
        git_files = subprocess.check_output(['git', 'ls-files'], cwd=directory, encoding='utf-8').splitlines()
    except subprocess.CalledProcessError:
        print("Error: This directory is not part of a Git repository.")
        return

    htl_files = [f for f in git_files if f.endswith('.html') and os.path.dirname(f) == '']

    # Start building HTML content
    html_content = ['<ul>']
    for file in sorted(htl_files):
        link = f'<li><a href="{file}">{file}</a></li>'
        html_content.append(link)
    html_content.append('</ul>')

    # Write to the output file
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(html_content))

    print(f"Hyperlink list written to: {output_file}")

# Example usage
if __name__ == "__main__":
    directory_to_scan = '.'  # Current directory
    output_filename = 'html_file_links.txt'
    generate_html_links(directory_to_scan, output_filename)
