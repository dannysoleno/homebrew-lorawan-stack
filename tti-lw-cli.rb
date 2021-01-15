# This file was generated by GoReleaser. DO NOT EDIT.
class TtiLwCli < Formula
  desc "CLI of The Things Stack for LoRaWAN"
  homepage "https://www.thethingsindustries.com"
  version "3.10.7"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.7/lorawan-stack-cli_3.10.7_darwin_amd64.tar.gz"
    sha256 "62254e2b7f83766ef57cd99a847106d9f6b457e9eab1f6e7db2d57380bbd34e8"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.7/lorawan-stack-cli_3.10.7_linux_amd64.tar.gz"
      sha256 "b8ede404d3d838dd2178f579c43366a898e0a110c86e057850fb57a7f41ebb5d"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.7/lorawan-stack-cli_3.10.7_linux_arm64.tar.gz"
        sha256 "e1d9a5f84c41948eb6026f518f34eddd2ff8c12e40fdc436abbf0f6c274333a6"
      else
        url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.10.7/lorawan-stack-cli_3.10.7_linux_armv6.tar.gz"
        sha256 "dc9bae88b730cd0461ccb819b9bb1b13223aaeb8a92524d314b63d71be757585"
      end
    end
  end
  
  conflicts_with "tti-lw-stack"

  def install
    bin.install "tti-lw-cli"
    bash_completion.install "config/completion/bash/tti-lw-cli"
    zsh_completion.install "config/completion/zsh/_tti-lw-cli"
    fish_completion.install "config/completion/fish/tti-lw-cli.fish"
  end
end
