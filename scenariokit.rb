class Scenariokit < Formula
  desc "Visual security storyboards from macOS unified logs for incident response"
  homepage "https://github.com/texasbe2trill/ScenarioKit"
  url "https://github.com/texasbe2trill/ScenarioKit/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4e16e9973ded086a731838e766dec7e59980f20dcac2d0e5a9212c2176768dcd"
  license "MIT"
  head "https://github.com/texasbe2trill/ScenarioKit.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    
    # Install resource bundle and binary to libexec
    # The bundle must be in the same directory as the binary
    libexec.install ".build/release/scenariokit"
    libexec.install ".build/release/ScenarioKit_ScenarioKit.bundle"
    
    # Create wrapper script in bin that calls the libexec binary
    (bin/"scenariokit").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/scenariokit" "$@"
    EOS
    (bin/"scenariokit").chmod 0755
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/scenariokit --version")
  end
end
