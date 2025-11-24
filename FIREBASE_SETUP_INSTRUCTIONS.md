# 🔥 Firebase Setup Instructions for Google Authentication

## Step 1: Create Firebase Project

1. **Go to Firebase Console:**
   - Visit: https://console.firebase.google.com/
   - Click **"Add project"** or select existing project

2. **Project Details:**
   - Project name: `nexbuy` (or your preferred name)
   - Click **Continue**
   - Disable Google Analytics (optional) or enable it
   - Click **Create project**

---

## Step 2: Add Android App to Firebase

1. **In Firebase Console:**
   - Click the **Android icon** (or "Add app")
   - Package name: `com.example.nexbuy` ⚠️ **Must match exactly!**
   - App nickname: `NexBuy Android` (optional)
   - Debug signing certificate SHA-1: (we'll add this later)
   - Click **Register app**

2. **Download google-services.json:**
   - Click **Download google-services.json**
   - **IMPORTANT:** Don't close this page yet!

---

## Step 3: Add SHA-1 Fingerprint

1. **Get your SHA-1 fingerprint:**
   ```powershell
   keytool -list -v -keystore "$env:USERPROFILE\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
   ```

2. **Copy the SHA-1 value:**
   - Look for: `SHA1: XX:XX:XX:XX:...`
   - Copy the entire SHA-1 string

3. **Add to Firebase:**
   - Go back to Firebase Console
   - In your Android app settings
   - Click **"Add fingerprint"**
   - Paste your SHA-1
   - Click **Save**

4. **Download updated google-services.json:**
   - After adding SHA-1, download the file again
   - Replace the old one in `android/app/`

---

## Step 4: Configure Firebase Options

### Option A: Using FlutterFire CLI (Recommended)

1. **Install FlutterFire CLI:**
   ```powershell
   dart pub global activate flutterfire_cli
   ```

2. **Configure Firebase:**
   ```powershell
   flutterfire configure
   ```
   - Select your Firebase project
   - Select platforms: Android
   - This will automatically update `firebase_options.dart`

### Option B: Manual Configuration

1. **Get your Firebase config values:**
   - Go to Firebase Console → Project Settings
   - Scroll to "Your apps"
   - Click on your Android app
   - Copy the values

2. **Update `lib/firebase_options.dart`:**
   - Replace `YOUR_ANDROID_API_KEY` with your API key
   - Replace `YOUR_ANDROID_APP_ID` with your App ID
   - Replace `YOUR_MESSAGING_SENDER_ID` with your Sender ID
   - Replace `YOUR_PROJECT_ID` with your Project ID
   - Replace `YOUR_PROJECT_ID.appspot.com` with your Storage Bucket

---

## Step 5: Enable Google Sign-In

1. **In Firebase Console:**
   - Go to **Authentication** → **Sign-in method**
   - Click on **Google**
   - Toggle **Enable** to ON
   - Set Project support email
   - Click **Save**

---

## Step 6: Place google-services.json

1. **Copy the file:**
   - From your Downloads folder
   - To: `android/app/google-services.json`

2. **Verify:**
   - File should be at: `android/app/google-services.json`
   - File should contain your project configuration

---

## Step 7: Test the Setup

1. **Run the app:**
   ```powershell
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Test Google Sign-In:**
   - Tap "Continue with Google"
   - Select a Google account
   - Should sign in successfully ✅

---

## ✅ Checklist

- [ ] Firebase project created
- [ ] Android app added to Firebase
- [ ] Package name matches: `com.example.nexbuy`
- [ ] SHA-1 fingerprint added to Firebase
- [ ] `google-services.json` downloaded and placed in `android/app/`
- [ ] `firebase_options.dart` configured (or FlutterFire CLI used)
- [ ] Google Sign-In enabled in Firebase Console
- [ ] App builds and runs without errors
- [ ] Google Sign-In button works

---

## 🆘 Troubleshooting

### Error: "No Firebase App '[DEFAULT]' has been created"
- Check `firebase_options.dart` has correct values
- Verify `google-services.json` is in `android/app/`
- Run `flutter clean` and rebuild

### Error: "12500" or "sign_in_failed"
- Verify SHA-1 is added to Firebase Console
- Download new `google-services.json` after adding SHA-1
- Restart the app completely

### Error: "Package name mismatch"
- Check `android/app/build.gradle.kts`: `applicationId = "com.example.nexbuy"`
- Check Firebase Console: Package name matches exactly

---

## 📝 Next Steps

After setup is complete:
1. ✅ Test Google Sign-In
2. ✅ Test sign-out
3. ✅ Verify user session persists
4. ✅ Check error handling

**You're all set!** 🎉



























