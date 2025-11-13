{ pkgs, ...}:

{
  environment.variables = {
    INPUT_METHOD = "fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
    # Important for Wayland:
    XDG_CURRENT_DESKTOP = "niri";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_IM_MODULE_WAYLAND = "fcitx";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        # fcitx5-chinese-addons
        fcitx5-mozc
        fcitx5-gtk
        libsForQt5.fcitx5-qt
        rime-data
        fcitx5-rime
        fcitx5-hangul
      ];
    };
  };
}
