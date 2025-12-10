class Noclamshell < Formula
  desc "Sleep despite annoying clamshell mode"
  homepage "https://github.com/pirj/noclamshell"
  url "https://github.com/pirj/noclamshell.git", tag: "v1.4", revision: "c0985c39c1bba4315feb4ef210e718fb795072f4"
  head "https://github.com/pirj/noclamshell.git", branch: "master"

  def install
    bin.install "noclamshell"
  end

  service do
    run opt_bin/"noclamshell"
    keep_alive true
    run_type :interval
    interval 5
    throttle_interval 5
  end

  test do
    system bin/"noclamshell"
  end
end
