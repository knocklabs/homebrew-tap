# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class GrootAT0046 < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.46/groot-v0.0.46-4824f09-darwin-x64.tar.gz"
  version "0.0.46"
  sha256 "aa41168fc15bbedb1e796cc56e6a27000d4c0413d49c8c0982f136bfc7336621"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
