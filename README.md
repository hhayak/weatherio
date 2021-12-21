# Weatherio

Case study project for Appinio.

## Remarks

* I assume the Profile and the City don't change. However, they are retrieved from a settings class
which acts as a user-defined preference stored in a persistent storage.
* I didn't implement dedicated Exception classes, splash screens and app icons in order to keep the
scope of this case study manageable.
* Currently, I don't have access to a MacOS machine. So, a friend of mine with a Mac helped with the
IOS build and testing.
  
## Building the app

Nothing special to be done. You can use 'flutter build apk/ios --release'