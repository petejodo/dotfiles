# dotfiles

## Packages

Packages that I want on every system:

- asdf                 - via `git clone`
- bat (batcat)         - via `apt`
- delta (git-delta)    - via `cargo install`
- exa                  - via `apt`
- fd (fd-find)         - via `apt`
- fzf                  - via `apt`
- helix                - via `linuxbrew` (figure out a way to install some other way)
- htop                 - via `apt`
- pgcli                - via `apt`
- ripgrep              - via `apt`

## DConf Settings

**Note** I think this will only work on Gnome-based DEs 

Implemented a fish function for dumping list of chosen dconf settings.
The list is embedded in the function, named `dump-dconf-settings`. Still
need to implement the load version of it, which should convert the file
name from `-` to `/` to get the settings path and save it to that.

**Reminder** fish functions are located in `~/.config/fish/functions`

## Gnome Extensions

- GSConnect

## Applications

- Mozilla VPN

## Charm Repo

**Note** The following only works on debian-based repos

To add repo for [charm packages](https://github.com/charmbracelet),
execute the following:

```sh
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
```