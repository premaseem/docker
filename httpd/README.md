# docker

A simple httpd server which is hosting a static html website. 

Grab docker file from repo: https://github.com/premaseem/docker/tree/master/httpd

cd to folder where DockerFile exists

# Build image 
$ docker build -t mywebsite .    


# Check images or search 
$ docker images --filter reference=mywebsite


# Run docker image 
$ docker run -dit --name my-running-website -p 8083:80 mywebsite


# remove container when done
$ docker rm --force my-running-website
