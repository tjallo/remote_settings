# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function help() {
    echo "srcz, source .zshrc"
    echo "rl, ride login at default address"
    echo "Zedit, edit .zshrc"
    echo "home, go to home directory"
    echo "p3, python3 alias"
    echo "cn, open new code window in cwd"
    echo "setupFolders, setup Github folders for copy"
    echo "copyZSHRC, copy ZSHRC to backup folder"
    echo "genPush, generic push the current folder"
    echo "pushSettings, copy and backup settings then push them to the github repo"
    echo "getFFMPEGScript, get, execute and remove ffmpeg merge script"
    echo "getUpdate, get latest remote script from github"
    echo "goWorkspace, go to /home/tjalle/workspaces/Workspace\ VB"
    echo "gowcn, go to work space and open in editor"
    echo "stackSettingsPush,push settings to local stack folder"
    echo "setupStack, setup local stack"
    echo "setupAll, setup stack and local folders"
    echo "getLastFM, get weekly last fm stats"
    echo "setUser, set lastfm user"
    echo "addAddToBoot, add auto-updater to boot"
    echo "schown, sudo chown current directory"
    echo "raspi"
    echo "torrentbak"
}

function srcz() {
    echo "Sourced ZSHRC"
    source ~/.zshrc
}

function home() {
    echo "You are now in the home directory"
    cd ~
}

function Zedit(){
    echo "Opening .zshrc in code..."
    code -n ~/.zshrc
}

function setupFolders() {
    echo "setting up folders..."
    sudo mkdir ~/github
    cd ~/github
    git clone https://github.com/tjallo/remote_settings
}

function cn() {
    echo "opening new code window in cwd..."
    code -n .
}

function copyZSHRC(){
    echo "backing up .zshrc..."
    sudo cp ~/.zshrc ~/github/remote_settings/zsh/
}

function genPush() {
    echo "started pushing local folder"
    sudo git add .
    sudo git commit -m "Automated Push"
    sudo git push
}



function pushSettings(){
    srcz
    #copy current zsh config
    echo "Copy ZSHRC"
    copyZSHRC

    #copy current vscode extension list
   

    #push to github
    echo "Pushing to GitHub"
    cd ~/github/remote_settings 
    genPush
}

function p3() {
    python3 $1
}

function getFFMPEGScript() {
    wget -O mergeScript.command https://raw.githubusercontent.com/tjallo/ffmpeg-mp4-aif-merger/master/ffmpeg-mp4-aif-merger
    sudo chmod +x mergeScript.command
    ./mergeScript.command
    rm mergeScript.command
}

function getUpdate() {
    echo "Updating!"
    cd ~
    sudo rm -rf .zshrc
    sudo wget -O .zshrc https://raw.githubusercontent.com/tjallo/remote_settings/master/zsh/.zshrc
    srcz
    echo "Got most recent script."
    echo "Note, after a push, GitHub needs some time to update, so getRecent is not always the latest pushed version, but the most recent GitHub version"
    cd ~/github
    sudo rm -rf remote_settings
    sudo git clone https://github.com/tjallo/remote_settings
}

function goWorkspace() {    
    cd /home/tjalle/workspaces/Workspace\ VB
    echo "You are now in ~/workspaces/Workpace VB"
}

function sm() {
    sudo make
}

function gowcn() {
    goWorkspace
    cn
}

function libzmq5(){
    sudo apt install -y --allow-downgrades /home/tjalle/libzmq5_4.1.4-7_amd64.deb 
}

function setupStack() {
    sudo apt-get install davfs2
    sudo mkdir ~/stack
    sudo mount.davfs https://tjallo.stackstorage.com/remote.php/webdav/ ~/stack -o rw,uid=tjallo
}

function stackSettingsPush() {
    getUpdate
    setupStack
    sudo chmod +x ~/github/remote_settings/scripts/gitClone
    sudo rm -rf ~/0
    sudo rm -rf ~/stack/000\ GitHub/
    sudo mkdir ~/stack/000\ GitHub/
    cd ~/stack/000\ GitHub/
    sudo ~/github/remote_settings/scripts/gitClone
}

function setupAll() {
    setupFolders
    setupStack
}

function lua() {
    lua5.3 $1
}

function getLastFM() {
    echo "Make sure Stack is setup"
    home
    sudo mkdir .temp
    cd .temp
    sudo cp ~/stack/000\ zsh\ scripts/getLastFM.py .
    sudo cp ~/stack/000\ zsh\ scripts/keys.py .
    python3 getLastFM.py
    cd ..
    sudo rm -rf .temp
    echo ""
    echo ""
    echo "If error, make sure setack is setup properly (run \"setupStack\")"
}

function raspi() {
    ssh ubuntu@tjallo.nl -p 6970
}

function torrentbak() {
    ssh tjalle@192.168.0.169 -p 6969
}

function schown() {
    echo "If this takes to long, you have are in a root directory"
    sudo chown -R $USER:$USER .
    pwd
    echo "Is now yours again"
}

function rl() {
    ride login 192.168.0.1
}

function setUser() {
    sudo nano ~/stack/000\ zsh\ scripts/getLastFM.py
    echo "Make sure stack is setup properly (setupStack)"
}

function csgoItems() {
    cd ~
    sudo mkdir .tempzsh
    cd ~/.tempzsh
    sudo git clone https://github.com/tjallo/CSGO-Tracker
    cd ~
    sudo chmod -R 777 .tempzsh
    cd ~/.tempzsh/CSGO-Tracker
    sudo pip3 install -r requirements
    python3 main.py
    cd ~
    sudo rm -rf .tempzsh
}
