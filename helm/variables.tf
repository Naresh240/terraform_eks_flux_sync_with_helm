variable github_url {
    type    = string
}

variable github_username {
    type    = string
}

variable github_password {
    type    = string
    sensitive   = true
}

variable github_branch {
    type    = string
}

variable github_infra_path {
    type    = string
}