# flutter_deep_linking

Deep linking concept here

<b>Setup your project in firebase dashboard.</b>

For android -
Check AndroidManifest.xml of this project. add required code for deep linkin in android.

For ios -
1. reveal ios folder in finder and open Runner.xcworkspace in xcode.
2. check Signing & Capabilities.
3. Add you deep link that you generated from firebase.
4. run "flutter run --release" to test in release mode.