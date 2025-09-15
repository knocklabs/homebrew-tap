# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Knock < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.2.0/knock-v0.2.0-fb2d2b4-darwin-x64.tar.gz"
  version "0.2.0"
  sha256 "5ceebb04e4b2f16771aabeb1c75f5507cfbdcf0a1aed921c08d343d8d3a0f375"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
