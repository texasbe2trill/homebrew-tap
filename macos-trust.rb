class MacosTrust < Formula
  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "16f1b2dd1c0cda106855fd3580aacde5c9c4e5fa36fd853dbe1a2c923b6adaff"
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