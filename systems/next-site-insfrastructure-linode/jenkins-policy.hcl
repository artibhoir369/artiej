path "secrets/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}
path "kv-v2/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to manage its own cubbyhole
path "cubbyhole/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow a token to manage its own ssh
path "ssh/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}