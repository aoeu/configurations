Description
-----------
Various configuration files for Unix software. 

Organization
------------
Files are categorized and placed into a named, relavant folder for easy
installation via GNU `stow`.
Hidden files (e.g. rc files) remain hidden - for example, the `vim` folder
will contain the files `.vimrc` and `.vim` as they would appear in a
home folder.

Installation
------------
Clone the repo, and `cd` into it.
Run the `install.fish` script to install everything.
Alternatively, use GNU `stow` to manually install or uninstall packages:

* `stow vim -t $HOME` to install vim configurations.
* `stow -D vim -t $HOME` to uninstall vim configurations.

Caveats
-------
Most everything was configured on an OS X system. 
Many things may not work if dropping into a Linux system without modification.
Be especially wary of custom paths, etc.

Some files were meant as temporary one-offs or haven't been migrated to a permanent place yet.