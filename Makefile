all: fvm fvm_install melos melos_bs

fvm:
	dart pub global activate fvm

fvm_install:
	fvm install

melos:
	fvm flutter pub global activate melos 1.2.2

melos_bs:
	fvm flutter pub global run melos bootstrap
