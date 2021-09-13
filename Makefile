.PHONY: setup
setup:
	dart pub global activate fvm
	fvm install

.PHONY: get-dependencies
get-dependencies:
	fvm flutter pub get

.PHONY: doctor
doctor:
	fvm flutter doctor
	
.PHONY: devices
devices:
	fvm flutter devices
	
.PHONY: clean
clean:
	fvm flutter clean
	
.PHONY: analyze
analyze:
	fvm flutter analyze
	
.PHONY: format 
format:
	fvm flutter format lib/

.PHONY: format-dry-exit-if-changed
format-dry-exit-if-changed:
	fvm flutter format --dry-run --set-exit-if-changed lib/

.PHONY: build-runner
build-runner:
	fvm flutter pub pub run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	fvm flutter pub pub run build_runner watch --delete-conflicting-outputs

.PHONY: unit-test
unit-test:
	fvm flutter test --coverage --coverage-path=~/coverage/lcov.info

.PHONY: generate-icons
generate-icons:
	fvm flutter pub run flutter_launcher_icons:main