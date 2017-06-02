# Makefile for QImportP

VERSION = 0.6.0
# ZIPVERSION = 050
# for 2.0.0, use 200, etc - note - lines above should have no spaces at end

SOURCES    = QImportP.wsf QImportP.cmd.txt ChangeLog README Makefile

# Makefile macros....
#1.  $@ is the name of the file to be made.
#2.  $? is the names of the changed dependents. 
#3.  $< the name of the related file that caused the action.
#4.  $* the prefix shared by target and dependent files. 
# ---------------

ZIP = QImportP-$(VERSION)

all: dist

dist: 
	rm -rf $(ZIP).zip
	mkdir $(ZIP)
	cp $(SOURCES) $(ZIP)/
	zip -r $(ZIP).zip $(ZIP)/
	rm -rf $(ZIP)

upload: 
	@echo -e "\n*** Did you remember to edit Makefile? ****\n-------"
	@cat lftp.script
	@read -p "Hit Enter to Continue, ^C to kill/exit...." DummyArg
	lftp www.aczoom.com < lftp.script
# don't use www.acplace.net - it may not have .netrc login
# in any case, for both URLs, have to use ~/www/acplace in lftp.script

#-----------------------------------------
clean:
	rm -f *.tgz *~
