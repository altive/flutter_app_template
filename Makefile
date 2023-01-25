all: fvm fvm_install melos melos_bs flutterfire_cli mason mason_get

fvm:
	dart pub global activate fvm

fvm_install:
	fvm install

melos:
	fvm flutter pub global activate melos

melos_bs:
	fvm flutter pub global run melos bootstrap

flutterfire_cli:
	fvm dart pub global activate flutterfire_cli

mason:
	fvm dart pub global activate mason_cli

mason_get:
	mason get
