all: fvm fvm_install melos melos_bs flutterfire_cli mason mason_get

fvm:
	dart pub global activate fvm

fvm_install:
	fvm install

melos:
	dart pub global activate melos

melos_bs:
	melos bootstrap

generate_code:
	melos run gen --no-select

flutterfire_cli:
	fvm dart pub global activate flutterfire_cli

mason:
	fvm dart pub global activate mason_cli

mason_get:
	mason get
