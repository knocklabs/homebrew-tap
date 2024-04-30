# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class KnockAT0110 < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.1.10/knock-v0.1.10-77daab5-darwin-x64.tar.gz"
  version "0.1.10"
  sha256 "fd3dda2bf39ddacb9bfbd40e6938310f5fad3ea7ede9cf9cc4b9d21e1aa28027"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
