# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class GrootAT0034 < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.34/groot-v0.0.34-29731c8-darwin-x64.tar.gz"
  sha256 "e3a5570368fe7a69cca7bbc26b0b44c47c1c2120313d411d2214284c73545e1b"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
