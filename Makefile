#
#                                                                   
#                   VVM
#                      
#   Copyright (C) 2012, 2013 TIS Innovation Park
#                                                                   
# This program is free software; you can redistribute it and/or     
# modify it under the terms of the GNU General Public License       
# as published by the Free Software Foundation; either version 3    
# of the License, or any later version.                             
#                                                                   
#                                                                   
# This program is distributed in the hope that it will be useful,   
# but WITHOUT ANY WARRANTY; without even the implied warranty of    
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     
# GNU General Public License for more details.                      
#                                                                   
# You should have received a copy of the GNU General Public License 
# along with this program; if not, write to the Free Software       
# Foundation, Inc., 51 Franklin Street, Boston,            
# MA  02110-1301, USA.                                              
#

BINS=bin/vmm bin/vmm-auto
SCRIPTS=scripts/vmm-client-functions scripts/functions scripts/generate-conf
LOGGERS=scripts/loggers/debug-logger scripts/loggers/txt-logger 
EXAMPLES=examples/searduino.sh

#
# directory setup
#
INSTALL_DIR=/tmp
SHARE_DIR=/tmp/share/vmm
BIN_DIR=/tmp/bin




#
# 
#

$(BINS): bin/vmm.tmpl  bin/vmm-auto.tmpl Makefile
	@echo "*** Creating scripts ***"
	if [ -f bin/vmm ] ; then mv bin/vmm bin/vmm.keep ; fi
	if [ -f bin/vmm-auto ]   ; then mv bin/vmm-auto   bin/vmm-auto.keep   ; fi
	cat bin/vmm.tmpl | sed "s,__VMM_DIR__,$(INSTALL_DIR),g" > bin/vmm
	cat bin/vmm-auto.tmpl   | sed "s,__VMM_DIR__,$(INSTALL_DIR),g" > bin/vmm-auto
	chmod a+x bin/vmm
	chmod a+x bin/vmm-auto

$(EXAMPLES): examples/searduino.tmpl
	@echo "*** Creating examples ***"
	cat examples/searduino.tmpl | sed "s,__VMM_DIR__,$(INSTALL_DIR),g" > examples/searduino.sh
	chmod a+x examples/searduino.sh

install: $(BINS) $(SCRIPTS) $(EXAMPLES) 
	@echo "*** Installing ***"
	mkdir -p $(BIN_DIR)/
	mkdir -p $(SHARE_DIR)/scripts
	mkdir -p $(SHARE_DIR)/scripts/loggers
	mkdir -p $(SHARE_DIR)/examples

	cp $(BINS)        $(BIN_DIR)/
	cp $(EXAMPLES)    $(SHARE_DIR)/examples
	cp -r $(SCRIPTS)  $(SHARE_DIR)/scripts
	cp -r $(LOGGERS)  $(SHARE_DIR)/scripts/loggers

check:
	test/install-and-test-auto.sh


#
# clean 
#
clean:
	rm -f $(BINS) Makefile
