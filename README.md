# Terminal settings
Various file for terminal configuration (Windows / Bash)


## Windows Terminal settings.json

```settings_terminal_windows.json```

The Windows terminal is available through the [Windows Store](https://www.microsoft.com/fr-fr/p/windows-terminal/9n0dx20hk701?rtc=1&activetab=pivot:overviewtab)

This is my basic profiles configuration (Ubuntu / cmd / Powershell / conda), terminal appearance customization (background, color schemes, logos & tab colors) :

Rename the file to `settings.json` and place it in the appropriate folder, or just copy all or some of the content to your setting file.
A quick look:
![terminals](https://user-images.githubusercontent.com/18436720/120677485-68114480-c497-11eb-831a-069505a49a8a.png)


## Bash configuration

My `.bashrc` file, to replace (edit the `username` in the paths), or to copy some parts. 

Main features: 
+ My prompt colors, main aliases, ls colors
+ git branch highlighting in the prompt
  + A quick look:  <img src="https://user-images.githubusercontent.com/18436720/120680893-1ec2f400-c49b-11eb-8eaf-f6097ff7cdac.png" width="400">
+ some usefull functions:
  + number of files in a directory : `numf ./path` > echo the numberr
  + extract : `extract /path/to/file.tar`  > Works for `.tar.bz2`, `.rar`, `.gz`, `.zip`, ... (all main a rchive formats)
  + network information : `netinfo` > IP address


## Vim configuration file .vimrc

My `.vimrc` file.

Main features:
+ Mouse support (to some extent), 
+ Customization: 
   + Status line color according to mode (insert / visual), 
   + Status line info: filename, file encoding, line number / total number of lines
   + Cursor line, line numbers, 
   + A quick look: <img src="https://user-images.githubusercontent.com/18436720/120682045-4c5c6d00-c49c-11eb-8cff-f778af995fe5.png" width="400">

+ With 2 pathogen plugins I like:
   + Synthaxic colors for OpenFOAM (CFD code)
   + VMATH : quick analysis of selected data (yanked)
   + How to install [pathogen](https://github.com/tpope/vim-pathogen)
