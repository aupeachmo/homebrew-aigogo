class Aigg < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.6"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.6/aigg-darwin-amd64.tar.gz"
      sha256 "74d9bcd33a282f1240d4dc8f767a87c6139f6363f52a7a8a6083620843f3c9c1"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.6/aigg-darwin-arm64.tar.gz"
      sha256 "f4d0c0eb5e493c42b5599a48cbaa6fde11d3c64c73ebe0a5b25184fa992b1b09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.6/aigg-linux-amd64.tar.gz"
      sha256 "4ffb8f8ed1dab4f0f1a9c1359a0c5094f398dfde4a9ec87b039d5f2c4402cf4f"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.6/aigg-linux-arm64.tar.gz"
      sha256 "2b19c80f14d155cd0e5b80e0071e25789e9ec75418b8aa9104ad3a9134c0fd01"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "aigg-darwin-arm64" => "aigg"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "aigg-darwin-amd64" => "aigg"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "aigg-linux-arm64" => "aigg"
    elsif OS.linux?
      bin.install "aigg-linux-amd64" => "aigg"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aigg version")
  end
end
