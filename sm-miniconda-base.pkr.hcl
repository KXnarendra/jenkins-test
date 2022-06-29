source "docker" "alpine" {
  image   = "alpine:3.14.0"
  commit  = true
  changes = [
    "ENTRYPOINT /bin/sh"
  ]
}

build {
  sources = ["source.docker.alpine"]

  provisioner "shell" {
    script = "scripts/alpine-install.sh"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "448409259203.dkr.ecr.us-west-2.amazonaws.com/alpine"
      tags       = ["3.14.0-1"]
    }

    post-processor "docker-push" {
      ecr_login    = true
      login_server = "448409259203.dkr.ecr.us-west-2.amazonaws.com"
    }
  }
}
