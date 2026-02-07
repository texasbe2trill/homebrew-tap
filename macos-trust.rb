class MacosTrust < Formula
  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "24bbaf7028afa74da99a78af4e86002d1c61f4cb7ba7dc009b53caf2bd1a1165"
  license "MIT"

  depends_on "python@3.11"
  depends_on macos: :catalina

  # Skip Homebrew's dylib ID rewriting for venv site-packages
  skip_clean "libexec"

  def install
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/macos-trust"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/macos-trust --version")
  end
end