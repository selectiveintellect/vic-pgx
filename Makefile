##################################################
###COPYRIGHT: 2014. Vikas N Kumar <vikas@cpan.org>
###AUTHOR: Vikas N Kumar, Ingy Dot Net
###SOFTWARE: VIC
##################################################
GRAMMAR = $(shell echo *.pgx)
PEGEX=$(shell which pegex)

ifeq ($(PEGEX),)
 $(error "You need to install Pegex::Cmd perl package to run this")
endif

COMPILE_COMMAND = $(PEGEX) compile $(OPTIONS) --to=
ALL = $(GRAMMAR:%=%.yaml) $(GRAMMAR:%=%.json)

all: $(ALL)

$(ALL): $(GRAMMAR) Makefile
	$(COMPILE_COMMAND)$(shell perl -e '$$_="$@";s/.*\.//;print') $(shell perl -e '$$_="$@";s/\.\w+$$//;print') > $@

clean purge:
	rm -f *.yaml *.json
