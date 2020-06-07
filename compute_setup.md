after ssh, install `wget`, `tmux`, `fish` shell  
to make fish default run: 

```bash
chsh -s `which fish` # current user
sudo chsh -s `which fish` username # or other users
```

starting `tmux` will create new session  
here is some [guide](https://linuxize.com/post/getting-started-with-tmux/)
and [cheat sheet](https://gist.github.com/andreyvit/2921703)   
put to your `.tmux.conf`:

```
# remap prefix to Control + a
set -g prefix C-a
# bind 'C-a C-a' to type 'C-a'
bind C-a send-prefix
unbind C-b
```

then whatever `tmux kill-server` to kill tmux.  
after opening again binding should work  

to list current sessions: `tmux ls`  
`Ctrl+a d` to detach (inside tmux)  
`tmux attach-session -t 0` to attach to session `0`
