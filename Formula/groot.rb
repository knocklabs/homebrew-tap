# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Groot < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.50/groot-v0.0.50-e98e096-darwin-x64.tar.gz"
  version "0.0.50"
  sha256 "f606af0e6baf85f820d76b2ebf4384c4240ed44de9c1b07a8d112e3d7cf35b41"

  # foo

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
