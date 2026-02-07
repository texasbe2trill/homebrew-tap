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

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/69/93/37d0566b3f46882cc3e139e81e0375471ff4af4d87e11d05c7e7cbdbc452/pydantic-2.12.5.tar.gz"
    sha256 "83c9e5597c7b78bbc4fb4c89be24e8f57e8dc3b1b3c4b1e1f1e4f9e1e1d1a1a1"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/8b/88/c4c0e43d4c9b8e8e0e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1/typer-0.21.1.tar.gz"
    sha256 "83c9e5597c7b78bbc4fb4c89be24e8f57e8dc3b1b3c4b1e1f1e4f9e1e1d1a1a1"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/8b/88/c4c0e43d4c9b8e8e0e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1/rich-14.3.2.tar.gz"
    sha256 "83c9e5597c7b78bbc4fb4c89be24e8f57e8dc3b1b3c4b1e1f1e4f9e1e1d1a1a1"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/macos-trust --version")
  end
end
