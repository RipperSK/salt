# Salt Configuration Repository

A SaltStack infrastructure automation repository for managing Linux and Windows systems configuration, OS updates, package management, and system provisioning.

## Overview

This repository contains SaltStack states and utility scripts for centralized system configuration management across heterogeneous environments. It enables infrastructure-as-code practices for deploying packages, managing users, handling SSH keys, configuring DNS, and orchestrating OS updates.

## Repository Structure

```
salt/
├── top.sls                      # Main SaltStack state targeting
├── packages/                    # Linux package management states
├── win-packages/                # Windows package management states (Chocolatey)
├── os_update/                   # OS update states and configurations
├── users/                       # User account management states
├── ssh_authorized_keys/         # SSH key distribution states
├── sudoers/                     # Sudoers configuration states
├── resolvconf/                  # DNS resolver configuration states
├── bashrc/                      # Bash environment states
├── docker/                      # Docker-related configurations
├── recent2/                     # Additional states or recent configurations
├── *.sh                         # Utility scripts for orchestration
└── LICENSE                      # MIT License
```

## Key Components

### SaltStack States (65.8%)
- **top.sls**: Master state file that targets different minion types:
  - `packages` state for all Linux minions
  - `win-packages` state for Windows minions
- **Modular States**: Organized directories for specific configuration domains (users, SSH keys, sudoers, DNS, etc.)

### Utility Scripts (34.2%)

#### OS Update Orchestration
- **salt-os-upgrade.sh**: Main script to orchestrate OS updates across all online Linux minions
  - Generates dynamic minion list
  - Runs `os_update` state against the list
  - Logs all activity with timestamps
  
- **generate_linux_minion_list.sh**: Generates inventory of online Linux servers
  - Uses Salt's `test.ping` with Linux kernel grain filter
  - Outputs sorted list to `/srv/salt/all-linux-minions-list.ini`

- **report-os-upgrade.sh**: Parses OS upgrade logs to report failures
  - Identifies failed states by minion
  - Outputs summary of minions requiring manual intervention

#### Bootstrap Scripts
- **choco-bootstrap.sh**: Windows Chocolatey bootstrap script
  - Initializes Chocolatey on Windows minions
  - Configures PowerShell execution policy

## Technology Stack

- **SaltStack**: Infrastructure automation and configuration management
- **Chocolately**: Installed via script or [guide](https://chocolatey.org/install)
- **Shell**: Bash scripts for utility and orchestration
- **Supported Platforms**:
  - Linux (tested on Debian and Alma Linux)
  - Windows (tested on win10 and win11)
- **License**: MIT

## Getting Started

### Prerequisites
- SaltStack Master and Minions installed and configured
- ZeroMQ connectivity between Master and Minions allowed
  - TCP ports 4505 and 4506 opened on Master
- Minions must be properly registered with the Master

### Basic Usage

#### Apply all states to all minions:
```bash
salt '*' state.apply
```

#### Check connectivity of all minions:
```bash
salt '*' test.ping
```

#### Issue a specific command to Linux minions:
```bash
salt -G 'kernel:Linux' cmd.run 'grep -i pretty /etc/os-release'
```

#### Apply specific state to Windows minions:
```bash
salt -G 'os:Windows' state.apply win-packages
```

#### Run OS updates across whole Linux infrastructure:
```bash
./salt-os-upgrade.sh
```

#### Generate report of update failures:
```bash
./report-os-upgrade.sh
```

## State Management

The repository uses SaltStack's modular approach where states are organized by function:
- **Packages**: System package installation and management
- **Users**: User account creation and configuration
- **SSH Keys**: Authorized SSH key distribution
- **Sudoers**: Privilege escalation configuration
- **DNS**: Resolver configuration via resolvconf
- **Shell**: Bashrc customization and defaults

Target configurations by grain matching (e.g., `G@os:Windows` for Windows systems).

## Best Practices

1. **Test State Changes**: Use Salt's test functionality before applying state changes
1. **Lint yaml syntax**: Via yamllint cli tool
1. **Logging**: All orchestration scripts include comprehensive logging with timestamps
1. **Dynamic Inventory**: Scripts automatically discover online minions rather than using static lists
1. **Cross-Platform**: Distinct states for Linux and Windows with appropriate grain-based targeting

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

[RipperSK](spiak.roman@gmail.com)
