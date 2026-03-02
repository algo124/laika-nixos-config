# MPD (Music Player Daemon) Configuration
{

services.mpd = {
	enable = true;
	musicDirectory = "~/Music";
	extraConfig = ''
		bind_to_address "localhost"
		port "6600"
      		audio_output {
        		type            "pipewire"
        		name            "PipeWire Sound Server"
      		}
      	'';
};

}
