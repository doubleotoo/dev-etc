 Store temporary files in a central spot
 ---------------------------------------

 Swap files and backups are annoying but can save you a lot of trouble.
 Rather than spread them all around your filesystem, isolate them to a single
 directory:

``` bash
    $ mkdir ~/.vim/tmp  # or whatever
```

 This is especially valuable after an unexpected reboot — you don’t have to
 track down all the leftover temp files. However: if you are editing files on
 a shared file system, it’ll be easier to clobber concurrent modifications, as
 other users’ Vim processes won’t see your swaps.

``` bash
    set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
```

