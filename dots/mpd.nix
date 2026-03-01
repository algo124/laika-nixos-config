# MPD (Music Player Daemon) Configuration
{

services.mpd = {
	enable = true;
	musicDirectory = "/home/algo/Music";
	network.startWhenNeeded = true;
};

}
