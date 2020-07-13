# ubuntu-fat
A convenient Docker-Image that contains ubuntu-latest and any packages I needed at least once.
## Usage
run `docker run -ti -v %cd%:/hostDirectory -v /var/run/docker.sock:/var/run/docker.sock -v ubuntu-root:/root ppuetsch/ubuntu-fat:latest`  
On windows you can run `ubuntu.bat` from the cloned repository 
### features
* **VolumeExplorer**  
Inside the container, run `/scripts/volumeExplorer.sh`. This will spin up a new ubuntu-fat container where all your named volumes are mounted. They can be found at `/docker-volumes`
* **FileSystem Mount**  
The directory from where you started the ubuntu-fat container will be mounted to `/hostDirectory` inside the container
* **Persistent Volume**
The `/root` path will be persisted as a volume - named ubuntu-root.  