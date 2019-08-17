#create docker container on terraform host

#first read docker provider
#https://www.terraform.io/docs/providers/docker/index.html

#sudo systemctl stop docker

provider "docker" {
  version = "~> 2.0"
}

# Pull Image
resource "docker_image" "ghost" {
  name = "ghost:latest"
}


# Create a container
resource "docker_container" "foo" {
  image = "${docker_image.ghost.latest}"
  name  = "foo"
  #command = ["sleep","1000"]
  ports  { 
      internal = 2368
      external = 81
      }
}



#terraform plan

#Error: Error pinging Docker server: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

#Cannot connect to the Docker daemon at tcp://127.0.0.1:2376