# PortScanner

PortScanner is an Elixir-based tool for scanning open ports on specified targets. It supports scanning multiple targets and provides banners for open ports when available.

## Features

- Scans ports from 1 to 65535.
- Resolves hostnames to IP addresses.
- Displays banners for open ports (if available).
- Supports scanning multiple targets simultaneously.

## Requirements

- Elixir installed on your system.

## Installation

1. Clone this repository:
   ```sh
   git clone <repository-url>

Collecting workspace information

Here is a suggested `README.md` file:

```markdown
# PortScanner

PortScanner is an Elixir-based tool for scanning open ports on specified targets. It supports scanning multiple targets and provides banners for open ports when available.

## Features

- Scans ports from 1 to 65535.
- Resolves hostnames to IP addresses.
- Displays banners for open ports (if available).
- Supports scanning multiple targets simultaneously.

## Requirements

- Elixir installed on your system.

## Installation

1. Clone this repository:
   ```sh
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```sh
   cd <project-directory>
   ```

## Usage

Run the script using the Elixir interpreter:

```sh
elixir portscanner.exs
```

You will be prompted to enter the target(s) to scan. Provide IP addresses or hostnames separated by commas (e.g., `192.168.1.1, example.com`).

## Example Output

```plaintext
[+] Enter Target/s To scan (split multiple targets with ,): 192.168.1.1, example.com
[+] Scanning 192.168.1.1...
[+] Open Port 22 - No banner available.
[+] Open Port 80: Apache/2.4.41 (Ubuntu).
[+] Scanning example.com...
[+] Open Port 443: nginx/1.18.0.
```

## License

This project is licensed under the MIT License. See the 

LICENSE

 file for details.

## Disclaimer

Use this tool responsibly. Ensure you have permission to scan the targets you specify.
