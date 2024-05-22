set -ev
set -o pipefail

cd "$(dirname "$0")"
cd ..

rm -rf ./build/IntergiroSDK.framework-iphoneos.xcarchive
rm -rf ./build/IntergiroSDK.framework-iphonesimulator.xcarchive
rm -rf ./build/IntergiroSDK.xcframework

xcodebuild archive \
-scheme IntergiroSDK \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/IntergiroSDK.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme IntergiroSDK \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/IntergiroSDK.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework './build/IntergiroSDK.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/IntergiroSDK.framework' \
-framework './build/IntergiroSDK.framework-iphoneos.xcarchive/Products/Library/Frameworks/IntergiroSDK.framework' \
-output './build/IntergiroSDK.xcframework'
