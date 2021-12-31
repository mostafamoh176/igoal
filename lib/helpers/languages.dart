import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController{
  static change(var param1, var param2){
    Get.updateLocale(Locale(param1, param2));
  }
}

class StaticStrings extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en": en,
    "ar": ar,
  };

  final Map<String, String> en = {
    "Settings": "Settings",
    "ChooseTheLanguage": "ChooseTheLanguage",
    "Next": "Next",
    "Forgot password ?": "Forgot password ?",
    "Finish": "Finish",
    "Skip": "Skip",
    "Full Name": "Full Name",
    "Workshop Name": "Workshop Name",
    "Workshop E-mail": "Workshop E-mail",
    "E-mail": "E-mail",
    "Mobile number": "Mobile number",
    "Password": "Password",
    "New password": "New password",
    "Workshop": "Workshop ",
    "Client": "Client",
    "Create an account": "Create an account",
    "Log in instead": "Log in instead",
    "Facilitating agreements between clients and workshops": "Facilitating agreements between clients and workshops",
    "The client can follow the maintenance process from his home": "The client can follow the maintenance process from his home",
    "Receipt and delivery of the order without meeting": "Receipt and delivery of the order without meeting",
    "Workshop Account": "Workshop Account",
    "Sponsor’s name": "Sponsor’s name",
    "Department": "Department",
    "Location": "Location",
    "Facility": "Facility",
    "Commercial register": "Commercial register",
    "Electronic payments account number": "Electronic payments account number",
    "Upload a picture": "Upload a picture",
    "Add pictures of your places with availability": "Add pictures of your places with availability",
    "Save": "Save",
    "Skip for later": "Skip for later",
    "Log in to your account": "Log in to your account",
    "E-mail or mobile number": "E-mail or mobile number",
    "mobile_number": "Mobile number",
    "Login": "Login",
    "Send a code to my e-mail": "Send a code to my e-mail",
    "Send verification code": "Send verification code",
    "We will send a verification code to your mobile number.": "We will send a verification code to your mobile number.",
    "Confirm": "Confirm",
    "Change mobile number": "Change mobile number",
    "We’ve sent a code to a mobile number ending on **11": "We’ve sent a code to a mobile number ending on **11",
    "Confirm password": "Confirm password",
    "Create a new password": "Create a new password",
    "Message": "Message",
    "Orders": "Orders",
    "Profile": "Profile",
    "Home": "Home",
    "Welcome, Workshop!": "Welcome, Workshop",
    "New service": "New service",
    "Having a new announcement ?": "Having a new announcement ?",
    "Share it": " Share it",
    "View all": "View all",
    "Your announcements": "Your announcements",
    "New services request": "New services request",
    "Clients’s Questions": "Clients's Questions",
    "Client question": "Client question",
    "I have a question and I need answer ...": "I have a question and I need answer ...",
    "Client Name": "Client Name",
    "Sep 20, 12:00 PM": "Sep 20, 12:00 PM",
    "+123456788": "+123456788",
    "Toyota Land Cruiser, white": "Toyota Land Cruiser, white",
    "glass repair": "glass repair",
    "Client’s comment here": "Client’s comment here",
    "News of our workshop": "News of our workshop",
    "Hello Clients! We are glad to inform you..": "Hello Clients! We are glad to inform you..",
    "Workshop offers": "Workshop offers",
    "Filter": "Filter",
    "Sort": "Sort",
    "200": "200'\$",
    "has sent a payment of": "has sent a payment of",
    "21/10/2020 | 10:45 AM": "21/10/2020 | 10:45 AM",
    "New Announcement": "New Announcement",
    "Add a new announcement": "Add a new announcement",
    "Announcement header": "Announcement header",
    "Announcement text": "Announcement text",
    "Upload up to 6 pictures": "Upload up to 6 pictures",
    "Post": "Post",
    "Offer name": "Offer name",
    "№ 123457870": "№ 123457870",
    "Toyota Land Cruiser": "Toyota Land Cruiser",
    "Process: 10%": "Process: 10%",
    "Process:": "Process: ",
    "24 July 2020": "24 July 2020",
    "Order placed": "Order placed",
    "25 July 2020": "25 July 2020",
    "Estimate completion date": "Estimate completion date",
    "Send a offer": "Send a offer",
    "Step 1": "Step 1",
    "Sep 20,2020 | 12:00 PM": "Sep 20,2020 | 12:00 PM",
    "Step 2": "Step 2",
    "Step 3": "Step 3",
    "In progress": "In progress",
    "Workshop name": "Workshop name",
    "Sponsor": "Sponsor",
    "India": "India",
    "Edit Profile": "Edit Profile",
    "Payments": "Payments",
    "FAQ": "FAQ",
    "Log out": "Log out",
    "Deactivate account": "Deactivate account",
    "client@mail": "client@mail",
    "+123456778": "+123456778",
    "Order Name": "Order Name",
    "Your orders": "Your orders",
    "№1245678": "№1245678",
    "Send a message": "Send a message",
    "Search for messages and users": "Search for messages and users",
    "Hello Client! Your order is": "Hello Client! Your order is... ",
    "11:34 AM": "11:34 AM",
    "Offer Name": "Offer Name",
    "4.5/5": "4.5/5",
    "1 km away": "1 km away",
    "Information": "Information",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "Pictures": "Pictures",
    "Request a services": "Request a services",
    "Client name": "Client name",
    "Car information": "Car information",
    "Need your car fixed": "Need your car fixed",
    "Car Information": "Car Information",
    "Enter your car information here": "Enter your car information here",
    "Car company": "Car company",
    "Honda": "Honda",
    "Mercedes": "Mercedes",
    "Car model": "Car model",
    "Car Color": "Car Color",
    "2020": "2020",
    "2021": "2021",
    "Red": "Red",
    "White": "White",
    "Car transmission": "Car transmission",
    "Setting": "Setting",
    "Notification settings": "Notification settings",
    "E-mail notification": "E-mail notification",
    "Accepted request": "Accepted request",
    "Declined request": "Declined request",
    "Profile settings": "Profile settings",
    "Language": "Language",
    "Arabic": "Arabic",
    "English": "English",
    "Select language": "Select language",
    "Preferred payment method": "Preferred payment method",
    "VISA *0911": "VISA *0911",
    "Add Another payment method": "Add Another payment method",
    "Recent payment": "Recent payment",
    "21/10/2020": "21/10/2020",
    "123457870": "123457870",
    "Add a payment method": "Add a payment method",
    "Please choose payment method": "Please choose payment method",
    "Credit / Debit card": "Credit / Debit card",
    "Apply App": "Apply App",
    "Mada card": "Mada card",
    "Add a credit card": "Add a credit card",
    "Please fill your information below": "Please fill your information below",
    "Cardholder Name": "Cardholder Name",
    "Add": "Add",
    "Card Number": "Card Number",
    "Expiration Data": "Expiration Data",
    "CVC": "CVC",
    "Ask a question": "Ask a question",
    "Ask us a question or report an issue here": "Ask us a question or report an issue here",
    "Enter your message": "Enter your message",
    "Send": "Send",
    "Welcome,Client": "Welcome, Client !",
    "Having a new question?": "Having a new question ?",
    "Ask it": "  Ask it",
    "Announcements": "Announcements",
    "Latest Offers": "Latest Offers",
    "4.5": "4.5",
    "Service estimate price": "Service estimate price",
    "150": "150\$",
    "Estimate completion time": "Estimate completion time",
    "5 days": "5 days",
    "Learn more": "Learn more",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugia": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugia",
    "Announcement Header": "Announcement Header",
    "More information": "More information",
    "Request a service": "Request a service",
    "Add a description": "Add a description",
    "Free comment": "Free comment",
    "Faults": "Faults",
    "Payment method": "Payment method",
    "Car color": "Car color",
    "Maintenance department": "Maintenance department",
    "Order now": "Order now",
    "Fault": "Fault",
    "Black": "Black",
    "A": "A",
    "B": "B",
    "cash": "cash",
    "credit card": "credit card",
    "Filters": "Filters",
    "Price": "Price",
    "Show result": "Show result",
    "Option 1": "Option 1",
    "Option 2": "Option 2",
    "Option 3": "Option 3",
    "Up to 100": "Up to 100\$",
    "100 to 200": "100\$ to 200\$",
    "200 to 300": "200\$ to 300\$",
    "Send an offer": "Send an offer",
    "Notifications": "Notifications",
    "please_enter_valid_email_address": "please enter a valid email address",
    "the_password_must_be_identical": "The password must be identical",
    "the_password_must_be_7_characters_or_more": "The password must be 7 characters or more",
    "please_enter_your_full_name": "please enter your full name",
    "please_wait": "please wait..",
    "ok": "OK",
    "please_enter_correct_phone_number": "please enter a correct phone number",
    "Email": "Email"
  };

  final Map<String, String> ar = {
    "Settings": "الإعدادات",
    "ChooseTheLanguage": "اختار اللغة",
    "Next": "التالي",
    "Forgot password ?": "نسيت كلمة المرور ؟",
    "Finish": "إنهاء",
    "Skip": "تخطي",
    "Full Name": "الاسم كامل",
    "Workshop Name": "اسم الورشة",
    "Workshop E-mail": "البريد الالكتروني للورشة",
    "E-mail": "البريد الالكتروني",
    "Mobile number": "رقم الجوال",
    "Password": "كلمة المرور",
    "Workshop": "الورشة ",
    "Client": "العميل",
    "Create an account": "أنشئ حساب",
    "Log in instead": "قم بتسجيل الدخول بدلا من ذلك",
    "Facilitating agreements between clients and workshops": "تسهيل الاتفاقيات بين العملاء وورش العمل",
    "The client can follow the maintenance process from his home": "يمكن للعميل متابعة عملية الصيانة من منزله",
    "Receipt and delivery of the order without meeting": "استلام وتسليم الطلب بدون لقاء",
    "Workshop Account": "حساب الورشة",
    "Sponsor’s name": "اسم الراعي",
    "Department": "القسم",
    "Location": "الموقع",
    "Facility": "المنشأة",
    "Commercial register": "تسجيل تجاري",
    "Electronic payments account number": "رقم حساب المدفوعات الإلكترونية",
    "Upload a picture": "تحميل صورة",
    "Add pictures of your places with availability": "أضف صورًا لأماكنك مع توافرها",
    "Save": "حفظ",
    "Skip for later": "تخطي لوقت لاحق",
    "Log in to your account": "تسجيل الدخول إلى حسابك",
    "E-mail or mobile number": "البريد الالكتروني أو رقم الجوال",
    "mobile_number": "رقم الجوال",
    "Login": "تسجيل الدخول",
    "Send a code to my e-mail": "ارسل رمز التحقق الى البريد الالكتروني",
    "Send verification code": "أرسل رمز التحقق ",
    "We will send a verification code to your mobile number.": "سوف نرسل رمز التحقق إلى رقم هاتفك المحمول.",
    "Confirm": "تحقق",
    "Change mobile number": "تغيير رقم الجوال",
    "We’ve sent a code to a mobile number ending on **11": "لقد أرسلنا رمزًا إلى رقم جوال ينتهي بـ ** 11",
    "Confirm password": "تأكيد كلمة المرور",
    "Create a new password": "أنشئ كلمة مرور جديدة",
    "Message": "الرسائل",
    "Orders": "الطلبات",
    "Profile": "الملف الشخصي",
    "Home": "الرئيسية",
    "Welcome, Workshop!": "مرحبا بكم في ورشة العمل !",
    "New service": "خدمة جديدة",
    "Having a new announcement ?": "هل لديك إعلان جديد ؟",
    "Share it": " شاركها ",
    "View all": "عرض الكل",
    "Your announcements": "إعلاناتكم",
    "New services request": "طلب خدمات جديدة",
    "Clients’s Questions": "أسئلة العميل",
    "Client question": "سؤال العميل",
    "I have a question and I need answer ...": "لدي سؤال وأحتاج إجابة ...  ",
    "Client Name": "اسم العميل",
    "Sep 20, 12:00 PM": "20 سبتمبر ، 12:00 مساءً",
    "+123456788": "+123456788",
    "Toyota Land Cruiser, white": "تويوتا لاند كروزر، ابيض",
    "glass repair": "إصلاح الزجاج",
    "Client’s comment here": "تعليق العميل هنا",
    "News of our workshop": "أخبار الورشة لدينا",
    "Hello Clients! We are glad to inform you..": "مرحبا أيها العملاء! يسعدنا إبلاغكم .. ",
    "Workshop offers": "عروض الورشة",
    "Filter": "منقي",
    "Sort": "فرز",
    "200": "200\$",
    "has sent a payment of": "أرسل دفعة بقيمة",
    "21/10/2020 | 10:45 AM": "21/10/2020 | 10:45 صباحًا",
    "New Announcement": "إعلان جديد",
    "Add a new announcement": "أضف إعلان جديد",
    "Announcement header": "موضوع الإعلان",
    "Announcement text": "نص الإعلان",
    "Upload up to 6 pictures": "تحميل ما يصل إلى 6 صور",
    "Post": "بريد",
    "Offer name": "اسم العرض",
    "№ 123457870": "№ 123457870",
    "Toyota Land Cruiser": "تويوتا لاند كروزر",
    "Process: 10%": "العملية: 10٪",
    "Process:": "معالجة: ",
    "24 July 2020": "24 يوليو 2020",
    "Order placed": "تم الطلب",
    "25 July 2020": "25 يوليو 2020",
    "Estimate completion date": "تقدير تاريخ الانتهاء",
    "Send a offer": "أرسل عرضا",
    "Step 1": "الخطوة 1",
    "Sep 20,2020 | 12:00 PM": "20 سبتمبر 2020 | 12:00 مساء",
    "Step 2": "الخطوة 2",
    "Step 3": "الخطوة 3",
    "In progress": "في تقدم",
    "Workshop name": "اسم الورشة",
    "Sponsor": "كفيل",
    "India": "الهند",
    "Edit Profile": "تعديل الملف الشخصي",
    "Payments": "المدفوعات",
    "FAQ": "التعليمات",
    "Log out": "تسجيل خروج",
    "Deactivate account": "تعطيل الحساب",
    "client@mail": "client@mail",
    "+123456778": "+123456778",
    "Order Name": "اسم الطلب",
    "Your orders": "طلباتك",
    "№1245678": "№1245678",
    "Send a message": "أرسل الرسالة",
    "Offer name": "اسم العرض",
    "Search for messages and users": "ابحث عن الرسائل والمستخدمين",
    "Hello Client! Your order is": "مرحبًا بالعميل ! طلبك هو ...   ",
    "11:34 AM": "11:34 صباحًا",
    "Offer Name": "اسم العرض",
    "4.5/5": "4.5/5",
    "1 km away": "1 كم",
    "Information": "معلومات",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "Pictures": "الصور",
    "Request a services": "طلب خدمة",
    "Client name": "اسم العميل",
    "Car information": "معلومات السيارة",
    "Need your car fixed": "تحتاج سيارتك ثابتة",
    "Car Information": "معلومات السيارة",
    "Enter your car information here": "أدخل معلومات سيارتك هنا",
    "Car company": "شركة السيارات",
    "Honda": "هوندا",
    "Mercedes": "مرسيدس",
    "Car model": "طراز السيارة",
    "Car Color": "لون السيارة",
    "2020": "2020",
    "2021": "2021",
    "Red": "أحمر",
    "White": "أبيض",
    "Car transmission": "نقل السيارة",
    "Setting": "الاعدادات",
    "Notification settings": "اشعارات الاعدادات",
    "E-mail notification": "إشعارات البريد الإلكتروني",
    "Accepted request": "طلب مقبول",
    "Declined request": "طلب مرفوض",
    "Profile settings": "إعدادات الملف الشخصي",
    "Language": "اللغة",
    "Arabic": "عربي",
    "English": "English",
    "Select language": "اختر اللغة",
    "Preferred payment method": "يفضل طريقة الدفع",
    "VISA *0911": "فيزا * 0911",
    "Add Another payment method": "أضف طريقة دفع أخرى",
    "Recent payment": "دفعة حديثة",
    "21/10/2020": "21/10/2020",
    "123457870": "123457870",
    "Add a payment method": "إضافة طريقة الدفع",
    "Please choose payment method": "الرجاء اختيار طريقة الدفع",
    "Credit / Debit card": "بطاقة الائتمان / الخصم",
    "Apply App": "تطبيق التطبيق",
    "Mada card": "بطاقة مدى",
    "Add a credit card": "أضف بطاقة ائتمان",
    "Please fill your information below": "يرجى ملء المعلومات الخاصة بك أدناه",
    "Cardholder Name": "إسم صاحب البطاقة",
    "Add": "إضافة",
    "Card Number": "رقم البطاقة",
    "Expiration Data": "تاريخ الإنتهاء",
    "CVC": "CVC",
    "Ask a question": "طرح سؤال",
    "Ask us a question or report an issue here": "اسألنا سؤالاً أو أبلغ عن مشكلة هنا",
    "Enter your message": "أدخل رسالتك",
    "Send": "إرسال",
    "Welcome,Client": "مرحبا بك العميل !",
    "Having a new question?": "هل لديك سؤال جديد؟",
    "Ask it": "  إسأل",
    "Announcements": "الإعلانات",
    "Latest Offers": "آخر العروض",
    "4.5": "4.5",
    "Service estimate price": "سعر تقدير الخدمة",
    "150": "150\$",
    "Estimate completion time": "تقدير وقت الانتهاء",
    "5 days": "5 أيام",
    "Learn more": "إعرف أكثر",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugia": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugia",
    "Announcement Header": "عنوان الإعلان",
    "More information": "مزيد من المعلومات",
    "Request a service": "اطلب خدمة",
    "Add a description": "إضافة وصف",
    "Free comment": "تعليق حر",
    "Faults": "نقاط الضعف",
    "Payment method": "طريقة الدفع او السداد",
    "Car color": "لون السيارة",
    "Maintenance department": "قسم الصيانة",
    "Order now": "اطلب الآن",
    "Fault": "خطأ",
    "Black": "أسود",
    "A": "أ",
    "B": "ب",
    "cash": "نقد",
    "credit card": "بطاقة ائتمان",
    "Filters": "المرشحات",
    "Price": "السعر",
    "Show result": "أظهر النتيجة",
    "Option 1": "اختيار 1",
    "Option 2": "اختيار 2",
    "Option 3": "اختيار 3",
    "Up to 100": "ما يصل إلى 100\$",
    // "100 to 200": "\من 100$ الى 200$",
    // "200 to 300": "من 200$ الى 300$",
    "New password": "كلمة المرور الجديدة",
    "Send an offer": "أرسل عرض",
    "Notifications": "الاشعارات",
    "please_enter_valid_email_address": "الرجاء ادخال بريد الكتروني صحيح",
    "the_password_must_be_identical": "يجب ان يكون الرقم السري متطابق",
    "the_password_must_be_7_characters_or_more": "يجب ان يكون الرقم السري 7 أحرف أو أكثر",
    "please_enter_your_full_name": "الرجاء ادخال ألاسم كاملا",
    "please_wait": "الرجاء الانتظار..",
    "ok": "حسنا",
    "please_enter_correct_phone_number": "الرجاء إدخال رقم الهاتف الصحيح",
    "Email": "البريد الإلكتروني"
  };
}