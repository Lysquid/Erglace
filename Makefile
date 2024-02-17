all: release

dist: erglace.toml
	kalamine make erglace.toml
	cp -f erglace.toml dist/erglace.toml
	mkdir -p img
	mv -f dist/erglace.svg img

img: dist
	cp -f img/erglace.svg img/erglace_1dk.svg
	cp -f img/erglace.svg img/erglace_altgr.svg
	cp -f img/erglace.svg img/erglace_all.svg

	cp -f img/erglace.svg img/erglace_iso.svg
	cp -f img/erglace.svg img/erglace_iso_1dk.svg
	cp -f img/erglace.svg img/erglace_iso_altgr.svg
	cp -f img/erglace.svg img/erglace_iso_all.svg

	sed -i 's/iso intlBackslash/ergo ol40/g' img/erglace.svg 
	sed -i 's/iso intlBackslash/ergo ol40 dk/g' img/erglace_1dk.svg
	sed -i 's/iso intlBackslash/ergo ol40 altgr/g' img/erglace_altgr.svg
	sed -i 's/iso intlBackslash/ergo ol40 mixed/g' img/erglace_all.svg

	sed -i 's/iso intlBackslash/iso intlBackslash dk/g' img/erglace_iso_1dk.svg
	sed -i 's/iso intlBackslash/iso intlBackslash altgr/g' img/erglace_iso_altgr.svg
	sed -i 's/iso intlBackslash/iso intlBackslash mixed/g' img/erglace_iso_all.svg

release: img

clean:
	rm -rf dist

install:
	xkalamine install erglace.toml

uninstall:
	xkalamine remove fr/erglace