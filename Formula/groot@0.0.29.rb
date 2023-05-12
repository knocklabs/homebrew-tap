# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class grootAT0029 < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.29/groot-v0.0.29-10dfca2-darwin-x64.tar.gz"
  sha256 "64c795c141b8cf8237427b786d48cc17f28de0ff58c0bf761a72bc9ea599d4ed"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
