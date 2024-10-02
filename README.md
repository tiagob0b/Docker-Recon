# Docker-Recon
After reading an interesting article about bug hunting, I went to replicate the process and had some version compatibility issues with some tools, so I decided to set up a container with the tools used to make the process easier.

[Hunting for hidden API endpoints using Katana and Hakraler](https://anasbetis023.medium.com/hunting-for-hidden-api-endpoints-using-katana-and-hakraler-ba0bd6b9611f)

# Local Docker Install

$ sudo docker build -t image-name /path/to/your/Dockerfile

$ mkdir -p /path/to/your/directory/data
  
*This mounts the /path/to/your/data/directory from your host system into the /data directory inside the container.*

# Start Container

$ sudo docker run -it --rm -v /path/to/your/directory/data:/data docker-recon

# Simple Commands

$ echo "https://dominio.com/" | waybackurls | anew urls.txt

$ cat urls.txt | katana | hakrawler -d 3 | anew katana.txt

$ cat katana.txt urls.txt | unfurl format %p | anew paths.txt

$ cat katana.txt urls.txt | unfurl format %d | anew subs.txt
  
*These commands were suggested in the article, but we may not be limited to them.*

*I recommend analyzing the features of Katana and Hakrawler in depth.*
- [Katana](https://github.com/projectdiscovery/katana/)
- [Hackrawler](https://github.com/hakluke/hakrawler)
- [Unfurl](https://github.com/tomnomnom/unfurl)
