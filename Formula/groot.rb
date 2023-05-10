# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

# Reference: https://github.com/twilio/homebrew-brew/blob/main/Formula/twilio.rb

require "language/node"

class Groot < Formula
  desc "I am Groot!"
  homepage "https://github.com/knocklabs/knock-groot"
  url "https://github.com/knocklabs/knock-groot/archive/v0.0.1.tar.gz"
  sha256 "a60820001f8e87a7cb524a72f5e16a80a2e6236ba1956dd0b540fee17392cde0"

  depends_on "node"

  def install
    inreplace "bin/groot", /^CLIENT_HOME=/, "export GROOT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/groot"
  end

  test do
    system bin/"groot", "version"
  end
end
