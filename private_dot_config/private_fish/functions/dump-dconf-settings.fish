function dump-dconf-settings
    set dconf_config_path $HOME/.config/dconf

    set dconf_paths    "org/gnome/desktop/wm/keybindings"
    set -a dconf_paths "org/gnome/desktop/peripherals/touchpad"
    set -a dconf_paths "org/gnome/desktop/interface"

    command mkdir -p $dconf_config_path

    for path in $dconf_paths
        set setting_path "/$path/"
        echo "dumping: $setting_path"
    
        set file_name (string replace -a "/" "-" $path)
        set file_path "$dconf_config_path/$file_name.conf"

        command dconf dump $setting_path > $file_path

        if test $status = 0
            echo "created $file_path"
        else
            echo "failed to dump $setting_path"
        end
    end
end