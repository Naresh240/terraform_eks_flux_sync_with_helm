resource helm_release flux2 {
    name       = "flux2"
    chart      = "${path.module}/helm-flux2/"
    namespace = "flux-system"
    create_namespace = true

    set {
        name  = "helmcontroller.create"
        value = "true"
    }
}

resource helm_release flux-sync {
    name       = "flux-sync"
    chart      = "${path.module}/helm-flux-sync/"
    namespace = "flux-system"

    set {
        name  = "secret.data.username"
        value = var.github_username
    }

    set {
        name  = "secret.data.password"
        value = var.github_password
    }  

    set {
        name  = "gitRepository.spec.url"
        value = var.github_url
    }

    set {
        name  = "gitRepository.spec.ref.branch"
        value = var.github_branch
    }

    set {
        name  = "kustomization.spec.path"
        value = var.github_infra_path
    }   

    set {
        name = "secret.create"
        value = true
    }
    depends_on = [helm_release.flux2]
}