# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class KnockAT0122 < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.1.22/knock-v0.1.22-09cd177-darwin-x64.tar.gz"
  version "0.1.22"
  sha256 "a599c46bec3083eef22d7f3341024f2927454a528622a8f31af3b9b49ce6764a"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
