# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Knock < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v1.1.2/knock-v1.1.2-2e95868-darwin-x64.tar.gz"
  version "1.1.2"
  sha256 "c154f50f42b7bc5a93289264ba86cdefdb5b1116368cafc7f60294348588c653"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
