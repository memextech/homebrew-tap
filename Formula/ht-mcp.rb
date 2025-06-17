class HtMcp < Formula
  desc "Headless Terminal MCP Server - Control terminal sessions via Model Context Protocol"
  homepage "https://github.com/memextech/ht-mcp"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/memextech/ht-mcp/releases/download/v#{version}/ht-mcp-aarch64-apple-darwin"
      sha256 "e93caabb94dcba7e1f9690d07347805917bf45191e7e8ced74c03f7ac4340cc7"
    else
      url "https://github.com/memextech/ht-mcp/releases/download/v#{version}/ht-mcp-x86_64-apple-darwin"
      sha256 "19ab44223a550dca3a18faaf877db46768dd8eb43f91f41472bd4300fbc1e853"
    end
  else
    url "https://github.com/memextech/ht-mcp/releases/download/v#{version}/ht-mcp-x86_64-unknown-linux-gnu"
    sha256 "047bb4e578bdb67ffa8f49bf684414ca3993ffe780305f560e23352958b20b4c"
  end

  def install
    bin.install Dir["*"].first => "ht-mcp"
  end

  test do
    # Test that the binary exists and shows version/help
    assert_match version.to_s, shell_output("#{bin}/ht-mcp --version 2>&1")
  end
end