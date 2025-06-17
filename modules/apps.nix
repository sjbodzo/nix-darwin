{ inputs, pkgs, ... }: {

  environment.extraInit = ''
    export PATH=$HOME/bin:$PATH
  '';

  # install packages from nix's official package repository.
  environment.systemPackages = with pkgs; [];

  # homebrew need to be installed manually and these apps are not managed by nix
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [ "defenseunicorns/tap" ];

    # brew install
    brews = [ "openconnect" "luarocks" "lua-language-server" "sqlcmd" "cargo-nextest" "helm" "sshpass" "semgrep" "cargo-binstall" "jj" "zarf" "uds" "azure-cli" "argocd" "tilt" ];

    # brew install --cask
    # these need to be updated manually
    casks = [ "ghostty" "wezterm" "linear-linear" "notion" "zed" "xcodes" ];

    # mac app store
    masApps = {
      amphetamine = 937984704;

      # useful for debugging macos key codes
      #key-codes = 414568915;
    };
  };
}
