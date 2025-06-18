class HtMcp < Formula
  desc "Headless Terminal MCP Server - Control terminal sessions via Model Context Protocol"
  homepage "https://github.com/memextech/ht-mcp"
  version "0.1.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/memextech/ht-mcp/releases/download/v0.1.2/ht-mcp-aarch64-apple-darwin"
      sha256 "7cc10ed40104be9d3d098869c307aeef0cd2c838bb0a9fca5653fbecdfb92672"
    else
      url "https://github.com/memextech/ht-mcp/releases/download/v0.1.2/ht-mcp-x86_64-apple-darwin"
      sha256 "fb3d3cd8ba81818349c939f7303250824bc5039390ce473a8d14c1876f5408b3"
    end
  else
    url "https://github.com/memextech/ht-mcp/releases/download/v0.1.2/ht-mcp-x86_64-unknown-linux-gnu"
    sha256 "b7c287980cc01d1c0b4ff8b2450f9bdedda3624ccdff533d22661785b64d1424"
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
