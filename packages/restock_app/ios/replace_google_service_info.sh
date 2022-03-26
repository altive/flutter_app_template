#! /bin/bash

if [[ $CONFIGURATION == *"Emulator"* ]]; then
    cp $PRODUCT_NAME/Firebase/GoogleService-Info-Emulator.plist $PRODUCT_NAME/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Development"* ]]; then
    cp $PRODUCT_NAME/Firebase/GoogleService-Info-Development.plist $PRODUCT_NAME/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Staging"* ]]; then
    cp $PRODUCT_NAME/Firebase/GoogleService-Info-Staging.plist $PRODUCT_NAME/GoogleService-Info.plist
elif [[ $CONFIGURATION == *"Production"* ]]; then
    cp $PRODUCT_NAME/Firebase/GoogleService-Info-Production.plist $PRODUCT_NAME/GoogleService-Info.plist
elif [[ $CONFIGURATION == "Release" ]]; then
    echo "Might be CI archive"
else
    echo "configuration didn't match to Development, Staging or Production"
    echo $CONFIGURATION
    exit 1
fi
