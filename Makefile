SRC=draft-ietf-dnsop-dns-tcp-requirements
DST=$(shell grep docName= ${SRC}.xml | awk '{print $$3}' | awk -F= '{print $$2}' | sed -e 's/"//g' )

all: Versions/${DST}.txt

Versions/${DST}.txt: ${SRC}.xml
	xml2rfc ${SRC}.xml -o $@

.PHONY: clean
	
clean:
	rm -f ${DST}.txt
