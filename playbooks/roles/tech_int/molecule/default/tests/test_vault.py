"""Test that vault server is installed and running on the server"""

USER = "vault"
GROUP = USER


def test_vault_user_and_group_are_created(host):
    vaultDir = "/etc/vault/"
    assert host.file(vaultDir).exists
    assert host.user(USER).exists
    assert host.group(GROUP).exists


def test_vault_logs_dir_exists(host):
    vaultLogsDir = "/etc/vault/logs"
    assert host.file(vaultLogsDir).exists
    assert host.file(vaultLogsDir).mode == 0o755
    assert host.file(vaultLogsDir).user == "root"
    assert host.file(vaultLogsDir).group == "root"


def test_vault_is_installed(host):
    vault = "/usr/local/bin/vault"
    assert host.file(vault).exists
    assert host.file(vault).mode == 0o755
    assert host.file(vault).user == "vault"
    assert host.file(vault).group == "vault"


def test_vault_service_is_running(host):
    services = ["vault.service", "vault_init.service", "vault_tag.service"]
    for service in services:
        assert host.service(service).is_enabled
    files = ["/etc/systemd/system/vault.service",
             "/etc/systemd/system/vault_init.service",
             "/etc/systemd/system/vault_tag.service"]
    for file in files:
        assert host.file(file).exists
        assert host.file(file).contains("Unit")
        assert host.file(file).contains("Service")
        assert host.file(file).contains("Install")


def test_vault_certificate_is_created(host):
    certDir = "/etc/vault/certs/"
    assert host.file(certDir).exists
    vaultCerts = ["/etc/vault/certs/rootCA.key", "/etc/vault/certs/rootCA.crt",
                  "/etc/vault/certs/vault.key", "/etc/vault/certs/vault.crt"]
    for cert in vaultCerts:
        assert host.file(cert).exists
        assert host.file(cert).mode == 0o644
        assert host.file(cert).user == "root"
        assert host.file(cert).group == "root"


def test_vault_apt_packages_installed(host):
    packages = ["awscli", "postgresql", "postgresql-contrib", "nfs-common"]
    for package in packages:
        assert host.package(package).is_installed
