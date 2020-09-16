# This file was generated by GoReleaser. DO NOT EDIT.
class TtiLwStack < Formula
  desc "The Things Stack for LoRaWAN"
  homepage "https://www.thethingsindustries.com"
  version "3.9.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.9.3/lorawan-stack_3.9.3_darwin_amd64.tar.gz"
    sha256 "576aabead072a92c7c94a432407634956ec783157924ccf327f1339ec0c39f9d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.9.3/lorawan-stack_3.9.3_linux_amd64.tar.gz"
      sha256 "952d0c51e89c68e61f834894b79e0ec23f7108dccba0f8646f1411380be54077"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.9.3/lorawan-stack_3.9.3_linux_arm64.tar.gz"
        sha256 "a397ddb5d3aee6f971952a8b01b0380f212cf6165c6aff46a844701b3a6e2b77"
      else
        url "https://github.com/TheThingsIndustries/lorawan-stack/releases/download/v3.9.3/lorawan-stack_3.9.3_linux_armv6.tar.gz"
        sha256 "f4a33a9480c4ed9b8c31fdc235aa11446042e7aa63d47253c89956baac565cf4"
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
