# docker

A simple httpd server which is hosting a static html website. 

Grab docker file from repo: https://github.com/premaseem/docker/tree/master/httpd

cd to folder where DockerFile exists

# Build image 
$ docker build -t mywebsite .
$> docker build -t <image name> .

# Check images or search 
$ docker images --filter reference=mywebsite
$> docker images --filter reference=<image name> 

# Run docker image 
$ docker run -dit --name my-running-app -p 8083:80 mywebsite
$ docker run -dit --name <containerId> -p 8083:80 <image name> 

# remove container
$ docker rm --force <container name>
