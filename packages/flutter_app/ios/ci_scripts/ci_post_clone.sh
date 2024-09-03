#!/bin/sh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH # change working directory to the root of your cloned repo.

# Extract the Flutter version from .fvmrc file
FLUTTER_VERSION=$(cat .fvmrc | grep "flutter" | cut -d '"' -f 4)

# Clone the Flutter repository with the specified version
git clone https://github.com/flutter/flutter.git --depth 1 -b $FLUTTER_VERSION $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Print the Flutter version
flutter --version

# change working directory to the Flutter app directory.
cd ./packages/flutter_app

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

# Install CocoaPods dependencies.
cd ios && pod install # run `pod install` in the `ios` directory.

# The flutterfire command is used in Xcode Build Phases and must be installed in advance.
dart pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Build the iOS app in release mode with no code signing.
flutter build ios --release --dart-define-from-file=dart_defines/${flavor}.env --no-codesign

exit 0