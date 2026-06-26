# typed: false
# frozen_string_literal: true

# Homebrew formula for dcmclient — install with:
#   brew install dcmkit/tap/dcmclient
class Dcmclient < Formula
  desc "DICOM tools as a command-line toolbox and an agent (MCP) surface, in one binary"
  homepage "https://dcmkit.github.io/dcmclient/"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.0/dcmclient-macos-arm64"
      sha256 "73ecb36496161d3c1baaa790a89278bbe9df767d245d5140d74f1fec61c68641"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.0/dcmclient-macos-x86_64"
      sha256 "7dce4518b43aca3a86149c6b2a491a486996ee5c2e10aabcf2a1879b79f0b597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.0/dcmclient-linux-aarch64"
      sha256 "fa0a294ab3707c8e717fe9cfe97ffd43455ac8ce0938f48e67907914de05495e"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.0/dcmclient-linux-x86_64"
      sha256 "bb80d8c4ce26997c0a28719d68c833a5e1df9aa85fd474d71724fdc3310c9c4f"
    end
  end

  def install
    bin.install Dir["*"].first => "dcmclient"
    bin.install_symlink "dcmclient" => "dcmcli"   # built-in short alias
  end

  test do
    assert_match "dcmclient 0.4.0", shell_output("#{bin}/dcmclient --version")
  end
end
