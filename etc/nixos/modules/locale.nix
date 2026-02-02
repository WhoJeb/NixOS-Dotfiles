{ systemSettings, ... }:
{
  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  #i18n.defaultLocale = systemSettings.locale;
  # i18n.defaultLocale = "pt_BR.UTF-8";
  # i18n.defaultLocale = "ja_JP.UTF-8";
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "pt_BR.UTF-8";
  #   LC_IDENTIFICATION = "pt_BR.UTF-8";
  #   LC_MEASUREMENT = "pt_BR.UTF-8";
  #   LC_MONETARY = "pt_BR.UTF-8";
  #   LC_NAME = "pt_BR.UTF-8";
  #   LC_NUMERIC = "pt_BR.UTF-8";
  #   LC_PAPER = "pt_BR.UTF-8";
  #   LC_TELEPHONE = "pt_BR.UTF-8";
  #   LC_TIME = "pt_BR.UTF-8";
  # };

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "ja_JP.UTF-8";
  #   LC_IDENTIFICATION = "ja_JP.UTF-8";
  #   LC_MEASUREMENT = "ja_JP.UTF-8";
  #   LC_MONETARY = "ja_JP.UTF-8";
  #   LC_NAME = "ja_JP.UTF-8";
  #   LC_NUMERIC = "ja_JP.UTF-8";
  #   LC_PAPER = "ja_JP.UTF-8";
  #   LC_TELEPHONE = "ja_JP.UTF-8";
  #   LC_TIME = "ja_JP.UTF-8";
  # };
}
