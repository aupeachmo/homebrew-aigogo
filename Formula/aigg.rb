class Aigg < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.8"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.8/aigg-darwin-amd64.tar.gz"
      sha256 "53a47996f229c787580b9ac76eb84df39eee0de3032b1d112bf26161b0b71efe"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.8/aigg-darwin-arm64.tar.gz"
      sha256 "df3b28bc9c5eea32d1121fbdb61cb4f0d6d0361cc1d362638a7e9033508879b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.8/aigg-linux-amd64.tar.gz"
      sha256 "cbcc6c779105bf9953e9b11e3ddcebe0b240b52d6b9fd035a4db0559f633dbbe"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.8/aigg-linux-arm64.tar.gz"
      sha256 "03d86e777848ae26fdfcc29a2774c9fdc15887739adc07ad9034a47b20c4216c"
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
