# YADM - Yet Another Dotfiles Manager
The configuration for my linux environment

## On a new PC

### Prepare for storing the personal git info outside the repo
````mkdir ~/.config/tve
cp .gitconfig ~/.config/tve/.git_user_info
````

### Move existing dotfiles before cloning
Or read this to see how yadm stashes pre-existing files  
https://yadm.io/docs/faq#i-just-cloned-my-repository-and-conflicting-data-was-overwritten-why

### Clone the repo to the homedir
````
cd
yadm clone git@github.com:tveyben/dotfiles.git
````
