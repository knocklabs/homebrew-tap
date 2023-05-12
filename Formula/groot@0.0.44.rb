# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class GrootAT0044 < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.44/groot-v0.0.44-e461e04-darwin-x64.tar.gz"
  version "0.0.44"
  sha256 "ecfc16063d92d4ba0130f1208bfa74e512dd9a210b48dd8f6393aa713049e987"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
