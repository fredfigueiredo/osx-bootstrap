# OS X Bootstrap

> Script to set up a Mac OS X workstation for web development. It installs Homebrew, YADR, Chrome, Dropbox, Firefox, Sublime Text 2, Node.js, Grunt, and much more.

## Requirements

* OS X (10.8 or 10.9) - clean install

## Usage

Open a terminal, copy & paste, and run:

```sh
bash <(curl -s https://raw.githubusercontent.com/fredfigueiredo/osx-bootstrap/master/bootstrap.sh)
```

Follow the instructions, sit back, relax, and enjoy the ride.

## What is installed?

* Homebrew
* Xcode Command Line Tools
* Applications (e.g. Chrome, Dropbox, Sublime Text 2)
  * Check out full list in file: `parts/cask-apps.sh`
* Git source code management system
* YADR (dotfiles & zsh) + customizations
* Node.js, npm, Yeoman, Bower, Grunt, Compass

## Missing

* Custom configurations part
* Upgrade & Uninstall

## Testing

If you want to test this script, before setting up your own machine, you can do so by creating a VM with Maverick or Yosemite and run it inside.

Check how to create a
  [Yosemite VM with Virtual Box](http://sqar.blogspot.de/2014/10/installing-yosemite-in-virtualbox.html).

## References

For too long I wanted to have a quick way to setup my own machine. Although there are several alternatives to do so, I choose to.

Regardless, similar and projects that inspired me:

* 1
* 2
* 3

## Contributing

Feel free to contribute to this project with your own ideas and needs.
