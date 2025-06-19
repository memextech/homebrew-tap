class HtMcp < Formula
  desc "Headless Terminal MCP Server - Control terminal sessions via Model Context Protocol"
  homepage "https://github.com/memextech/ht-mcp"
  version "0.1.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/memextech/ht-mcp/releases/download/v0.1.3/ht-mcp-aarch64-apple-darwin"
      sha256 "dba2d2619c01f4c8565402e64a971b1bd7acb171148e06fb6ae80bb018dc3de3"
    else
      url "https://github.com/memextech/ht-mcp/releases/download/v0.1.3/ht-mcp-x86_64-apple-darwin"
      sha256 "9d169deff1097a0306b1c4f53b0e51502e1c5aebcca9fb9e2601ae1604cbfcd6"
    end
  else
    url "https://github.com/memextech/ht-mcp/releases/download/v0.1.3/ht-mcp-x86_64-unknown-linux-gnu"
    sha256 "c5c1cb011bc925c8ce6538308af6f0615bd83b34e3258f4105d954675936cd26"
  end

  def install
    bin.install Dir["*"].first => "ht-mcp"
  end

  test do
    # Test that the binary exists and shows version/help
    output = shell_output("#{bin}/ht-mcp --version 2>&1", 1)
    assert_match "ht-mcp", output
  end
end
