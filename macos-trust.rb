class MacosTrust < Formula
  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "eef0f31ce9b5f1118b104e21e8dcb2cc8b2a62e971e9dc8f62d0721a5f965385"
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