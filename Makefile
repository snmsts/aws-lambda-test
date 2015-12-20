dlls = libcrypto.so.1.0.0 libssl.so.1.0.0
zip = prog.zip
js= index.js

all: $(zip)

clean:
	rm -f $(dlls) $(zip) $(zip:.zip=)

%.zip:%.bin $(dlls) $(js)
	zip $@ $(dlls) $(js) $<

%.bin: %.ros
	ros build $<
	mv $(<:.ros=) $@

%.0:
	cp /lib/x86_64-linux-gnu/$@ .
