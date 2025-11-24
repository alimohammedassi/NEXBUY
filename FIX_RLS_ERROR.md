# 🔧 إصلاح خطأ RLS Policy

## ❌ الخطأ:
```
PostgrestException: new row violates row-level security policy for table "products"
```

## 🔍 السبب:
الـ RLS Policy تتحقق من وجود المستخدم في جدول `public.users` وأن `is_admin = TRUE`، لكن:
1. المستخدم قد لا يكون موجوداً في جدول `public.users`
2. الـ policy قد تحتاج إلى function مع `SECURITY DEFINER`

---

## ✅ الحل السريع:

### الخطوة 1: تشغيل ملف الإصلاح

1. افتح Supabase SQL Editor
2. انسخ محتوى ملف `fix_rls_policies.sql`
3. الصقه في SQL Editor
4. اضغط **Run**

### الخطوة 2: التحقق من المستخدم الأدمن

بعد تشغيل الـ fix، تحقق من أن المستخدم موجود ومضبوط كأدمن:

```sql
-- تحقق من المستخدم
SELECT 
  u.id,
  u.email,
  pu.is_admin,
  pu.name
FROM auth.users u
LEFT JOIN public.users pu ON u.id = pu.id
WHERE u.email = 'aliabouali2005@gmail.com';
```

إذا كان `is_admin = NULL` أو `FALSE`، شغّل:

```sql
-- تعيين الأدمن
INSERT INTO public.users (id, name, is_admin)
SELECT 
  id,
  COALESCE(raw_user_meta_data->>'name', email),
  TRUE
FROM auth.users
WHERE email = 'aliabouali2005@gmail.com'
ON CONFLICT (id) 
DO UPDATE SET is_admin = TRUE;
```

### الخطوة 3: إعادة المحاولة

بعد تشغيل الإصلاح:
1. أعد تسجيل الدخول في التطبيق
2. حاول إضافة منتج من Admin Dashboard
3. يجب أن يعمل الآن ✅

---

## 🔍 التحقق من المشكلة:

### تحقق 1: هل المستخدم موجود في public.users؟
```sql
SELECT * FROM public.users WHERE id = auth.uid();
```

### تحقق 2: هل is_admin = TRUE؟
```sql
SELECT is_admin FROM public.users WHERE id = auth.uid();
```

### تحقق 3: ما هي الـ policies الموجودة؟
```sql
SELECT * FROM pg_policies WHERE tablename = 'products';
```

---

## 🎯 ما يقوم به ملف الإصلاح:

1. ✅ ينشئ function `is_admin()` مع `SECURITY DEFINER`
2. ✅ يعيد إنشاء الـ policies باستخدام الـ function
3. ✅ ينشئ trigger لإنشاء سجل في `public.users` تلقائياً عند التسجيل
4. ✅ يضبط الأدمن تلقائياً للمستخدم `aliabouali2005@gmail.com`

---

## 📝 ملاحظات:

- بعد تشغيل الإصلاح، يجب إعادة تسجيل الدخول
- الـ trigger سينشئ سجلاً تلقائياً للمستخدمين الجدد
- الأدمن يتم ضبطه تلقائياً للمستخدم المحدد

---

## 🆘 إذا استمرت المشكلة:

1. تحقق من Console في التطبيق للأخطاء
2. تحقق من Supabase Logs
3. تأكد من أنك مسجل دخول بحساب الأدمن
4. جرب حذف وإعادة إنشاء الـ policies يدوياً

