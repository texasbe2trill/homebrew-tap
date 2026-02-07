class MacosTrust < Formula
  include Language::Python::Virtualenv

  desc "Intelligent macOS security scanner with interactive HTML reports"
  homepage "https://github.com/texasbe2trill/macos-trust"
  url "https://github.com/texasbe2trill/macos-trust/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "a8b06a15e416dc8699eb9ad92728dac0c65b6a5641cb4280e9ed2ff0db0be94c"
  license "MIT"
  head "https://github.com/texasbe2trill/macos-trust.git", branch: "main"

  depends_on "python@3.11"
  depends_on "rust" => :build
  depends_on macos: :catalina

  def install
    python = Formula["python@3.11"].opt_bin/"python3.11"

    # Create venv with pip available, then install package + CLI entrypoint
    system python, "-m", "venv", "--system-site-packages", libexec
    system libexec/"bin/python", "-m", "ensurepip", "--upgrade"
    # Build from source to avoid binary wheel relinking issues (pydantic-core)
    system libexec/"bin/pip", "install", "--no-binary", ":all:", buildpath
    bin.install_symlink libexec/"bin/macos-trust"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/macos-trust --version")
  end
end