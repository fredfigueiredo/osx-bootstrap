# OS X Bootstrap

> Set up Mac OS X workstation via one single script. You decide what to install.

## Requirements

* OS X (10.8 or 10.9) - clean installation, preferably

## Usage

Open a terminal, copy & paste, and run:

```sh
bash <(curl -s https://raw.githubusercontent.com/fredfigueiredo/osx-bootstrap/master/bootstrap.sh)
```

Follow the instructions, sit back, relax, and enjoy the ride.

## What it installs?

* Homebrew (required)
* Command-line tools
* Applications (e.g. Chrome, Dropbox, etc)
  * Check or edit file: `parts/cask-apps.sh`
* Git source code management system
* Oh-My-zsh
...

## Missing

* Request for root pass at start
* Create ssh key in git part
* node js + grunt part
* dotfiles part
* Sublime 2 config part
* ZSH custom configurations part
* Custom configurations part
* Instructions on how to test
* Upgrade & Uninstall
* References & Credits

## Testing

(tbd)

## References

(tbd)

## Credits

(tbd)