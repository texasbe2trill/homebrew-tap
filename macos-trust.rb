class MacosTrust < Formula
  include Language::Python::Virtualenv

  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "3b82f5cf08cbf6a26d6819b3784d1d9e1ae198ac004ca2e66a199ca4ac33a757"
  license "MIT"
  head "https://github.com/texasbe2trill/macos-trust.git", branch: "main"

  depends_on "python@3.11"
  depends_on macos: :catalina

  def install
    virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/macos-trust"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/macos-trust --version")
  end
end
