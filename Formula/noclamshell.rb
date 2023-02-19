class Noclamshell < Formula
  desc "Sleep despite annoying clamshell mode"
  homepage "https://github.com/pirj/noclamshell"
  url "https://github.com/pirj/noclamshell.git", tag: "1.3", revision: "df2b07dddd47a259d6306dfbb012f9f31b3df761"
  head "https://github.com/pirj/noclamshell.git", branch: "master"

  def install
    bin.install "noclamshell"
  end

  service do
    run [opt_bin/"noclamshell", "--no-daemon"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
  end

  def plist; <<~XML
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key><string>#{plist_name}</string>
        <key>ThrottleInterval</key> <integer>2</integer>
        <key>KeepAlive</key> <true/>
        <key>ProgramArguments</key>
          <array>
            <string>bash</string>
            <string>-c</string>
            <string>#{opt_bin}/noclamshell</string>
          </array>
      </dict>
    </plist>
    XML
  end

  test do
    system bin/"noclamshell"
  end
end
