# 📦 StockSmart — AI-Powered Inventory Management App

> Smart inventory management for small businesses, powered by Google Gemini AI and Firebase.

---

## 📱 About the App

**StockSmart** is an Android mobile app built with Flutter that helps small business owners manage their inventory intelligently. It replaces manual stock tracking with a real-time, cloud-connected system that uses AI to predict reorder needs before you run out of stock.

### 🎯 Business Problem Solved
Small business owners in the Philippines often track inventory manually using notebooks or spreadsheets. This leads to:
- Unexpected stockouts causing lost sales
- Overstocking that wastes capital
- No visibility on which products are profitable
- No data-driven reorder decisions

### 👥 Target Users
- Small to medium business owners
- Store managers and inventory staff
- Retail shop owners (clothing, groceries, supplies)
- Any business needing affordable Android inventory management

---

## ✨ Key Features

| Feature | Description |
|---|---|
| 🤖 AI Reorder Suggestions | Google Gemini AI analyzes stock levels and sales velocity to suggest when and how much to reorder |
| 🔐 Firebase Authentication | Secure login and registration with email and password |
| ☁️ Cloud Database | Real-time Firestore database — products and transactions synced instantly |
| 📊 Analytics Dashboard | Bar charts and pie charts showing sales by category and top selling products |
| ⚠️ Low Stock Alerts | Automatic warnings when products fall below reorder level |
| 📦 Product Management | Full CRUD — add, edit, delete, and update stock for any product |
| 🔍 Search & Filter | Search products by name or barcode, filter by category |
| 📋 Transaction History | Every stock movement logged automatically with timestamp |
| 📷 Barcode Scanner | Simulated barcode scanner (camera integration ready) |

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Flutter (Dart) | Android mobile app framework |
| Firebase Authentication | User login and registration |
| Cloud Firestore | NoSQL cloud database |
| Google Gemini 1.5 Flash | AI reorder suggestions |
| ChangeNotifier | State management |
| flutter_test | Unit testing |

---

## 🚀 How to Run the App

### Prerequisites
Make sure you have the following installed:
- Flutter SDK (>=3.0.0)
- Android Studio or VS Code
- Android device or emulator (API 21+)
- Node.js (for Firebase CLI)
- Git

### Step 1 — Clone the Repository
```bash
git clone https://github.com/KDAIcebor/StockSmart.git
cd StockSmart
```

### Step 2 — Install Dependencies
```bash
flutter pub get
```

### Step 3 — Firebase Setup
The `firebase_options.dart` file is already included in `lib/`. No additional Firebase setup is needed to run the app.

If you want to connect your own Firebase project:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

### Step 4 — Add Gemini API Key (Required for AI Features)
Open `lib/main.dart` and search for:
```dart
apiKey: 'YOUR_GEMINI_API_KEY_HERE',
```

Replace it with your actual Gemini API key from:
```
https://aistudio.google.com/app/apikey
```

> ⚠️ The API key is required to use the AI Reorder Suggestions feature.

### Step 5 — Connect Android Device
- Enable **Developer Options** on your Android phone
- Turn on **USB Debugging**
- Connect via USB

Or start an Android emulator in Android Studio.

### Step 6 — Run the App
```bash
flutter run
```

Select your Android device when prompted.

---

## 🤖 How to Showcase the AI Feature

Follow these steps during the demo to show the Gemini AI working live:

### Step 1 — Register or Login
- Open the app on your Android device
- Register with your business name and email
- Or login with existing credentials

### Step 2 — Add Products with Low Stock
To trigger AI suggestions, add at least one product where quantity is BELOW the reorder level:

1. Tap **"+ Add Product"** on the Dashboard or Products screen
2. Fill in the product details:
   - **Product Name:** e.g. Evisu Pants
   - **Category:** Clothing
   - **Quantity:** `30` ← set this LOW
   - **Reorder Level:** `50` ← set this HIGHER than quantity
   - **Cost Price:** 1500
   - **Selling Price:** 2000
   - **Barcode:** any number
3. Tap **Save Product**

> The product is now "low stock" because quantity (30) is below reorder level (50).

### Step 3 — View AI Reorder Suggestions
1. Go back to the **Dashboard**
2. Scroll down to the **"AI Reorder Suggestions"** section
3. Wait 2-3 seconds for Gemini AI to analyze
4. You will see:
   - **MEDIUM** or **HIGH** urgency badge
   - Product name that needs restocking
   - AI-generated reason for the suggestion
   - Suggested order quantity

### Step 4 — Refresh AI Analysis
Tap the **refresh icon** (↻) on the AI Insights card to trigger a new Gemini API call with updated data.

### Step 5 — Add More Products for Better AI Results
Add 3-5 products with different stock levels and reorder points. The more data, the richer the AI analysis:

| Product | Quantity | Reorder Level | Expected AI Result |
|---|---|---|---|
| Product A | 5 | 20 | HIGH urgency |
| Product B | 15 | 30 | HIGH urgency |
| Product C | 45 | 50 | MEDIUM urgency |
| Product D | 100 | 20 | No suggestion |

### What the AI Does
StockSmart sends this data to Google Gemini 1.5 Flash:
```
Product: Evisu Pants | quantity=30 | reorderLevel=50 | totalSold=0 | category=Clothing
```

Gemini responds with structured analysis:
```
PRODUCT: Evisu Pants | URGENCY: MEDIUM | DAYS: 999 | ORDER: 50 | REASON: Below reorder level
```

The app parses this response and displays it as a visual suggestion card.

---

## 🗄️ Database Structure (Firestore)

```
users/
  └── {userId}/
        email: string
        businessName: string
        createdAt: timestamp

products/
  └── {productId}/
        userId: string
        name: string
        category: string
        quantity: int
        reorderLevel: int
        price: double
        cost: double
        barcode: string
        totalSold: int
        createdAt: timestamp
        lastUpdated: timestamp

transactions/
  └── {transactionId}/
        productId: string
        userId: string
        type: string (stock_in | stock_out | adjustment)
        quantity: int
        notes: string
        timestamp: timestamp
```

---

## 🧪 Running Unit Tests

```bash
flutter test
```

Expected output:
```
00:06 +3: All tests passed!
```

### What the Tests Check
| Test | What It Verifies |
|---|---|
| isLowStock detection | Product with quantity < reorderLevel returns isLowStock = true |
| inventoryValue calculation | quantity × cost = correct inventory value |
| profit calculation | (price - cost) × totalSold = correct profit |

---

## 📁 Project Structure

```
stock_smart/
├── lib/
│   ├── main.dart              # All screens, models, and state management
│   └── firebase_options.dart  # Firebase configuration (auto-generated)
├── test/
│   └── widget_test.dart       # Unit tests
├── android/                   # Android build files
├── pubspec.yaml               # Dependencies
└── README.md                  # This file
```

---

## 📦 Building the APK

```bash
flutter build apk --release
```

Output location:
```
build/app/outputs/flutter-apk/app-release.apk
```
