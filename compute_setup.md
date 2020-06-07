## debian

after ssh, install `wget`, `tmux`, `git` and `fish` shell
```bash
sudo apt-get update
sudo apt-get upgrade

sudo apt install wget
sudo apt install tmux
sudo apt install git
# see fish website for installation
```
  
make fish default shell: 

```bash
chsh -s `which fish` # current user
sudo chsh -s `which fish` username # or other users
```

starting `tmux` will create new session  
here is some [guide](https://linuxize.com/post/getting-started-with-tmux/)
and [cheat sheet](https://gist.github.com/andreyvit/2921703)   
put to your `.tmux.conf` (usually`~/.tmux.conf`):

```
# remap prefix to Control + a
set -g prefix C-a
# bind 'C-a C-a' to type 'C-a'
bind C-a send-prefix
unbind C-b
```

vim keybindings
```
setw -g mode-keys vi
```

then whatever `tmux kill-server` to kill tmux.  
after opening again binding should work  

to list current sessions: `tmux ls`  
`Ctrl+a d` to detach (inside tmux)  
`tmux attach-session -t 0` to attach to session `0`  

## Go
```bash
sudo apt-get update
sudo apt-get -y upgrade

# copy link from golang.org/dl
wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz

tar -xvf go1.14.4.linux-amd64.tar.gz
sudo mv go /usr/local # or some other dir

# also add to `~/.profile` file
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# verify 
go version
go env
```

in `.profile`
``` bash
# export golang bins
export PATH=$PATH:/usr/local/go/bin
```

from bash
``` bash
bash
source ~/.profile
```

restart `tmux` if needed  
inside `~/go`, or just from `~/` (go.mod)
```bash
git clone https://github.com/orsenkucher/nothing.git
go run main.go
```

---

[nothing](https://github.com/orsenkucher/nothing.git)  
[rather](https://github.com/orsenkucher/nothing.git) on `origin/rather`
```bash
cp -r nothing rather
git checkout rather
```  
[459bot](https://github.com/orsenkucher/schedulebot.git)  
[rave-era](https://github.com/orsenkucher/rave-era.git)  
[pp-drop](https://github.com/orsenkucher/parsing-platform.git)  
[radiance](https://github.com/orsenkucher/Radiance.git) `?`

