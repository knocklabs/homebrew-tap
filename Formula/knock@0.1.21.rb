# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class KnockAT0121 < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.1.21/knock-v0.1.21-d63dca6-darwin-x64.tar.gz"
  version "0.1.21"
  sha256 "240b386dddcba0978ffd5cf515623734597589ac97e12f0d4c3dce51816fe31b"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
