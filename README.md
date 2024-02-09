# Ansible Playbook Runner

This project contains a script that installs Ansible and runs an Ansible playbook based on the operating system (Ubuntu or Arch Linux). Currently, the playbooks are set up to install Apache, but more playbooks may be added in the future.

## Prerequisites

- Ubuntu or Arch Linux
- sudo privileges

## Usage

1. Clone the repository:

```bash
git clone https://github.com/damien-mathieu1/ansible-playbook-runner
cd ansible-playbook-runner
```

2. Make the script executable:

```bash
chmod +x run_playbook.sh
```

3. Run the script with sudo privileges:

```bash
sudo ./run_playbook.sh
```

The script will install Ansible if it's not already installed, and then run the appropriate playbook based on the operating system.

## Playbooks

The playbooks are located in the same directory as the script. The `playbook.yaml` file contains tasks for both Ubuntu and Arch Linux, and uses tags to determine which tasks to run.

- For Ubuntu, the tasks are tagged with "ubuntu".
- For Arch Linux, the tasks are tagged with "archlinux".

The script uses these tags to run the appropriate tasks based on the operating system.

Currently, the playbooks are set up to install Apache, but more playbooks may be added in the future.

## Inventory

The `inventory.yaml` file contains the hosts that the playbook will be run on. By default, it's set to run on localhost.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
