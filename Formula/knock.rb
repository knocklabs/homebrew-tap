# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Knock < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.1.11/knock-v0.1.11-a7711e8-darwin-x64.tar.gz"
  version "0.1.11"
  sha256 "4902cd40b29c76d382a204d57e9a204c4c70b5274d82f5582f36303037b7a1f8"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
