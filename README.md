Description
-----------
Various configuration files for Unix software.

If you call them "dot files" around me, I will be confused as to whether you are referring to Unix hidden files or some kind of Unix resource configuration (rc) files.

Organization
------------
Files are categorized and placed into a named, relavant folder for easy
installation via GNU `stow`.
Hidden files remain hidden - for example, the `vim` folder
will contain the files `.vimrc` and `.vim` as they would appear in a
home folder. 

Make sure to use `ls -a` when exploring project directories.

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
Many things may not work if installing onto a Linux system without modification.
Be especially wary of custom paths, etc.

Some files were meant as temporary one-offs or haven't been migrated to a permanent place yet.