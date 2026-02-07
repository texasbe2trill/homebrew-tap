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

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/47/7e/9fa702ef5db4f9f53e43d61bdbf91550dbfe132b21b4ba20985c2e311141/annotated_types-0.7.0-py3-none-any.whl"
    sha256 "1f02e8b43a8fbbc3f3e0d4f0f4bfc8131bcb4eebe8849b8e5c773f3a1c582a53"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/6e/5d/7caed41a8b86a27c5f41e36a63ef5f01cf5c5fcd9a8d6d1f7b43e15b5c60/click-8.3.1-py3-none-any.whl"
    sha256 "981153a64e25f12d547d3426c367a4857371575ee7ad18df2a6183ab0545b2a6"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/f3/15/ff293b1f2ef7492241741de7a6f0f526c25c22ad5405b1e3a6fa7d4ff861/markdown_it_py-4.0.0-py3-none-any.whl"
    sha256 "87327c59b172c5011896038353a81343b6754500a08cd7a4973bb48c6d578147"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/3f/94/19c85578d1a1e72a500711f3c0b541306a2a3e08bd2616e09550f80b7a55/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/83/a3/8a60937632851cd741cc33c7f72a5bfb795877003dfdea5135da8be0fdb9/pydantic-2.12.5-py3-none-any.whl"
    sha256 "e561593fccf61e8a20fc46dfc2dfe075b8be7d0188df33f221ad1f0139180f9d"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/27/6b/328a1c1e88959b4bc1528c740a3aeb6cc77926d44c222dd1d06bf8acf286/pydantic_core-2.41.5-cp311-cp311-macosx_11_0_arm64.whl"
    sha256 "1d1d9764366c73f996edd17abb6d9d7649a7eb690006ab6adbda117717099b14"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c1/4b/3d5ef678a253f9b03cdb67e5516088f0d821548b7057be5c66730f0d2a4c/pygments-2.19.2-py3-none-any.whl"
    sha256 "86540386c03d588bb81d44bc3928634ff26449851e99741617ecb9037ee5ec0b"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/07/39/65bad3601f8a92a25b4c51e4c4631b7cf36afb72b25e31aa30b4ab42502b/rich-14.3.2-py3-none-any.whl"
    sha256 "08e67c3e90884651da3239ea668222d19bea7b589149d8014a21c633420dbb69"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/5f/e2/e1841049734b7b6ef7cd5b871bd375fc9b4e1eb2a479f81ec56f64e9ae0c/shellingham-1.5.4-py2.py3-none-any.whl"
    sha256 "7ecfff8f2fd72616f7481040475a65b2bf8af90a56c89140852d1120324e8686"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/2a/e7/353ae947c7c35385f6d6c1da43ff4c8ba3ebbefefec36fb02d2fab34d8fd/typer-0.21.1-py3-none-any.whl"
    sha256 "7985e89081c636b88d172c2ee0cfe33c253160994d47bdfdc302defd7d1f1d01"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/0c/43/9f9ad17f4430f2bc7a5aa46269bbd3e868a0f7e5857c9291c8c1db12607a/typing_extensions-4.15.0-py3-none-any.whl"
    sha256 "f0fa19c6845758ab08074a0cfa8b7aecb71c999ca73d62883bc25cc018c4e548"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/f1/f7/0a1637217b997bd37401767f416440749c361a728bb8b6f1f8e0ee6b93e0/typing_inspection-0.4.2-py3-none-any.whl"
    sha256 "4ed1cacbdc298c220f1bd249ed5287caa16f34d44ef4e9c3d0cbad5b521545e7"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/macos-trust --version")
  end
end