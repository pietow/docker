echo 'add username to the docker group'
sudo usermod -aG docker ${USER}
echo 'apply new group membership'
su - ${USER}
echo 'Confirm that your user is now added to the docker group'
groups
