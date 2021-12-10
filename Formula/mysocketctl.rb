class Mysocketctl < Formula
  desc "Mysocket.io command-line interface"
  homepage "https://github.com/mysocketio/mysocketctl-go"
  version "1.0"

  require "uri"
  require "net/http"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://download.edge.mysocket.io/darwin_amd64/mysocketctl"
      sha_url = URI("https://download.edge.mysocket.io/darwin_amd64/sha256-checksum.txt")
      res = Net::HTTP.get_response(sha_url)
      sha256 res.body.lines.first.chomp
    elsif Hardware::CPU.arm?
      url "https://download.edge.mysocket.io/darwin_arm64/mysocketctl"
      sha_url = URI("https://download.edge.mysocket.io/darwin_arm64/sha256-checksum.txt")
      res = Net::HTTP.get_response(sha_url)
      sha256 res.body.lines.first.chomp
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://download.edge.mysocket.io/linux_amd64/mysocketctl"
      sha_url = URI("https://download.edge.mysocket.io/linux_amd64/sha256-checksum.txt")
      res = Net::HTTP.get_response(sha_url)
      sha256 res.body.lines.first.chomp
    end
  end

  def install
    bin.install "mysocketctl"
    chmod 0555, "#{bin}/mysocketctl"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/mysocketctl", "completion", "bash")
    (bash_completion/"mysocketctl").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/mysocketctl", "completion", "zsh")
    (zsh_completion/"_mysocketctl").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/mysocketctl", "completion", "fish")
    (fish_completion/"mysocketctl.fish").write output
  end

  test do
    assert_match "You're running version v#{version}", shell_output("#{bin}/mysocketctl version check")
  end
end
