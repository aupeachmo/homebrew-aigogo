class Aigg < Formula
  desc "Make packaging and distributing your AI agents a breeze"
  homepage "https://github.com/aupeachmo/aigogo"
  version "0.0.5"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.5/aigg-darwin-amd64.tar.gz"
      sha256 "e3c907bddfc323c8a52d36c143bda8848d1ced369e57426f6e306121e0c6acc0"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.5/aigg-darwin-arm64.tar.gz"
      sha256 "7931bf03de14ac0470d77825d0b137ff8c5affaa988685cf7512301df59adbfc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.5/aigg-linux-amd64.tar.gz"
      sha256 "95221288a4db109b8299d30699a4d93602e231ff79029fd78bd3cb97d0d12393"
    end
    on_arm do
      url "https://github.com/aupeachmo/aigogo/releases/download/v0.0.5/aigg-linux-arm64.tar.gz"
      sha256 "b17386fa012d06762192d2a11494638488a14b94187443659627d20a6320fa60"
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
