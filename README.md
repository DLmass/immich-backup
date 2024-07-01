## immich-backup

This bash script is designed to be used as part of the Duplicati event hooks. It ensures that immich_server, immich_postgres, immich_redis and immich_machine_learning are safely stopped before and restarted after backup and restore operations.

### Prerequisites
* [Docker](https://docs.docker.com/engine/install/)
* [Immich](https://immich.app/docs/install/docker-compose)
* [Duplicati](https://docs.linuxserver.io/images/docker-duplicati/)

  Add these to the Duplicati docker compose file.
  ```yaml
    environment:
      # Let duplicati run as root
      - PUID=0
      - PGID=0
    volumes:
      # Duplicati needs to be able to access docker.sock to be able to start/stop containers.
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/bin/docker:/usr/bin/docker
  ```

### Installation
1. Download the shell script
  ```
    wget -O immich.sh https://raw.githubusercontent.com/DLmass/immich-backup/main/immich.sh
  ```
2. Make the shell script executable
  ```
    sudo chmod +x immich.sh
  ```
3. Move the shell script into your duplicati folder of your installation
  ```
    sudo mv immich.sh /path/to/duplicati/config
  ```

### Usage
Add these to your backup job configuration, can be either CLI or GUI
```
  --run-script-before-required=/config/immich.sh
  --run-script-after=/config/immich.sh