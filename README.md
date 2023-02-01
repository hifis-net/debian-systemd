# Systemd Debian Container Images For Ansible and Podman

Systemd Debian Container Images for testing Ansible roles with Molecule and Podman.
Supported Debian versions:

* `11` - Bullseye
* `10` - Buster
* `bookworm` - Bookworm

## Available Images

Images are built weekly via GitHub Actions and can be downloaded from the
GitHub Package Registry.

These tags are available. They are updated on changes to the `main` branch
and are automatically rebuilt once a week.

* `ghcr.io/hifis-net/debian-systemd:11`
* `ghcr.io/hifis-net/debian-systemd:10`
* `ghcr.io/hifis-net/debian-systemd:bookworm`

## How to Use

* [Install Podman](https://podman.io/getting-started/installation)
* Run the container via Podman:

  ```bash
  podman run -it --systemd=true --privileged ghcr.io/hifis-net/debian-systemd:11
  ```

## Authors

This project is maintained by [HIFIS](https://www.hifis.net).
It is built upon https://github.com/geerlingguy/docker-debian11-ansible.
