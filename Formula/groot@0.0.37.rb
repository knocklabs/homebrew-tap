# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class GrootAT0037 < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.37/groot-v0.0.37-0f7efaa-darwin-x64.tar.gz"
  sha256 "cb30c49589854db38e144622989c69340391fac63dd02d376f8350f296381747"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
