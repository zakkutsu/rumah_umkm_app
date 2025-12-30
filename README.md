# 🛒 Rumah UMKM App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/Version-2.0.0-blue)

**Platform Marketplace Digital untuk Memajukan Ekonomi Desa**

Bagian dari Ekosistem **Smart Village** - Modul Perekonomian Masyarakat

[Fitur](#-fitur-utama) • [Instalasi](#-instalasi) • [Teknologi](#-teknologi) • [Roadmap](#-roadmap) • [Kontribusi](#-kontribusi)

</div>

---

## 📖 Tentang Aplikasi

**Rumah UMKM** adalah platform marketplace digital yang dirancang khusus untuk memfasilitasi jual-beli produk lokal antar warga desa. Aplikasi ini menghubungkan pelaku UMKM dengan konsumen dalam satu ekosistem digital yang mudah digunakan, mendukung perekonomian lokal, dan meningkatkan kesejahteraan masyarakat desa.

### 🎯 Misi
- Memberdayakan pelaku UMKM desa untuk go digital
- Mempermudah akses pasar bagi produk lokal
- Meningkatkan transaksi ekonomi berbasis komunitas
- Mendorong kemandirian ekonomi desa

---

## ✨ Fitur Utama

### 🔐 **Authentication System**
- **3 User Roles:**
  - 👋 **Guest** - Browse produk tanpa login
  - 👤 **Customer** - Bisa belanja & buka toko
  - 🏪 **Seller** - Kelola toko & produk
- Login/Register dengan validasi
- Route guards untuk protected pages
- State persistence (auto-login)
- Upgrade Customer → Seller via "Buka Toko"

### 🏪 **Marketplace Features**
- **Katalog Produk Interaktif**
  - 26+ produk dummy dari 13 kategori UMKM
  - Filter kategori (Makanan, Fashion, Kerajinan, Jasa, dll)
  - Search bar (UI ready)
  - Grid responsif (Desktop & Mobile)
  - Detail produk lengkap

- **Shopping Experience**
  - Keranjang belanja dengan counter real-time
  - Add/Update/Remove items
  - Perhitungan total otomatis
  - Checkout simulation

### 👤 **User Management**
- **Profile Screen**
  - Data user real-time (nama, email, phone)
  - Role badge (Guest/Customer/Seller)
  - Statistik pesanan & penjualan
  
- **Store Management (Seller Only)**
  - Dashboard toko pribadi
  - Nama toko & kategori custom
  - List produk toko
  - Analytics (coming soon)

### 📱 **UI/UX Modern**
- Material Design 3
- Green theme (UMKM/pertanian)
- Gradient headers
- Card-based layout
- Loading states & validations
- Success dialogs
- Responsive design

### 🗂️ **Additional Pages**
- Tentang Kami (Visi, Misi, Nilai)
- Cara Belanja (Step-by-step guide)
- Daftar Mitra UMKM
- Bantuan & FAQ
- Pengaturan aplikasi

---

## 🛠️ Teknologi

### Core Stack
- **Flutter 3.x** - Cross-platform framework
- **Dart 3.x** - Programming language
- **Material Design 3** - UI design system

### Dependencies
```yaml
dependencies:
  go_router: ^12.0.0              # Declarative routing + guards
  provider: ^6.1.1                # State management
  shared_preferences: ^2.2.2      # Local storage (auth & cart)
  google_fonts: ^6.1.0            # Poppins typography
  intl: ^0.18.0                   # Rupiah formatting
```

### Architecture
- **Provider Pattern** - Global state management
- **Feature-based Structure** - Organized by modules
- **Route Guards** - Protected routes
- **Repository Pattern Ready** - For backend integration

---

## 🚀 Instalasi

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Chrome (untuk web) atau Android Studio/Xcode (untuk mobile)

### Step-by-Step

1. **Clone Repository**
   ```bash
   git clone https://github.com/zakkutsu/rumah_umkm_app
   cd rumah_umkm_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run Application**
   
   **Web (Chrome):**
   ```bash
   flutter run -d chrome
   ```
   
   **Mobile (Android):**
   ```bash
   flutter run -d <device-id>
   ```
   
   **Desktop (Windows):**
   ```bash
   flutter run -d windows
   ```

4. **Build for Production**
   ```bash
   # Web
   flutter build web
   
   # Android APK
   flutter build apk --release
   
   # iOS (requires macOS)
   flutter build ios --release
   ```

---

## 📁 Struktur Project

```
lib/
├── main.dart                       # Entry point + Provider setup
├── routes/
│   └── app_router.dart             # Centralized routing + guards
├── screens/                        # Feature-based screens
│   ├── home/                       # Landing page + product grid
│   ├── auth/                       # Login, Register, Open Store
│   ├── product/                    # Product detail
│   ├── cart/                       # Shopping cart
│   ├── profile/                    # User profile
│   ├── orders/                     # Order history
│   ├── store/                      # Seller dashboard
│   ├── settings/                   # App settings
│   ├── about/                      # About, How to Shop, Partners
│   └── help/                       # FAQ & Support
├── models/
│   └── user_model.dart             # User data model
├── utils/
│   ├── auth_service.dart           # Authentication logic
│   └── cart_service.dart           # Cart management
└── widgets/                        # Reusable components (ready)
```

**Total:** 14 screens, 2 services, 1 model, 15+ routes

---

## 🎮 Cara Menggunakan

### Sebagai Guest (Pengunjung)
1. Buka aplikasi → Lihat katalog produk
2. Filter berdasarkan kategori
3. Klik produk untuk detail
4. Klik "Add to Cart" → Redirect ke Login

### Sebagai Customer (Pembeli)
1. **Daftar Akun:**
   - Klik "Masuk/Daftar" → "Daftar Akun Baru"
   - Isi: Nama, Email, Phone, Password
   - Submit → Auto login
   
2. **Belanja:**
   - Browse produk → Add to cart
   - Lihat keranjang (badge counter updated)
   - Checkout → Order created

3. **Buka Toko:**
   - Profile menu → "Buka Toko"
   - Isi: Nama toko, Kategori, Deskripsi
   - Submit → Upgrade jadi Seller
   - Redirect ke beranda

### Sebagai Seller (Penjual)
1. Menu "Toko Saya" muncul di profile dropdown
2. Dashboard toko menampilkan:
   - Nama toko & kategori
   - List produk toko
   - Statistik penjualan
3. Tambah/Edit/Hapus produk (coming soon)

---

## 🗺️ Roadmap

### ✅ Version 2.0.0 (Current) - Authentication Complete
- [x] Full authentication system
- [x] 3 user roles (Guest/Customer/Seller)
- [x] Route guards & protected pages
- [x] Real user data integration
- [x] Dynamic cart with badge counter
- [x] State persistence (SharedPreferences)

### 🚧 Version 2.1.0 (Q1 2026) - Backend Integration
- [ ] Firebase Authentication
- [ ] Firestore database for products
- [ ] Real-time data sync
- [ ] Image upload (profile & products)
- [ ] Cloud storage integration

### 🔮 Version 3.0.0 (Q2 2026) - Enhanced Features
- [ ] Real search functionality
- [ ] Product reviews & ratings
- [ ] Chat dengan penjual
- [ ] Push notifications
- [ ] Wishlist/Favorites
- [ ] Order tracking real-time

### 🌟 Version 4.0.0 (Q3 2026) - Marketplace Pro
- [ ] Payment gateway (Midtrans/Xendit)
- [ ] Shipping integration (JNE, J&T)
- [ ] Seller analytics dashboard
- [ ] Voucher & promo system
- [ ] Loyalty program
- [ ] Multi-language support

---

## 🔒 Security & Privacy

### Implemented
- ✅ Route guards (role-based access)
- ✅ Input validation (forms)
- ✅ State persistence ready for encryption

### To Implement
- ⏳ Password hashing (when backend connected)
- ⏳ JWT token management
- ⏳ HTTPS only (production)
- ⏳ Rate limiting
- ⏳ Data encryption (sensitive info)

---

## 🧪 Testing

### Current Status
- Manual testing ✅
- Route navigation ✅
- Auth flow ✅
- Cart functionality ✅

### Recommended Tests
```bash
# Run all tests
flutter test

# Coverage report
flutter test --coverage
```

**Test Coverage Goals:**
- [ ] Unit tests (AuthService, CartService)
- [ ] Widget tests (Login, Register forms)
- [ ] Integration tests (Complete auth flow)

---

## 🤝 Kontribusi

Kami terbuka untuk kontribusi! Berikut cara berkontribusi:

1. **Fork** repository ini
2. **Create branch** untuk fitur baru
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit** perubahan Anda
   ```bash
   git commit -m "feat: Add some AmazingFeature"
   ```
4. **Push** ke branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open Pull Request**

### Commit Convention
```
feat: Fitur baru
fix: Bug fix
docs: Dokumentasi
refactor: Refactoring code
style: Formatting
test: Testing
chore: Maintenance
```

---

## 📄 License

Project ini menggunakan **MIT License** - bebas digunakan untuk keperluan komersial maupun non-komersial.

```
MIT License - Copyright (c) 2025 Rumah UMKM Development Team
```

---

## 👥 Tim Pengembang

**Rumah UMKM Development Team**
- Smart Village Initiative
- Modul Perekonomian Masyarakat Desa

---

## 📞 Kontak & Support

- 📧 Email: support@rumah-umkm.id (placeholder)
- 🌐 Website: https://rumah-umkm.id (placeholder)
- 💬 Discord: [Join Community](https://discord.gg/rumah-umkm) (placeholder)

---

## 📊 Project Statistics

- **Version:** 2.0.0
- **Total Screens:** 14
- **Total Routes:** 15+ (8 public + 7 protected)
- **Code Lines:** 3,500+
- **Dependencies:** 6 packages
- **Supported Platforms:** Web, Android, iOS, Windows, macOS, Linux

---

## 🙏 Acknowledgments

Terima kasih kepada:
- Flutter Team untuk framework yang luar biasa
- Komunitas open-source
- Pelaku UMKM desa yang menginspirasi project ini
- Pemerintah desa yang mendukung digitalisasi ekonomi lokal

---

<div align="center">

**Dibuat dengan ❤️ untuk Kemajuan Ekonomi Desa**

⭐ Star project ini jika bermanfaat!

[⬆ Kembali ke atas](#-rumah-umkm-app)

</div>
