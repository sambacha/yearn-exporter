project = "yearn-exporter"


# An application to deploy.
app "exporter" {
  labels = {
    "service" = "brownie",
    "env"     = "dev"
 }

    # Build specifies how an application should be deployed. In this case,
    # we'll build using a Dockerfile and keeping it in a local registry.
    build {
        use "docker" {}
        
    }

    # Deploy to Docker
    deploy {
        use "docker" {}
    }
}
