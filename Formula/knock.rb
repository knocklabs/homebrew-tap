# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Knock < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v0.2.4/knock-v0.2.4-9f02866-darwin-x64.tar.gz"
  version "0.2.4"
  sha256 "c1ef917a7398d66cde8e13a7b6899b8e0f791e60728c71d8dc11faf6bda1b9b5"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
