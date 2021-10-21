![Cracker app logo](logo.svg)

# cracker_mobile

_"Crack Kraków with the Cracker app!"_

Big thanks to :octocat: [mmBs](https://github.com/mmBs) for time and advice. :clap:

## Setup:

1. You first need to define certain Dart environment variables:
    - `AUTH0_DOMAIN` - the domain address of your Auth0 account
    - `AUTH0_CLIENT_ID` - the client ID of your mobile app from Auth0
   Detailed instruction on how to define `--dart-define` arguments you can find [here](https://stackoverflow.com/questions/55004302/how-do-you-pass-arguments-from-command-line-to-main-in-flutter-dart).

If you plan to edit the localization files present in `lib/l10n` which are of ARB  ([Application Resource Bundle](https://stackoverflow.com/questions/43082804/l10n-arb-file-format)) format, it would be a good idea to get a special IDE plugin which understands how to format such files.

0. Before running the app you will need [Google Maps API key](https://console.cloud.google.com/apis/credentials).
1. After you get it, go to `android` directory and find the autogenerated `local.properties` file.
2. Add a new line with your API key in a format like this `google.mapsApiKey=YOUR_API_KEY`.

## Release:

0. Remember to turn off your emulator before you start the installation on a mobile device.
1. To release the app for Android device just run `flutter build apk --release`.
2. The `apk` file should be present in `cracker-mobile-flutter\build\app\outputs\flutter-apk` directory with the `app-release.apk` name.
2. Download the [SDK Platform Tools](https://developer.android.com/studio/releases/platform-tools) from Android Developers website. It includes the `adb` tool, that is Android Debug Bridge. [Extract the contents](https://www.xda-developers.com/install-adb-windows-macos-linux/) of this ZIP file into an easily accessible folder (such as `C:\adb`).
3. Turn on the USB debug mode on you phone. Usually you can start with tapping multiple times on the version in settings section, what unlocks the `{} Developer options` section. There you can find an switch which will allow USB debugging.
4. Open Powershell, Git Shell or any of those in the directory where the `adb.exe` is and run `./adb.exe devices`. Your device should be listed.
5. Copy the `.apk` file to the directory where the `adb.exe` file is and run `./adb.exe install app-release.apk`.
6. After the `adb` console returns a message as below, the app should be available on your phone:

```
PS C:\android\platform-tools> .\adb.exe install cracker.apk
Performing Streamed Install
Success
```

## Packages:

- `flutter_appauth` - a well-maintained wrapper package around AppAuth for Flutter developed by Michael Bui. AppAuth authenticates and authorizes users and supports the PKCE extension
- *(not yet migrated)* `flutter_localizations` - package that specifies additional `MaterialApp` properties that include localization
- `flutter_secure_storage` - library to securely persist data locally
- *(not yet migrated)* `geolocator` - geolocation plugin which provides easy access to platform specific location services (FusedLocationProviderClient or if not available the LocationManager on Android and CLLocationManager on iOS)
- *(not yet migrated)* `google_maps_flutter` - plugin that provides a Google Maps widget
- `graphql-flutter` - a package based on Apollo GraphQL client that allows an integration with a GraphQL server in Flutter
- `http` - a composable, Future-based library for making HTTP requests published by the Dart Team

## Resources:

- [Advanced Layout Rule Even Beginners Must Know](https://medium.com/flutter-community/flutter-the-advanced-layout-rule-even-beginners-must-know-edc9516d1a2)
- [Android Asset Studio for assets generation](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html)
- [Auth0 with Flutter](https://auth0.com/blog/flutter-authentication-authorization-with-auth0-part-1-adding-authentication-to-an-app/)
- [Hide your api keys from your android manifest file with Flutter using local.properties](https://dev.to/stevenosse/hide-your-api-keys-from-your-android-manifest-file-with-flutter-using-local-properties-3f4e)
- [Icon converter for mobile devices](https://appicon.co/)
- [Widget lifecycle in Flutter](https://stackoverflow.com/questions/41479255/life-cycle-in-flutter)