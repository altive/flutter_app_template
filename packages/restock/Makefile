FLAVOR = development
DEVICE = all

.PHONY: doctor
doctor:
	fvm flutter doctor
	
.PHONY: devices
devices:
	fvm flutter devices
	
.PHONY: analyze
analyze:
	fvm flutter analyze
	
.PHONY: clean
clean:
	fvm flutter clean
	
.PHONY: pub-get
pub-get:
	fvm flutter pub get
	
.PHONY: build-runner
build-runner:
	fvm flutter pub pub run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	fvm flutter pub pub run build_runner watch --delete-conflicting-outputs

.PHONY: build-ios-staging
build-ios-staging:
	fvm flutter build ios --release --flavor staging --dart-define=FLAVOR=staging

.PHONY: build-ios-production
build-ios-production:
	fvm flutter build ios --release --flavor production --dart-define=FLAVOR=production --no-tree-shake-icons

.PHONY: build-android-production
build-android-production:
	fvm flutter build appbundle --release --flavor production --dart-define=FLAVOR=production --no-tree-shake-icons

.PHONY: run-release-development
run-release-development:
	fvm flutter run --release --flavor development --dart-define=FLAVOR=development

.PHONY: run-release-production
run-release-production:
	fvm flutter run --release --flavor production --dart-define=FLAVOR=production

.PHONY: run
run:
	fvm flutter run --debug --flavor ${FLAVOR} --dart-define=FLAVOR=${FLAVOR} -d ${DEVICE}

.PHONY: run-release
run-release:
	fvm flutter run --release --flavor ${FLAVOR} --dart-define=FLAVOR=${FLAVOR} -d ${DEVICE}

.PHONY: generate-icons
generate-icons:
	fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-production.yaml

.PHONY: submit-ios
submit-ios:
	cd ios && bundle exec fastlane submit

.PHONY: submit-android
submit-android:
	cd android && bundle exec fastlane submit

.PHONY: submit
submit:
	cd android && bundle exec fastlane submit
	cd ios && bundle exec fastlane submit

.PHONY: beta-ios
beta-ios:
	cd ios && bundle exec fastlane beta

.PHONY: beta-android
beta-android:
	cd android && bundle exec fastlane beta

.PHONY: beta
beta:
	cd android && bundle exec fastlane beta
	cd ios && bundle exec fastlane beta

.PHONY: upload-ios
upload-ios:
	cd ios && bundle exec fastlane upload

