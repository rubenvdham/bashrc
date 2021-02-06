install: overwrite

# appends the .bashrc to your current bashrc (safest option, but may have collions)
append:
	cat .bashrc >> ~/.bashrc

# backups old .bashrc and uses this .bashrc as the new bashrc
overwrite:
	mv ~/.bashrc ~/.bashrc.bkp
	cp .bashrc ~/

# reverts to backupped .bashrc
revert: 
	mv ~/.bashrc.bkp ~/.bashrc

# Installs the manjaro default .bashrc (as shipped with my manjaro ISO)
manjaro:	
	cp .bashrcmanjaro ~/.bashrc
