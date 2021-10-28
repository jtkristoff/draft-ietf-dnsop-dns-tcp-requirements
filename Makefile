SRC=draft-ietf-dnsop-dns-tcp-requirements
DST=${SRC}
VER=$(shell cat ${SRC}.xml | grep '^.rfc category' | awk '{print $$3}' | awk -F= '{print $$2}' | sed -e s'/"//g' | awk -F- '{print $$NF}')
VERP=$(shell expr ${VER} - 1)
VERQ=$(shell printf '%02d' ${VERP})

.PHONY: clean rfcdiff

all: Versions/${DST}-${VER}.txt

Versions/${DST}-${VER}.txt: ${SRC}.xml
	xml2rfc ${SRC}.xml -o $@

rfcdiff: Versions/${DST}-${VER}.txt
	cd Versions; bash ../rfcdiff ${DST}-${VERQ}.txt ${DST}-${VER}.txt ${DST}-${VER}-from-${VERQ}.diff.html

clean:
	rm -f ${DST}-${VER}.txt
