class MacosTrust < Formula
  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "df986c244b239c3e59325535fb8b2c497b9accd2087ea1674c431745582ac4a8"
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
    assert_match "0.4.2", shell_output("#{bin}/macos-trust --version")
  end
end