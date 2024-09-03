all: fvm fvm_install melos melos_bs flutterfire_cli

fvm:
	brew tap leoafarias/fvm
	brew install fvm

fvm_install:
	fvm install --setup

melos:
	dart pub global activate melos

melos_bs:
	melos bootstrap

generate_code:
	melos run gen --no-select

flutterfire_cli:
	fvm dart pub global activate flutterfire_cli
