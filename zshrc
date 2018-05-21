# steven's zshrc file
# contains aliases, memes, jokes, poorly-made hacks

# turn off dpms
xset s off -dpms

export ZSH=/home/steve/.oh-my-zsh

export MUSICDIR=/home/steve/Music

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Add plugins here
plugins=(
  git
)

# Source the local ZSH programs
source $ZSH/oh-my-zsh.sh


# add any directories with binaries for development purposes
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin
export PATH=$PATH:$HOME/.cargo/bin
export GOPATH=$HOME/go

export GCLOUD=$HOME/.gcloud
source $GCLOUD/completion.zsh.inc
source $GCLOUD/path.zsh.inc

# my personal gcloud dev appserver alias
alias dev_appserver="python2 $GCLOUD/bin/dev_appserver.py"

# Factorio related stuff
export FACTORIOPATH=$HOME/.factorio
export FACTORIOMODS=$FACTORIOPATH/mods

# try to set primary displays
xrandr --output HDMI-A-1 --primary # desktop
xrandr --output eDP1 --primary     # thinkpad display


# actual bash functions go here

# Wine function to launch win32 binaries using a wine32 arch prefix
wine32(){
    WINEARCH=win32 WINEPREFIX=$HOME/.wine32 $@
}

# display temperatures in an infinite loop
temps(){
    while :;
    do
	clear
	sensors
	sleep 30
    done
}

# Convert any audio file to mp3 with ffmpeg
convert_mp3(){
    ffmpeg -i "$*" -b:a 320k -vn "$*.mp3"
}

# add a magnet uri string to the transmission tracker
tadd(){
    transmission-remote -a "$!"
}

# clear all entries from transmission
tclear(){
    transmission-remote -t all -r
}


# Download a youtube URL and convert it to mp3
ytdl(){
    last=$(pwd)
    if [ ! -d $HOME/.ytdl ]; then
	echo "Creating YTDL dir"
	mkdir -p $HOME/.ytdl
    fi

    echo "Entering YTDL dir"
    cd $HOME/.ytdl

    echo "Beginning YTDL"
    youtube-dl $1

    for f in *; do
	echo "Converting $f"
	convert_mp3 "$f"
	rm -rf "$f"
    done

    for m in *.mp3; do
	echo "Copying $m"
	cp "$m" $MUSICDIR
	rm -rf "$m"
    done

    cd $last
}

# display all active torrents in transmission
torrent_display(){
    count=`ps aux | grep transmission-daemon | wc -l`
    if [ $count -lt 2 ]; then
	echo "Starting Transmission"
	transmission-daemon &
	sleep 30;
    fi

    while :;
    do
	clear
	transmission-remote -l
	sleep 30
    done
}



# end
