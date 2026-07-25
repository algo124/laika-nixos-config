# Dependencies: yt-dlp, ffmpeg, fish
if test (count $argv) -ge 2
	if not test (count $argv) -ge 3
		set -f --path dir "~/Sound"
	end
	yt-dlp -x --audio-format wav --no-playlist $url -o $file -P $dir
else
	echo "Add url, desired file name, and optional file directory."
end
