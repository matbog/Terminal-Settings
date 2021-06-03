# Terminal settings
Various file for terminal configuration (Windows / Bash)

## Windows Terminal settings.json
The Windows terminal is available through the [Windows Store](https://www.microsoft.com/fr-fr/p/windows-terminal/9n0dx20hk701?rtc=1&activetab=pivot:overviewtab)

This is my basic profiles configuration (Ubuntu / cmd / Powershell / conda), terminal appearance customization (background, color schemes, logos & tab colors) :
```settings_terminal_windows.json```
Rename the file `settings.json`, or just copy all or some of the content to your setting file.
A quick look:
![terminals](https://user-images.githubusercontent.com/18436720/120677485-68114480-c497-11eb-831a-069505a49a8a.png)


## Bash configuration .bashrc
+ main aliases
+ ls colors for me
+ git branch highlighting in the prompt
  + <img src="https://user-images.githubusercontent.com/18436720/120680893-1ec2f400-c49b-11eb-8eaf-f6097ff7cdac.png" width="400">
+ some usefull functions:
  + number of files in a directory : `numf ./path`
  + extract : `extract /path/to/file.tar`  >> `.tar.bz2`, `.rar`, `.gz`, `.zip`, ... (all main a rchive formats)
  + network information : `netinfo` > IP address

## Vim configuration file .vimrc
+ Mouse support, 
+ Customization: 
   + Status line color according to mode (insert / visual), with the filename, file encoding, line number / total number of lines
   + Cursor line, line numbers, 
   + ![vim](https://user-images.githubusercontent.com/18436720/120682045-4c5c6d00-c49c-11eb-8cff-f778af995fe5.png)

+ With 2 pathogen plugins I like:
   + Synthaxic colors for OpenFOAM (CFD code)
   + VMATH : quick analysis of selected data (yanked)
   + How to install [pathogen](https://github.com/tpope/vim-pathogen)
