class MacosTrust < Formula
  include Language::Python::Virtualenv

  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "a8b06a15e416dc8699eb9ad92728dac0c65b6a5641cb4280e9ed2ff0db0be94c"
  license "MIT"
  head "https://github.com/texasbe2trill/macos-trust.git", branch: "main"

  depends_on "python@3.11"
  depends_on macos: :catalina

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/macos-trust --version")
  end
end