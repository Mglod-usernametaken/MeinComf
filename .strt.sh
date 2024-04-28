#!/bin/bash
fortune | cowsay -f $(ls /usr/share/cows/|shuf -n 1) | lolcat
bash -i
