# Rumah UMKM App - Struktur Project

## 📁 Struktur Folder (Professional Architecture)

```
lib/
├── main.dart                           # Entry point aplikasi dengan Provider setup
├── routes/
│   └── app_router.dart                 # Routing configuration (GoRouter) + Route Guards
├── screens/                            # Semua halaman aplikasi
│   ├── home/
│   │   └── home_screen.dart            # Halaman utama dengan grid produk + Search + Cart Badge
│   ├── product/
│   │   └── detail_screen.dart          # Detail produk dengan info penjual
│   ├── cart/
│   │   └── cart_screen.dart            # Keranjang belanja (protected route)
│   ├── auth/
│   │   ├── login_screen.dart           # Login dengan email & password
│   │   ├── register_screen.dart        # Registrasi user baru
│   │   └── open_store_screen.dart      # Form buka toko (Customer → Seller)
│   ├── profile/
│   │   └── profile_screen.dart         # Profil user dengan data real (protected)
│   ├── orders/
│   │   └── orders_screen.dart          # Riwayat pesanan (protected)
│   ├── store/
│   │   └── store_screen.dart           # Manajemen toko (seller only)
│   ├── settings/
│   │   └── settings_screen.dart        # Pengaturan aplikasi (protected)
│   ├── about/
│   │   ├── about_screen.dart           # Tentang Kami
│   │   ├── how_to_shop_screen.dart     # Cara Belanja
│   │   └── partners_screen.dart        # Daftar Mitra UMKM
│   └── help/
│       └── help_screen.dart            # Bantuan & FAQ
├── widgets/                            # Widget reusable
│   └── .gitkeep                        # Placeholder untuk widget custom
├── models/                             # Data models
│   └── user_model.dart                 # Model user (Guest/Customer/Seller)
└── utils/                              # Helper functions & Services
    ├── auth_service.dart               # Authentication state management
    └── cart_service.dart               # Shopping cart state management
```

## 🛣️ Routing Structure

Aplikasi menggunakan **go_router** dengan **Route Guards** untuk proteksi:

### Public Routes (Accessible by Guest)
- `/` - Halaman utama (Home)
- `/detail` - Detail produk (dengan state passing)
- `/tentang` - Tentang Kami
- `/cara-belanja` - Panduan belanja
- `/mitra` - Daftar mitra UMKM
- `/bantuan` - FAQ & Bantuan
- `/login` - Login screen
- `/register` - Register screen

### Protected Routes (Login Required)
- `/keranjang` - Keranjang belanja → Redirect to `/login` if guest
- `/profil` - Profile user → Redirect to `/login` if guest
- `/pesanan` - Riwayat pesanan → Redirect to `/login` if guest
- `/pengaturan` - Settings → Redirect to `/login` if guest

### Customer Routes
- `/buka-toko` - Form buka toko (Customer only) → Redirect to `/toko` if already seller

### Seller Routes
- `/toko` - Manajemen toko (Seller only) → Redirect to `/profil` if not seller

## ✅ Fitur Yang Sudah Ada

### 1. **Authentication System** 🔐
   - **3 User Roles:**
     - 👋 **Guest** - Browse produk (tidak bisa checkout)
     - 👤 **Customer** - Bisa belanja & buka toko
     - 🏪 **Seller** - Bisa berjualan & kelola toko
   - **Login/Register:**
     - Email & password validation
     - Persist auth state (SharedPreferences)
     - Auto-login on app restart
   - **Upgrade Flow:**
     - Customer → Seller via "Buka Toko" form
     - Input: nama toko, kategori, deskripsi
     - Success dialog → redirect ke beranda
   - **Route Guards:**
     - Guest tidak bisa akses keranjang/profil → redirect ke login
     - Non-seller tidak bisa akses halaman toko
     - Seller tidak bisa akses form "Buka Toko" lagi

### 2. **Home Screen** (Halaman Utama)
   - **Two-Tier Header:**
     - Search bar dengan icon search
     - Cart badge dengan counter real-time (from CartService)
     - Profile dropdown (kondisional):
       - Guest: "Masuk/Daftar" button
       - Customer: Menu "Profil", "Pesanan", "Buka Toko", "Pengaturan", "Keluar"
       - Seller: Menu "Profil", "Pesanan", "Toko Saya", "Pengaturan", "Keluar"
   - Grid produk dengan 26 dummy products
   - 13 kategori UMKM lokal (filter kategori)
   - Responsive (mobile & desktop)
   - Banner promo
   - Footer dengan navigasi

### 3. **Detail Screen**
   - Detail lengkap produk
   - Informasi penjual
   - Tombol beli & tambah keranjang

### 4. **Cart Screen** (Protected)
   - Daftar item di keranjang (dari CartService)
   - Update quantity
   - Remove item
   - Perhitungan total
   - Checkout button

### 5. **Profile Screen** (Protected)
   - **Data Real dari User:**
     - Nama lengkap
     - Email
     - No. handphone
     - Role badge (Guest/Customer/Seller)
   - **Seller Specific:**
     - Nama toko
     - Kategori toko
   - **Statistik:**
     - Jumlah pesanan (Customer/Seller)
     - Produk dijual (Seller only)

### 6. **Store Screen** (Seller Only)
   - **Header dengan data real:**
     - Nama toko dari user
     - Kategori toko dari user
   - Statistik toko (penjualan, produk aktif, rating)
   - List produk toko (dummy data)
   - Tombol tambah produk
   - Non-seller redirect ke halaman "Buka Toko"

### 7. **Orders Screen** (Protected)
   - Riwayat pesanan customer
   - Status tracking
   - Detail order

### 8. **Settings Screen** (Protected)
   - Pengaturan notifikasi
   - Bahasa aplikasi
   - Theme mode

### 9. **About Screens**
   - Tentang Kami (visi, misi, statistik)
   - Cara Belanja (step-by-step guide)
   - Daftar Mitra (list mitra aktif)

### 10. **Help Screen**
   - FAQ dengan ExpansionTile
   - Kontak support

### 11. **State Management** 🎯
   - **Provider** untuk dependency injection
   - **AuthService (ChangeNotifier):**
     - `login(email, password)` - Login user
     - `register(name, email, phone, password)` - Register baru
     - `upgradeToSeller(storeName, storeCategory)` - Buka toko
     - `logout()` - Keluar & reset ke Guest
     - `currentUser` - UserModel saat ini
     - Persist ke SharedPreferences
   - **CartService (ChangeNotifier):**
     - `addItem()` - Tambah produk ke cart
     - `updateQuantity()` - Update jumlah item
     - `removeItem()` - Hapus item
     - `clear()` - Kosongkan cart
     - `itemCount` - Total item di cart (untuk badge)
     - `totalPrice` - Total harga
     - Persist ke SharedPreferences

## 🚀 Saran Kelanjutan

### ✅ Fase 1: Authentication & User Management (SELESAI)
- [x] Login/Register screen
- [x] Profile screen dengan data real
- [x] Role-based access (Guest/Customer/Seller)
- [x] Route guards & protected routes
- [x] State persistence (SharedPreferences)
- [ ] Firebase Authentication integration (Opsional)
- [ ] Password reset/forgot password
- [ ] Email verification

### Fase 2: Backend Integration
- [ ] Ganti dummy data dengan API/Database
- [ ] Firebase Firestore atau Supabase
- [ ] Real-time product updates
- [ ] Image upload untuk produk
- [ ] User profile image upload
- [ ] Store cover image

### Fase 3: Enhanced Shopping Features
- [ ] Real search functionality (saat ini hanya UI)
- [ ] Product reviews & ratings
- [ ] Wishlist/Favorite products
- [ ] Product variants (size, color, dll)
- [ ] Stock management real-time
- [ ] Product recommendations

### Fase 4: Seller Dashboard
- [ ] Analytics dashboard untuk penjual
- [ ] Laporan penjualan (harian/bulanan)
- [ ] Inventory management
- [ ] Order management untuk seller
- [ ] Add/Edit/Delete products
- [ ] Bulk upload products

### Fase 5: Payment & Order System
- [ ] Payment gateway integration (Midtrans, Xendit)
- [ ] Multiple payment methods
- [ ] Order tracking real-time
- [ ] Shipping integration (JNE, J&T, dll)
- [ ] Invoice generation
- [ ] Refund/Return system

### Fase 6: Communication & Engagement
- [ ] Chat dengan penjual
- [ ] Push notifications (new order, promo, dll)
- [ ] Email notifications
- [ ] Voucher & promo system
- [ ] Loyalty program/poin
- [ ] Flash sale feature

### Fase 7: Multi-Platform Optimization
- [ ] Responsive design refinement
- [ ] Desktop app optimization (Windows/Mac/Linux)
- [ ] Mobile app optimization
- [ ] PWA (Progressive Web App)
- [ ] Dark mode theme
- [ ] Internationalization (multi-language)

## 📱 Platform Support

Aplikasi ini didesain untuk **cross-platform**:

- ✅ **Web** (Chrome, Firefox, Safari)
- ✅ **Mobile** (Android, iOS)
- ✅ **Desktop** (Windows, macOS, Linux)

## 🎨 Design Principles

- **Material Design 3** untuk konsistensi UI
- **Responsive Layout** dengan LayoutBuilder
- **Poppins Font** untuk readability
- **Green color scheme** (tema UMKM/pertanian)

## 🔧 Tech Stack

- **Flutter 3.x** - Cross-platform framework
- **Dart 3.x** - Programming language
- **go_router ^12.0.0** - Declarative routing with route guards
- **provider ^6.1.1** - State management (ChangeNotifier pattern)
- **shared_preferences ^2.2.2** - Local storage (auth & cart persistence)
- **google_fonts ^6.1.0** - Custom fonts (Poppins)
- **intl ^0.18.0** - Internationalization & formatting (Rupiah)

## 🏗️ Architecture Patterns

### State Management
- **Provider Pattern** untuk global state (AuthService, CartService)
- **StatefulWidget** untuk local state (form input, filters)
- **ChangeNotifier** untuk reactive state updates

### Design Patterns
- **Repository Pattern** (ready untuk backend integration)
- **Singleton Pattern** untuk services
- **Observer Pattern** via Provider/ChangeNotifier
- **Strategy Pattern** untuk route guards

### Code Organization
- **Feature-based structure** (screens by feature)
- **Separation of concerns** (models, utils, screens)
- **Single Responsibility Principle**
- **Dependency Injection** via Provider

## 📊 Data Models

### UserModel
```dart
class UserModel {
  String id, name, email, phone;
  String role; // 'guest', 'customer', 'seller'
  String? storeName, storeCategory;
  
  // Getters
  bool get isGuest => role == 'guest';
  bool get isCustomer => role == 'customer';
  bool get isSeller => role == 'seller';
}
```

### CartItem
```dart
class CartItem {
  String productId, productName;
  int price, quantity;
  String imageUrl;
  String sellerId, sellerName;
}
```

## 🔐 Authentication Flow

```
┌─────────┐
│  Guest  │ (Default)
└────┬────┘
     │
     ├─ Browse Products ✓
     ├─ View Details ✓
     ├─ Add to Cart ✗ (Redirect to Login)
     └─ Checkout ✗ (Redirect to Login)
     
     │ Register/Login
     ▼
┌──────────┐
│ Customer │
└─────┬────┘
      │
      ├─ All Guest Actions ✓
      ├─ Add to Cart ✓
      ├─ Checkout ✓
      └─ View Profile ✓
      
      │ Open Store (Buka Toko)
      ▼
┌─────────┐
│ Seller  │
└────┬────┘
     │
     ├─ All Customer Actions ✓
     ├─ Manage Store ✓
     ├─ Add Products ✓
     └─ View Analytics ✓
```

## 📝 Naming Convention

- Screens: `*_screen.dart` (e.g., `home_screen.dart`, `login_screen.dart`)
- Widgets: `*_widget.dart` (e.g., `footer_widget.dart`)
- Models: `*_model.dart` (e.g., `user_model.dart`)
- Services: `*_service.dart` (e.g., `auth_service.dart`, `cart_service.dart`)
- Class: PascalCase (e.g., `HomeScreen`, `AuthService`)
- Variables: camelCase (e.g., `productList`, `currentUser`)
- Constants: UPPER_SNAKE_CASE (e.g., `API_KEY`, `MAX_ITEMS`)
- Private: _prefixed (e.g., `_items`, `_handleSubmit()`)

## 🎯 Best Practices Applied

1. ✅ Separation of concerns (screens, widgets, models, utils)
2. ✅ Single Responsibility Principle
3. ✅ Reusable components
4. ✅ Clean architecture
5. ✅ Consistent naming conventions
6. ✅ Proper folder structure
7. ✅ Centralized route management with guards
8. ✅ State management (Provider + ChangeNotifier)
9. ✅ Data persistence (SharedPreferences)
10. ✅ Error handling & validation
11. ✅ Responsive design
12. ✅ Type safety (Dart 3.x null safety)

## 📊 File Statistics

- **Total Screens:** 14 files
  - Home: 1
  - Product: 1
  - Cart: 1
  - Auth: 3 (login, register, open_store)
  - Profile: 1
  - Orders: 1
  - Store: 1
  - Settings: 1
  - About: 3 (about, how_to_shop, partners)
  - Help: 1
- **Total Models:** 1 (UserModel)
- **Total Services:** 2 (AuthService, CartService)
- **Routes Configured:** 15 routes (8 public + 7 protected)
- **Dependencies:** 6 packages (go_router, provider, shared_preferences, google_fonts, intl)
- **Total Code Lines:** ~3,500+ lines

## 🧪 Testing Strategy (Recommended)

### Unit Tests
- [ ] AuthService methods (login, register, logout)
- [ ] CartService methods (add, update, remove)
- [ ] UserModel serialization (toJson, fromJson)
- [ ] Route guards logic

### Widget Tests
- [ ] Login form validation
- [ ] Register form validation
- [ ] Cart item widget
- [ ] Product card widget

### Integration Tests
- [ ] Complete auth flow (guest → customer → seller)
- [ ] Shopping flow (browse → cart → checkout)
- [ ] Store creation flow

## 🔒 Security Considerations

### Implemented
- ✅ Route guards (protected routes)
- ✅ Role-based access control
- ✅ Input validation (forms)
- ✅ State persistence encryption ready (SharedPreferences)

### To Implement
- [ ] Password hashing (currently dummy auth)
- [ ] JWT token management
- [ ] API key security
- [ ] HTTPS only
- [ ] Rate limiting
- [ ] Input sanitization

## 🚨 Known Issues & Limitations

### Current Limitations
1. **Dummy Authentication** - Login/register tidak terkoneksi ke backend
2. **Dummy Products** - 26 produk hardcoded di home_screen.dart
3. **Static Cart** - Cart items tidak persist ke database
4. **No Real Payment** - Checkout hanya simulasi
5. **No Image Upload** - Profil & produk tanpa upload gambar
6. **31 Deprecation Warnings** - `withOpacity` → `withValues`, `value` → `initialValue`

### Non-Blocking Warnings
- Flutter SDK deprecations (Material 3 migration)
- Tidak mempengaruhi functionality
- Bisa diperbaiki nanti saat refactor

## 📱 Deployment Readiness

### Web Deployment ✅
- Ready to deploy ke Firebase Hosting, Vercel, Netlify
- Responsive design sudah ada
- PWA ready (tinggal tambah manifest.json)

### Mobile Deployment ⚠️
- Android: Ready to build APK/AAB
- iOS: Perlu Apple Developer Account
- Store icons & splash screen perlu disetup

### Desktop Deployment ⚠️
- Windows: Ready to build EXE
- macOS: Perlu Apple Developer Account
- Linux: Ready to build AppImage/Snap

## 🎨 UI/UX Features

### Implemented
- ✅ Material Design 3
- ✅ Green theme (UMKM/pertanian)
- ✅ Poppins font
- ✅ Responsive layout (mobile + desktop)
- ✅ Gradient headers
- ✅ Card-based design
- ✅ Loading states
- ✅ Success dialogs
- ✅ Validation feedback
- ✅ Cart badge counter

### To Implement
- [ ] Dark mode
- [ ] Skeleton loading
- [ ] Pull-to-refresh
- [ ] Infinite scroll
- [ ] Image carousel
- [ ] Bottom navigation (mobile)
- [ ] Floating action button optimization

## 📈 Performance Optimizations

### Applied
- ✅ Lazy loading (routes)
- ✅ StatefulWidget untuk local state
- ✅ ChangeNotifier untuk global state
- ✅ Local storage untuk cache (SharedPreferences)

### To Implement
- [ ] Image caching
- [ ] API response caching
- [ ] Pagination (product list)
- [ ] Debouncing (search)
- [ ] Memoization (expensive computations)

## 📚 Documentation

- ✅ PROJECT_STRUCTURE.md (this file)
- ✅ README.md (project overview)
- ✅ Code comments (inline)
- [ ] API documentation
- [ ] User manual
- [ ] Developer guide

## 🤝 Git Commit History (Latest)

1. `feat: Add footer with professional styling`
2. `feat: Restructure project with professional architecture`
3. `feat: Refactor to English class names`
4. `feat: Add authentication basic (login & register)`
5. `feat: Add conditional rendering based on auth state`
6. `feat: Add route guards for protected routes`
7. `feat: Update profile screen to show real user data`
8. `feat: Update store screen to display seller's actual store data`
9. `feat: Add CartService for dynamic cart management`
10. `fix: Redirect to home after successfully opening store with success dialog`

---

**Dibuat:** 28 Desember 2025  
**Last Updated:** 29 Desember 2025 (Authentication System Complete)  
**Version:** 2.0.0  
**Status:** Development (Backend Integration Ready)  
**Developer:** Rumah UMKM Development Team

**Highlights v2.0.0:**
- ✅ Complete authentication system (Guest/Customer/Seller)
- ✅ Route guards & protected routes
- ✅ Real user data integration (profile, store)
- ✅ Dynamic cart management with badge counter
- ✅ State persistence (SharedPreferences)
- ✅ 15 configured routes (8 public + 7 protected)
- 🎯 Ready for backend integration (Firebase/API)

