"""Test that the admin tools are installed on the server"""


def test_tools_are_installed(host):
    tools = []
    if host.system_info.distribution == "ubuntu":
        tools = [
            "jq",
            "zip",
            "nnn",
            "tmux",
            "lnav",
            "htop",
            "awscli",
            "httpie"]
        for tool in tools:
            assert host.package(tool).is_installed
