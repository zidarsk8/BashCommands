########## USEFULL SHORTCUTS ##########

!! - previous command

    rm -r /etc/orSomething
    sudo !! 

!$ - previous argument

    nano /home/user/path/to/file/that/i/dont/want/to/type/again.sh
    chmod 755 !$

ctrl+r - find some previous command from bash history
ctrl+a - go to the beginning of the line
ctrl+e - go to the end of the line
ctrl+z - suspend current process. fg restores it
ctrl+u - clears the line before the cursor
ctrl+k - clears the line after the cursor


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

######## ENABLE WEBGL IN CHROME ##########
google-chrome --ignore-gpu-blacklist
