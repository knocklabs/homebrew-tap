# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Knock < Formula
  desc "Knock CLI"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.1.0/knock-v0.1.0-08af474-darwin-x64.tar.gz"
  version "0.1.0"
  sha256 "0b6118a149231101c33bb74ad67db240f4235469d8d34949d6cfcc359c870d63"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
