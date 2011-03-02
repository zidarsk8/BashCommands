########## USEFULL SHORTCUTS ##########

!! - previous command

    rm -r /etc/orSomething
    sudo !! 

!$ - previous argument

    nano /home/user/path/to/file/that/i/dont/want/to/type/again.sh
    chmod 755 !$

########## CHANGING PERMISSIONS ########## 

setting permissions for files and directories (644 for files and 755 for directories)

    sudo chmod 644 -R /var/www
    sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

works faster than 
    sudo find /var/www -type f -exec sudo chmod 644 '{}' \;
    sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

same thing a bit faster, but doesn't work with a large number of files
    sudo find /var/www -type f -print | xargs sudo chmod 644




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




RENAMING FILES:
#renames prefix foo* with bar* (but must have .extension)
for file in foo.*; do mv {${file%%.*},bar}.${file#*.} ; done

DELETE ALL SVN FOLDERS:
find . -name ".svn" -type d -exec rm -rf {} \;
>>>>>>> origin/master:bash
