# typed: false
# frozen_string_literal: true

# Homebrew formula for dcmclient — install with:
#   brew install dcmkit/tap/dcmclient
class Dcmclient < Formula
  desc "DICOM tools as a command-line toolbox and an agent (MCP) surface, in one binary"
  homepage "https://dcmkit.github.io/dcmclient/"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.3.0/dcmclient-macos-arm64"
      sha256 "cdce9e4e20c9000b1bb33d23b157dab3b448a44350e7dc9a6d1c44463b503ebc"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.3.0/dcmclient-macos-x86_64"
      sha256 "4fc4075e73a3bfd24535f7de47cd7c73e58f895c68809457cd16fb5da1ed943a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.3.0/dcmclient-linux-aarch64"
      sha256 "2295313fcff0aa74683aedeece593b04ba400e4f532e0876445ac96053ca8ef2"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.3.0/dcmclient-linux-x86_64"
      sha256 "a5ddb2cb069cfd82b56a6fcfe1f85e924adcee72239e6a47c3dcbf697c84e6c4"
    end
  end

  def install
    bin.install Dir["*"].first => "dcmclient"
  end

  test do
    assert_match "dcmclient 0.3.0", shell_output("#{bin}/dcmclient --version")
  end
end
