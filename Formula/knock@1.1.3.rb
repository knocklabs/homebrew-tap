# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class KnockAT113 < Formula
  desc "Build and manage your notifications with Knock directly from the command-line"
  homepage "https://github.com/knocklabs/knock-cli"
  url "https://github.com/knocklabs/knock-cli/releases/download/v1.1.3/knock-v1.1.3-b3b6d88-darwin-x64.tar.gz"
  version "1.1.3"
  sha256 "66b5cad101d3889db66fb52d385cce77297ee27049a9fe00f3748fd973faa3e4"

  def install
    inreplace "bin/knock", /^CLIENT_HOME=/, "export KNOCK_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/knock"
  end

  test do
    system bin/"knock", "--version"
  end
end
