########## USEFULL SHORTCUTS ##########

!! - previous command

    rm -r /etc/orSomething
    sudo !! 

!$ - previous argument

    nano /home/user/path/to/file/that/i/dont/want/to/type/again.sh
    chmod 755 !$

!command - repeat last command

    find / -name "bla"
    !find
    find / -name "bla"

ctrl+r - find some previous command from bash history
ctrl+a - go to the beginning of the line
ctrl+e - go to the end of the line
ctrl+z - suspend current process. fg restores it
ctrl+u - clears the line before the cursor
ctrl+k - clears the line after the cursor

########## REDIRECT OUTPUT TO CLIPBOARD ##########

You need xclip:
    
    sudo apt-get install xclip

Pipe into the clipboard:

    cat foo.bar | xclip

foo.bar is now in you "middle click" clipboard.

If you want to use "ctrl+v":

    cat foo.bar | xclip -sel clip 

########## FIND #########

Finding files which has been modified less than one day:

	find . -mtime -1

List all the files and directories in the box which holds the 777 permission:

	find . -perm 777 –print

Case insensitive search -i

	find . –iname "foO" –print

Delete files that you find:

	find . -name *.foo -print | xargs rm –f

Find files with the word foo:

	find . –name *.txt –print | xargs grep “foo”



########## JOB CONTROL ##########

Run in background

    yourcommand &

Bring to foreground

    fg %jobid

Resume in background (if you won't the job to be running after ctrl+z)

    bg %jobid

List all jobs

    jobs
    
########## CHANGING PERMISSIONS ########## 

setting permissions for files and directories (644 for files and 755 for directories)

    sudo chmod 644 -R /var/www
    sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

works faster than 
    sudo find /var/www -type f -exec sudo chmod 644 '{}' \;
    sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

same thing a bit faster, but doesn't work with a large number of files
    sudo find /var/www -type f -print | xargs sudo chmod 644

########## REDIRECTING OUTPUT ##########

Redirect standard input

    find / -name foo > bar

Redirect standard error

    find / -name foo 2> bar
    
If you don't want to hide errors

    find / -name foo 2> /dev/null

########## RENAMING FILES ########## 

renames prefix foo* with bar* (but must have .extension)

    for file in foo.*; do mv {${file%%.*},bar}.${file#*.} ; done

quick rename 

    mv /path/to/fileOld /path/to/fileNew

or

    mv /path/to/file{Old,New}

delete all .svn folders

   find . -name ".svn" -type d -exec rm -rf '{}' \;

#works faster than 

    sudo find /var/www -type f -exec sudo chmod 644 '{}' \;
    sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

#same thing a bit faster, but doesn't work with a large number of files
    
    sudo find /var/www -type f -print | xargs sudo chmod 644    

######## ENABLE WEBGL ##########

Get the xorg edgers ppa: https://launchpad.net/~xorg-edgers/+archive/radeon

    deb http://ppa.launchpad.net/xorg-edgers/radeon/ubuntu maverick main 
    
Fire up chrome:
    
    google-chrome --ignore-gpu-blacklist
    
or firefox:
    
    MOZ_GLX_IGNORE_BLACKLIST=1 firefox-4.0
    
I also installed:

    sudo apt-get install libgles2-mesa libegl1-mesa

but I'm not sure if this had anything to do with webgl :)
    
