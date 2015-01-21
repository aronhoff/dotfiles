#!/bin/bash
youtube-dl -x -i --audio-format mp3 --audio-quality 192K $1 -f bestaudio -o '/media/aron/Lithium/mus/%(title)s.%(ext)s'
