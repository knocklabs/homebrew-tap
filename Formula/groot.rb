# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Groot < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.52/groot-v0.0.52-1f9ba01-darwin-x64.tar.gz"
  version "0.0.52"
  sha256 "8f2363e8b44eff02d5278a5f2a95673b7b842525f5cdf862217edadfafabf2f7"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
