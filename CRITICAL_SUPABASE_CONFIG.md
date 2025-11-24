# 🚨 CRITICAL: Fix OAuth Redirect (localhost:3000 Error)

## ⚠️ The Problem

After Google authentication, you're being redirected to `localhost:3000` instead of your app. This means **the redirect URL is NOT configured in your Supabase dashboard**.

## ✅ The Solution (MUST DO THIS)

You **MUST** configure the redirect URL in Supabase Dashboard. The code is correct, but Supabase needs to know it's allowed to redirect to your app.

---

## 📋 Step-by-Step Fix

### Step 1: Open Supabase Dashboard

1. Go to: **https://supabase.com/dashboard**
2. Select your project: **oudcfgijvkxzawhaayia**
3. Click on **Authentication** in the left sidebar

### Step 2: Configure Redirect URLs

1. In the Authentication section, click on **URL Configuration** (or look for "Redirect URLs")
2. You'll see a section called **Redirect URLs** or **Site URL**
3. In the **Redirect URLs** field, add this EXACT URL (one per line if multiple):
   ```
   com.example.nexbuy://login-callback
   ```
   
   **CRITICAL NOTES:**
   - ✅ NO trailing slash (don't add `/` at the end)
   - ✅ NO `http://` or `https://` prefix
   - ✅ Must be EXACTLY: `com.example.nexbuy://login-callback`
   - ✅ Case-sensitive - must match exactly

4. Click **Save** button

### Step 3: Verify Site URL (Optional but Recommended)

While you're there, also check the **Site URL** field. It can be:
- Your web URL (if you have one)
- OR: `com.example.nexbuy://login-callback`
- OR: Leave it as default

### Step 4: Test Again

1. **Uninstall the app completely** from your device
2. **Rebuild and install**:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```
3. Try Google login again

---

## 🔍 How to Verify It's Configured

1. Go to Supabase Dashboard → Authentication → URL Configuration
2. Look at the **Redirect URLs** section
3. You should see: `com.example.nexbuy://login-callback` in the list
4. If it's NOT there, that's why it's redirecting to localhost:3000!

---

## 🎯 Why This Happens

Supabase has a security feature that only allows redirects to URLs that are explicitly configured. If your redirect URL isn't in the list, Supabase uses a default (localhost:3000) which doesn't work on mobile.

---

## 📸 Where to Find It in Dashboard

The path is:
```
Supabase Dashboard 
  → Your Project (oudcfgijvkxzawhaayia)
  → Authentication (left sidebar)
  → URL Configuration (tab or section)
  → Redirect URLs (field)
```

---

## ⚡ Quick Checklist

Before testing again, verify:
- [ ] Redirect URL added in Supabase: `com.example.nexbuy://login-callback`
- [ ] No trailing slash
- [ ] No http:// or https:// prefix
- [ ] Clicked "Save"
- [ ] Uninstalled app from device
- [ ] Rebuilt and reinstalled app

---

## 🐛 Still Not Working?

If you've done all the above and it's still redirecting to localhost:3000:

1. **Double-check the redirect URL in Supabase:**
   - Go to Authentication → URL Configuration
   - Take a screenshot and verify it shows: `com.example.nexbuy://login-callback`
   - Make sure there are no extra spaces or characters

2. **Check Supabase Logs:**
   - Go to Supabase Dashboard → Logs → Auth Logs
   - Look for any errors about redirect URLs

3. **Verify Package Name:**
   - Check `android/app/build.gradle.kts`
   - Should be: `applicationId = "com.example.nexbuy"`
   - Must match the deep link scheme

4. **Test Deep Link Manually:**
   ```bash
   adb shell am start -a android.intent.action.VIEW -d "com.example.nexbuy://login-callback"
   ```
   This should open your app. If it doesn't, the deep link isn't working.

---

## 💡 Important

**The code is already correct!** The issue is 100% in the Supabase dashboard configuration. You MUST add the redirect URL there, or it will never work.

Once you add `com.example.nexbuy://login-callback` to the Redirect URLs in Supabase and save it, the OAuth flow will work correctly.

