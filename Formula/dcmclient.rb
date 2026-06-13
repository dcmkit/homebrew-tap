# typed: false
# frozen_string_literal: true

# Homebrew formula for dcmclient — install with:
#   brew install dcmkit/tap/dcmclient
class Dcmclient < Formula
  desc "DICOM tools as a command-line toolbox and an agent (MCP) surface, in one binary"
  homepage "https://dcmkit.github.io/dcmclient/"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.1.2/dcmclient-macos-arm64"
      sha256 "05f4ab39802be9e0c5b8bb4d96522088d05622fef0aa0eabe54dd7affa10ba79"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.1.2/dcmclient-macos-x86_64"
      sha256 "3ae123a456f0798e32f95be40d4ca86c08e57072fcce7287fed68410f870bbab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.1.2/dcmclient-linux-aarch64"
      sha256 "883b90320a732c995a9eb23d06af80ddb28fbf9df21dfbffdae574084e3f18f4"
    end
    on_intel do
      url "https://github.com/dcmkit/dcmclient/releases/download/v0.1.2/dcmclient-linux-x86_64"
      sha256 "6f194d00309642857fcb386c34561f8c04be1a28392dcb2df602d3d112513d04"
    end
  end

  def install
    bin.install Dir["*"].first => "dcmclient"
  end

  test do
    assert_match "dcmclient 0.1.2", shell_output("#{bin}/dcmclient --version")
  end
end
