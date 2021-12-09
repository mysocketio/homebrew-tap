class Mysocketctl < Formula
  desc "Mysocket.io command line interface"
  homepage "https://github.com/mysocketio/mysocketctl-go.git"
  version "v1.0-85-gcf8f537"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://download.edge.mysocket.io/darwin_amd64/mysocketctl"
      sha256 "5d2c65ea2bef99637ab5d76521a9f7b1a5aa01ceca17e1506f37bb77e52312c6"
    elsif Hardware::CPU.arm?
      url "https://download.edge.mysocket.io/darwin_arm64/mysocketctl"
      sha256 "d6c45ba7ebc3de27bc9d554992a77062a78761caf042ac53d69e244496e2023a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://download.edge.mysocket.io/linux_amd64/mysocketctl"
      sha256 "7d1aca6fa8fe0b4cb94b33c0756e5a6f697df2f13637c2b44ae0e3770f2f6a78"
    end
  end

  def install
    bin.install "mysocketctl"
  end

  test do
    assert_match /You're running version v1.0-83-g6ee2e48/, shell_output("#{bin}/mysocketctl version check", 0)
  end
end
