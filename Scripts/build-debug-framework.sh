set -ev
set -o pipefail

cd "$(dirname "$0")"
cd ..

rm -rf ./build/IntergiroSDK-Debug.framework-iphoneos.xcarchive
rm -rf ./build/IntergiroSDK-Debug.framework-iphonesimulator.xcarchive
rm -rf ./build/IntergiroSDK-Debug.xcframework

xcodebuild archive \
-scheme IntergiroSDK-Debug \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/IntergiroSDK-Debug.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme IntergiroSDK-Debug \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/IntergiroSDK-Debug.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework './build/IntergiroSDK-Debug.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/IntergiroSDK_Debug.framework' \
-framework './build/IntergiroSDK-Debug.framework-iphoneos.xcarchive/Products/Library/Frameworks/IntergiroSDK_Debug.framework' \
-output './build/IntergiroSDK-Debug.xcframework'
