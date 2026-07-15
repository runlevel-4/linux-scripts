# uninstall docker
sudo apt purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# cleanup config files
sudo rm -rf /var/lib/docker /var/lib/containerd /etc/docker /var/run/docker.sock

# cleanup apt repositories
sudo rm -rf /etc/apt/keyrings/docker.asc
echo removed docker.asc keyring...
sudo rm -rf /etc/apt/sources.list.d/docker.sources
echo removed docker repo source...


# finish sweeping up
sudo apt-get autoremove -y --purge
