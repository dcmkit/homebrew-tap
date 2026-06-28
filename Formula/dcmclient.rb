# typed: false
# frozen_string_literal: true

# Homebrew formula for dcmclient — install with:
#   brew install dcmkit/tap/dcmclient
class Dcmclient < Formula
  desc "DICOM tools as a command-line toolbox and an agent (MCP) surface, in one binary"
  homepage "https://dcmkit.github.io/dcmclient/"
  version "0.4.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.5/dcmclient-macos-arm64"
      sha256 "f618812f40022fcad8baac266d0a38ebbbb018001aba9d7afbdbc61abab8be77"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.5/dcmclient-macos-x86_64"
      sha256 "7784bee2208b5ea29059af93b8e681c7244d0b2fc37cce44db297f4bef90ae4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.5/dcmclient-linux-aarch64"
      sha256 "5d6b45b9a88b1772db65263adc163d3d157f5cb05497d16f157a4c2c09da36e8"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.4.5/dcmclient-linux-x86_64"
      sha256 "61001f5e4288cf782f0ac16a6ddab24f65f8ed66126c3658cc4f2ea2cf456baf"
    end
  end

  def install
    bin.install Dir["*"].first => "dcmclient"
    bin.install_symlink "dcmclient" => "dcmcli"   # built-in short alias
  end

  test do
    assert_match "dcmclient 0.4.5", shell_output("#{bin}/dcmclient --version")
  end
end
