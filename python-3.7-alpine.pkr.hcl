source "docker" "python" {
  image   = "python:3.7-alpine3.12"
  commit  = true
  changes = [
    "ENTRYPOINT /bin/sh",
    "LABEL description='Smart Mobility Dashboard API base image'"
  ]
}

build {
  sources = ["source.docker.python"]

  provisioner "shell" {
    script = "scripts/python-alpine-install.sh"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "448409259203.dkr.ecr.us-west-2.amazonaws.com/python"
      tags       = ["3.7-alpine3.12"]
    }

    post-processor "docker-push" {
      ecr_login    = true
      login_server = "448409259203.dkr.ecr.us-west-2.amazonaws.com"
    }
  }
}
