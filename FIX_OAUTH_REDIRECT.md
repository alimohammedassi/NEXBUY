# 🔧 Fix OAuth Redirect Issue (localhost:3000)

## Problem
When clicking Google login, after selecting the account, it redirects to `localhost:3000/?code=...` instead of back to the app, showing "This site can't be reached" error.

## Root Cause
The redirect URL is not properly configured in your Supabase dashboard. Supabase is using a default redirect URL instead of your app's deep link.

---

## ✅ Solution: Configure Redirect URL in Supabase Dashboard

### Step 1: Go to Supabase Dashboard

1. Visit: https://supabase.com/dashboard
2. Select your project: `oudcfgijvkxzawhaayia`
3. Go to **Authentication** → **URL Configuration**

### Step 2: Add Redirect URL

In the **Redirect URLs** section, add this EXACT URL:

```
com.example.nexbuy://login-callback
```

**Important Notes:**
- ✅ NO trailing slash (don't add `/` at the end)
- ✅ NO `http://` or `https://` prefix
- ✅ Must match exactly: `com.example.nexbuy://login-callback`

### Step 3: Save Configuration

Click **Save** to apply the changes.

### Step 4: Verify Site URL

Make sure your **Site URL** is set to:
```
com.example.nexbuy://login-callback
```

Or you can leave it as your web URL if you have one.

---

## 🔍 Additional Checks

### Check 1: Google OAuth Configuration

In your **Google Cloud Console**:

1. Go to your OAuth 2.0 Client ID settings
2. Under **Authorized redirect URIs**, make sure you have:
   ```
   https://oudcfgijvkxzawhaayia.supabase.co/auth/v1/callback
   ```
   This is the Supabase callback URL that Google redirects to first.

### Check 2: Verify Code Configuration

The code is already configured correctly:
- ✅ `lib/services/auth_service.dart` uses: `com.example.nexbuy://login-callback`
- ✅ `lib/main.dart` has redirect URL in auth options
- ✅ `AndroidManifest.xml` has deep link intent filter

---

## 🧪 Testing After Configuration

1. **Uninstall and reinstall the app** (important for deep links):
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Test the flow:**
   - Click "Continue with Google"
   - Select your Google account
   - After authentication, it should redirect back to your app (not localhost:3000)
   - App should automatically navigate to home screen

---

## 🐛 If Still Not Working

### Option 1: Check Supabase Logs

1. Go to Supabase Dashboard → **Logs** → **Auth Logs**
2. Look for any errors related to redirect URLs
3. Check if the redirect URL is being rejected

### Option 2: Verify Deep Link

Test if the deep link works:
```bash
adb shell am start -a android.intent.action.VIEW -d "com.example.nexbuy://login-callback"
```

This should open your app. If it doesn't, the deep link isn't configured correctly.

### Option 3: Check Package Name

Verify your package name matches:
- `android/app/build.gradle.kts`: `applicationId = "com.example.nexbuy"`
- Deep link scheme: `com.example.nexbuy`
- Redirect URL: `com.example.nexbuy://login-callback`

All three must match exactly!

---

## 📝 Summary

The main fix is to add the redirect URL in Supabase dashboard:
1. Go to **Authentication** → **URL Configuration**
2. Add: `com.example.nexbuy://login-callback` (no trailing slash)
3. Save
4. Uninstall and reinstall the app
5. Test again

The code is already correct - you just need to configure it in Supabase!

