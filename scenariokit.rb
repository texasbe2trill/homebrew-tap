class Scenariokit < Formula
  desc "Visual security storyboards from macOS unified logs for incident response"
  homepage "https://github.com/texasbe2trill/ScenarioKit"
  url "https://github.com/texasbe2trill/ScenarioKit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b0178a90e4d8304017d7ecef22c2fba3d63b03b01777145042edbfba4059f6da"
  license "MIT"
  head "https://github.com/texasbe2trill/ScenarioKit.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/scenariokit"
    
    # Install Sigma rules
    (share/"scenariokit").install "Sources/ScenarioKit/Resources"
  end

  test do
    system bin/"scenariokit", "--version"
  end
end
