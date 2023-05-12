# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Groot < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.26/groot-v0.0.26-cb6e95a-darwin-x64.tar.gz"
  sha256 "01464e76c4edd30d3973e54eca49be102d0fd4e7b9d808afea6cca8b556dd702"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
