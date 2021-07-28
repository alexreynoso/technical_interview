"""Test that the ssh package is installed on the server"""


def test_ssh_is_installed(host):
    ssh = ""
    if host.system_info.distribution == "ubuntu":
        ssh = "openssh-server"
    assert host.package(ssh).is_installed


def test_ssh_is_running(host):
    ssh = ""
    if host.system_info.distribution == "ubuntu":
        ssh = "ssh"
    assert host.service(ssh)
