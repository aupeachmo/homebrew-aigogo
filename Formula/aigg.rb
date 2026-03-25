class Aigg < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.9"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.9/aigg-darwin-amd64.tar.gz"
      sha256 "90f787a0b0759b3c7bf3651c653db64097c1d9bd7ed332ffeb1803cf6f69095c"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.9/aigg-darwin-arm64.tar.gz"
      sha256 "2650f59b19cd75018fdc97e021bb690f8a6dfdc930b28e95509fb6a6eb806df4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.9/aigg-linux-amd64.tar.gz"
      sha256 "66e54f23258e4557cb500787bfff0485e957ccabcfe309cc262ef44f2197b29c"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.9/aigg-linux-arm64.tar.gz"
      sha256 "ec28ad205cb3e05d7fa85f0daba98a8ed5854f127f1d62845b49a719aeb732a9"
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
