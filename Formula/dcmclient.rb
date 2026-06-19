# typed: false
# frozen_string_literal: true

# Homebrew formula for dcmclient — install with:
#   brew install dcmkit/tap/dcmclient
class Dcmclient < Formula
  desc "DICOM tools as a command-line toolbox and an agent (MCP) surface, in one binary"
  homepage "https://dcmkit.github.io/dcmclient/"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.2.0/dcmclient-macos-arm64"
      sha256 "70ab95de69150ce759e7dd8a1cf0aa33c8d8635a892d62f23c3f77dbd1c3acc3"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.2.0/dcmclient-macos-x86_64"
      sha256 "ee630d187216392a96fe122ab15973fe9f5637cd73af6c8141b920115c389768"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.2.0/dcmclient-linux-aarch64"
      sha256 "589347ebd7b6a4cfbf52189b505a5e750976d4cfe2bb927a73a89d326b250ece"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.2.0/dcmclient-linux-x86_64"
      sha256 "5e6b026bb208f294e398d5f8d89fcc1ed1f9e1078379528bb5039b9d11410422"
    end
  end

  def install
    bin.install Dir["*"].first => "dcmclient"
  end

  test do
    assert_match "dcmclient 0.2.0", shell_output("#{bin}/dcmclient --version")
  end
end
