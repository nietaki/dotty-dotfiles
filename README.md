# nietaki's dotfiles

Now simpler and more working than ever. Powered by dotty, see
 https://github.com/vibhavp/dotty for details.


## Usage

```bash
git clone --recursive git@github.com:nietaki/dotty-dotfiles.git
cd dotty-dotfiles
python3 dotty/dotty.py config.json
```


## Bootstrapping a fresh OSX install

(after you've run dotty)
```bash
cd ~/.bootstrap
./install_all.sh
```


## Atom editor config

For maintaining consistent Atom config we're using https://atom.io/packages/sync-settings

The git to use in its config is https://gist.github.com/nietaki/c93fc1b2f38645521764ea1dc48ccb1b
, which means the id is c93fc1b2f38645521764ea1dc48ccb1b 
