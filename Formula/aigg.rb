class Aigg < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.4"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.4/aigg-darwin-amd64.tar.gz"
      sha256 "d3e46406775cebed9145da2d66cbf65f991ea1db1167faefbb15c85679a950f0"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.4/aigg-darwin-arm64.tar.gz"
      sha256 "84636374c97a0ab36319a08a36c3461278f644a62e534aa00bdbf7781973be69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.4/aigg-linux-amd64.tar.gz"
      sha256 "e6a8121ec77f19ec832b179434d083d29561df241760526b302f08faafcb45c6"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.4/aigg-linux-arm64.tar.gz"
      sha256 "94f9b0d31865fab19fde1a896e290becbcf1fdd93a1f323e701da9854dc7584e"
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
