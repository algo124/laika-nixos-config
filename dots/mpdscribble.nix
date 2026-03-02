# MPD Scribble (Last.fm connector) Configuration
{

services.mpdscribble = {
	enable = true;
	journalInterval = 60;
	endpoints = {
		"last.fm" = {
			username = "algorae";
			passwordFile = "/home/algo/Documents/Passwords/lastfmpassword.txt";
		};
	};
};


}
