# timequote

A Bash-based Linux CLI for displaying, searching, and managing original time-themed quotes.

## Features

- Display a random time-themed quote
- Search quotes by theme or text
- Search across categories such as:
  - Technology
  - Cybersecurity
  - Linux
  - Learning
  - Debugging
  - Discipline
  - Failure
  - Curiosity
- Random quote selection
- Dynamic quote formatting
- Simple command-line interface
- Install and uninstall scripts

## Requirements

- Linux or another Unix-like environment
- Bash
- `sudo`
- Git

## Installation

Clone the repository:

```bash
git clone https://github.com/iamridwansec/timequote.git
```

Enter the project directory:

```bash
cd timequote
```

Make the installer executable:

```bash
chmod +x install.sh
```

Run the installer:

```bash
./install.sh
```

After installation, `timequote` can be run from any directory:

```bash
timequote
```

## Usage

### Random time quote

Run:

```bash
timequote
```

or explicitly:

```bash
timequote --random
```

### Search quotes

Search by category or text:

```bash
timequote --search cybersecurity
```

```bash
timequote --search linux
```

```bash
timequote --search weakness
```

If no matching quote is found:

```text
No matching quote found.
```

### Help

```bash
timequote --help
```

### Invalid options

Unknown options are handled with an error message:

```text
Unknown option: --example
Use --help to see available options.
```

## Uninstallation

From the project directory, run:

```bash
./uninstall.sh
```

This removes the installed command from:

```text
/usr/local/bin/timequote
```

## Project Structure

```text
timequote/
├── timequote.sh
├── install.sh
├── uninstall.sh
└── README.md
```

## How It Works

`timequote` stores quotes in Bash arrays and uses random selection to display one quote at a time.

Searches can match either the quote text or its associated category.

The output is formatted dynamically so that shorter quotes use smaller quote boxes while longer quotes are wrapped across multiple lines.

## Example

```text
-------------------------------------------------------
Security begins with questioning what everyone else
accepts.
                                         ~ iamridwansec
-------------------------------------------------------
```

## Learning Purpose

`timequote` is also a practical Bash and Linux learning project.

The project is intentionally developed incrementally, with each improvement used to practice concepts such as:

- Bash variables
- Arrays
- Functions
- Loops
- Conditional statements
- String manipulation
- Random selection
- Exit statuses
- Command-line arguments
- File handling
- Executable permissions
- `$PATH`
- `/usr/local/bin`
- Installation and uninstallation
- Basic error handling

The project will continue evolving as new Bash and Linux concepts are learned.

## Author

**iamridwansec**

## License

This project is open source and available under the MIT License.
