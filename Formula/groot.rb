# Reference:
# https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

class Groot < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/releases/download/v0.0.14/groot-v0.0.14-dd228c2-darwin-x64.tar.gz"
  sha256 "2d976b373d79c8af1a6aa4435290d8419c004eb629f47f0d96c9cb5c5a0aae04"
  license ""

  bottle do
    root_url "https://github.com/knocklabs/homebrew-tap/releases/download/groot-64"
    sha256 cellar: :any_skip_relocation, monterey: "aadbe69513c1b4bf83358fac158cca44097b42d158176bb0f366be3b2364d4c0"
  end

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "--version"
  end
end
