class Aigg < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.7"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.7/aigg-darwin-amd64.tar.gz"
      sha256 "62da7336f8b626aea2ec06e9b0e80a4714e4431a9af565c72fecdee2e3f97881"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.7/aigg-darwin-arm64.tar.gz"
      sha256 "77f42cf871047c6afb6214b2faecef23ac6d6705197e6bc93360d5da32436823"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.7/aigg-linux-amd64.tar.gz"
      sha256 "8e6e4587ab396b21a4c1d12050456269986ab50769f0f30108f399e98669e48f"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.7/aigg-linux-arm64.tar.gz"
      sha256 "fd04dd88bd6504c73444dfe527d0ffed8351288b5a302c1a311b056d24077589"
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
