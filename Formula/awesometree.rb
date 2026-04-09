class Awesometree < Formula
  desc "Workspace manager: window management + Zed + git worktrees"
  homepage "https://github.com/aleksclark/awesometree"
  version "2026.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aleksclark/awesometree/releases/download/v2026.4.8/awesometree-2026.4.8-macos-arm64.tar.gz"
      sha256 "34fc3223825bf16424a5851dcb4ce78cebee03ca669a3a1df121b65adfb88274"
    else
      url "https://github.com/aleksclark/awesometree/releases/download/v2026.4.8/awesometree-2026.4.8-macos-x86_64.tar.gz"
      sha256 "b1a3b6df27dce4f11e267845aaf5fe423c548f7fb207441035d6fe0ac4b786a2"
    end
  end

  on_linux do
    url "https://github.com/aleksclark/awesometree/releases/download/v2026.4.8/awesometree-2026.4.8-linux-x86_64.tar.gz"
    sha256 "9787d86de24e0225803827cdee2694ed75cddd3c84e7e661c598c1da91e1eb7d"
  end

  def install
    bin.install "awesometree"
    bin.install "awesometree-daemon"

    if OS.mac?
      (prefix/"com.awesometree.daemon.plist").install "com.awesometree.daemon.plist"
    else
      (prefix/"awesometree-daemon.service").install "awesometree-daemon.service"
    end
  end

  def caveats
    if OS.mac?
      <<~EOS
        To start the daemon as a launchd service:
cp #{prefix}/com.awesometree.daemon.plist ~/Library/LaunchAgents/
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.awesometree.daemon.plist
      EOS
    else
      <<~EOS
        To start the daemon as a systemd service:
cp #{prefix}/awesometree-daemon.service ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now awesometree-daemon
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awesometree --version", 2)
  end
end
