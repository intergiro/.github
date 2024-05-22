set -ev
set -o pipefail

cd "$(dirname "$0")"
cd ..

bash ./Scripts/build-framework.sh

cd build

rm -rf IntergiroSDK-iOS
rm -rf IntergiroSDK-iOS.zip

mkdir IntergiroSDK-iOS
cp -a ../README.md IntergiroSDK-iOS
cp -a IntergiroSDK.xcframework IntergiroSDK-iOS

zip -r IntergiroSDK-iOS.zip IntergiroSDK-iOS
