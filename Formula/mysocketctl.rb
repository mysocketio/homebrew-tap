class Mysocketctl < Formula
  desc "Mysocket.io command line interface"
  homepage "https://github.com/mysocketio/mysocketctl-go.git"
  version "v1.0-83-g6ee2e48"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://download.edge.mysocket.io/darwin_amd64/mysocketctl"
      sha256 "d5cf1253c3dcb50949cf9ef51faebf1d1f165638a412d57837b646e4af0cb9ef"
    elsif Hardware::CPU.arm?
      url "https://download.edge.mysocket.io/darwin_arm64/mysocketctl"
      sha256 "ac2373a402aab9139db941e7e31d9be1387a4d4c2ea48895c327ebbddef4a6c6"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://download.edge.mysocket.io/linux_amd64/mysocketctl",
      sha256 "3597d2571fd25acce4a4543a1f08dd5c7112e3f826d01fcd775f182f10b94f4e"
    end
  end

  def install
    bin.install "mysocketctl"
  end

  test do
    assert_match /You're running version v1.0-83-g6ee2e48/, shell_output("#{bin}/mysocketctl version check", 0)
  end
end
