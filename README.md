# Docker-Recon
After reading an interesting article about bug hunting, I went to replicate the process and had some version compatibility issues with some tools, so I decided to set up a container with the tools used to make the process easier.


# Local Docker Install


- mkdir -p /path/to/your/directory/data
  
*This mounts the /path/to/your/data/directory from your host system into the /data directory inside the container.*

# Start Container

sudo docker run -it --rm -v /path/to/your/directory/data:/data docker-recon

# Simple Commands

- echo "https://dominio.com/" | waybackurls | anew urls.txt
- cat urls.txt | katana | hakrawler -d 3 | anew katana.txt
- cat katana.txt urls.txt | unfurl format %p | anew paths.txt
- cat katana.txt urls.txt | unfurl format %d | anew subs.txt
  
*These commands were suggested in the article, but we may not be limited to them.*
