# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class GrootAT0038 < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.38/groot-v0.0.38-f58d1b3-darwin-x64.tar.gz"
  sha256 "dafd5a0dc1b1c28c1a47624fb6d95d287fc7f857796d6246bea8ca5ff3f1f241"
  version "0.0.38"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
