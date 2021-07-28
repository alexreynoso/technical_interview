"""Test that the ssm package is installed on the server"""


def test_ssm_is_installed(host):
    ssm = ""
    if host.system_info.distribution == "ubuntu":
        ssm = "/var/lib/snapd/snaps/amazon-ssm-agent_2012.snap"
        assert host.file(ssm).exists
    else:
        assert False


def test_ssm_service_is_running(host):
    ssm = ""
    if host.system_info.distribution == "ubuntu":
        ssm = "snap.amazon-ssm-agent.amazon-ssm-agent.service"
    assert host.service(ssm)
