docker run -ti --name ubuntu-fat -v %cd%:/hostDirectory -v /var/run/docker.sock:/var/run/docker.sock -v ubuntu-root:/root ppuetsch/ubuntu-fat:latest
