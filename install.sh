# A Simple script for Compiling & Installing & Configuring Fluxbox for lainOS (LainWM) 2024

DEBUG=1

function InstallWM {
	if (( $DEBUG == 0 )); then
		make -s # compile the fluxbox window manager
		sudo make -s install # Install the window manager
	else
		make
		sudo make install
	fi
	echo "[INFO] LainWM window manager compiled and installed"
}

function InstallTint {
	# Install the tint2 status bar
	sudo pacman -S tint2;
	cp Dots/tint2rc ~/.config/tint2/ # move the lainOS config for tint2
	echo "[INFO] Tint2 and its configuration installed."
}

function InstallRofi {
	sudo pacman -S rofi
	sudo cp Dots/config.rasi ~/.config/rofi/
}

function InstallWALM {
	sudo pacman -S nitrogen
	echo "[INFO] Wallpaper Manager installed."
}

function InstallLainWM {
	InstallWM; # Install the Window Manager
	InstallLocalConfig # Install the window manager configs
	InstallTint # Install the Status bar
	# Install the Fonts
	InstallWALM # Install the Wallpaper manager
	# Install Runner Program
	# Install neofetch configs
	# Install Welcome Program
	# Install PDL
	# Install Composer
	# Install Extra Tools
	# Install the LainOS Tools
}


function InstallLocalConfig {
	#cd .. && sudo make install
	rm -r ~/.fluxbox
	cp -r /usr/local/share/fluxbox ~/.fluxbox
	echo "[INFO] installed the configs"
}


if [[ $1 == "config" ]]; then
	InstallLocalConfig; # installs the compiled config to the local dir of user
else
	InstallLainWM; # Install the actual WM
fi

