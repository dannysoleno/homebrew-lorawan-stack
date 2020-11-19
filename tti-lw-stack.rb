# This file was generated by GoReleaser. DO NOT EDIT.
class TtiLwStack < Formula
  desc "The Things Stack for LoRaWAN"
  homepage "https://www.thethingsindustries.com"
  version "3.10.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.1/lorawan-stack_3.10.1_darwin_amd64.tar.gz"
    sha256 "3ee208ec72ad5d582cd38319ff8526adb456d589146ba12f4e1d5898877aff81"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.1/lorawan-stack_3.10.1_linux_amd64.tar.gz"
      sha256 "c5025ae69a22c0c489c254bdc2eb668d5d3f89f1e37a55bedb72d4013666623b"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.1/lorawan-stack_3.10.1_linux_arm64.tar.gz"
        sha256 "33951106e9dd415a112cbfb5a8b654b2a3b977926e7b9599e96b94bf57ad3d96"
      else
        url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.1/lorawan-stack_3.10.1_linux_armv6.tar.gz"
        sha256 "250c239f538e2dd50554472c77c68ffd883743c6a007f1e8c8a993f439f90768"
      end
    end
  end
  
  conflicts_with "tti-lw-cli"

  def install
    bin.install "tti-lw-cli"
    libexec.install %w[tti-lw-stack public]
    env = {
        :TTN_LW_HTTP_STATIC_SEARCH_PATH => libexec/"public"
    }
    (bin/"tti-lw-stack").write_env_script libexec/"tti-lw-stack", env
    bash_completion.install "config/completion/bash/tti-lw-cli"
    zsh_completion.install "config/completion/zsh/_tti-lw-cli"
    fish_completion.install "config/completion/fish/tti-lw-cli.fish"
    bash_completion.install "config/completion/bash/tti-lw-stack"
    zsh_completion.install "config/completion/zsh/_tti-lw-stack"
    fish_completion.install "config/completion/fish/tti-lw-stack.fish"
  end
end
