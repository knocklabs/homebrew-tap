# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

require "language/node"

class Groot < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.4/groot-v0.0.4-1bb504f-darwin-x64.tar.gz"

  depends_on "node"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "version"
  end
end
