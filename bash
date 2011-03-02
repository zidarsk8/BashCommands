####CHANGING PERMISSIONS
sudo chmod 644 -R /var/www
sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

#works faster than 

sudo find /var/www -type f -exec sudo chmod 644 '{}' \;
sudo find /var/www -type d -exec sudo chmod 755 '{}' \;

#same thing a bit faster, but doesn't work with a large number of files
sudo find /var/www -type f -print | xargs sudo chmod 644




RENAMING FILES:
#renames prefix foo* with bar* (but must have .extension)
for file in foo.*; do mv {${file%%.*},bar}.${file#*.} ; done
