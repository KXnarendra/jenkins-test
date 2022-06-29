source "docker" "anaconda" {
  image   = "ubuntu:20.04"
  commit  = true
  changes = [
    "ENTRYPOINT /bin/bash",
    "LABEL description='Smart Mobility Gramener Anaconda Base Image'"
  ]
}

build {
  sources = ["source.docker.anaconda"]

  provisioner "file" {
    source      = "scripts/miniconda.sh"
    destination = "/miniconda.sh"
  }

  provisioner "shell" {
    script = "scripts/miniconda-install.sh"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "448409259203.dkr.ecr.us-west-2.amazonaws.com/miniconda-base"
      tags       = ["4.13.0"]
    }

    post-processor "docker-push" {
      ecr_login    = true
      login_server = "448409259203.dkr.ecr.us-west-2.amazonaws.com"
    }
  }
}
