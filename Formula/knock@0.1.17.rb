# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class KnockAT0117 < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.1.17/knock-v0.1.17-a54f3d7-darwin-x64.tar.gz"
  version "0.1.17"
  sha256 "aefb35ea05d6d71391d756b9b4962058ba97afe2e3b5421d0ec8af03e337080d"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
