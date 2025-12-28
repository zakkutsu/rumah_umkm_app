# Rumah UMKM App - Struktur Project

## 📁 Struktur Folder (Professional Architecture)

```
lib/
├── main.dart                           # Entry point aplikasi
├── routes/
│   └── app_router.dart                 # Routing configuration (GoRouter)
├── screens/                            # Semua halaman aplikasi
│   ├── home/
│   │   └── home_screen.dart            # Halaman utama dengan grid produk
│   ├── product/
│   │   └── detail_screen.dart          # Detail produk
│   ├── cart/
│   │   └── cart_screen.dart            # Keranjang belanja
│   ├── about/
│   │   ├── about_screen.dart           # Tentang Kami
│   │   ├── how_to_shop_screen.dart     # Cara Belanja
│   │   └── partners_screen.dart        # Daftar Mitra UMKM
│   └── help/
│       └── help_screen.dart            # Bantuan & FAQ
├── widgets/                            # Widget reusable (future)
│   ├── product_card.dart               # Card produk
│   ├── category_chip.dart              # Chip kategori
│   └── footer_widget.dart              # Footer
├── models/                             # Data models (future)
│   └── product_model.dart              # Model produk
└── utils/                              # Helper functions (future)
    └── formatters.dart                 # Format currency, date, dll
```

## 🛣️ Routing Structure

Aplikasi menggunakan **go_router** untuk routing dengan URL yang clean:

- `/` - Halaman utama (Home)
- `/detail` - Detail produk (dengan state passing)
- `/keranjang` - Keranjang belanja
- `/tentang` - Tentang Kami
- `/cara-belanja` - Panduan belanja
- `/mitra` - Daftar mitra UMKM
- `/bantuan` - FAQ & Bantuan

## ✅ Fitur Yang Sudah Ada

1. **Home Screen** (Halaman Utama)
   - Grid produk dengan 26 dummy products
   - 13 kategori UMKM lokal
   - Filter kategori
   - Responsive (mobile & desktop)
   - Banner promo
   - Footer dengan navigasi

2. **Detail Screen**
   - Detail lengkap produk
   - Informasi penjual
   - Tombol beli & tambah keranjang

3. **Cart Screen**
   - Daftar item di keranjang
   - Update quantity
   - Perhitungan total
   - Checkout

4. **About Screens**
   - Tentang Kami (visi, misi, statistik)
   - Cara Belanja (step-by-step guide)
   - Daftar Mitra (list mitra aktif)

5. **Help Screen**
   - FAQ dengan ExpansionTile
   - Kontak support

## 🚀 Saran Kelanjutan

### Fase 1: Authentication & User Management
- [ ] Login/Register screen
- [ ] Profile screen
- [ ] Role-based access (pembeli vs penjual)
- [ ] Firebase Authentication integration

### Fase 2: Backend Integration
- [ ] Ganti dummy data dengan API/Database
- [ ] Firebase Firestore atau Supabase
- [ ] Real-time product updates
- [ ] Image upload untuk produk

### Fase 3: Enhanced Features
- [ ] Search functionality
- [ ] Product reviews & ratings
- [ ] Chat dengan penjual
- [ ] Push notifications
- [ ] Order tracking
- [ ] Payment gateway integration

### Fase 4: Multi-Platform Optimization
- [ ] Responsive design refinement
- [ ] Desktop app (Windows/Mac/Linux)
- [ ] Mobile app optimization
- [ ] PWA (Progressive Web App)

### Fase 5: Advanced Features
- [ ] Analytics dashboard untuk penjual
- [ ] Laporan penjualan
- [ ] Inventory management
- [ ] Voucher & promo system
- [ ] Loyalty program

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

- **Flutter 3.x**
- **Dart 3.x**
- **go_router** (routing)
- **google_fonts** (typography)
- **intl** (formatting)

## 📝 Naming Convention

- Screens: `*_screen.dart` (e.g., `home_screen.dart`)
- Widgets: `*_widget.dart` (e.g., `footer_widget.dart`)
- Models: `*_model.dart` (e.g., `product_model.dart`)
- Class: PascalCase (e.g., `HomeScreen`)
- Variables: camelCase (e.g., `productList`)
- Constants: UPPER_SNAKE_CASE (e.g., `API_KEY`)

## 🎯 Best Practices Applied

1. ✅ Separation of concerns (screens, widgets, models)
2. ✅ Single Responsibility Principle
3. ✅ Reusable components
4. ✅ Clean architecture
5. ✅ Consistent naming
6. ✅ Proper folder structure
7. ✅ Route management
8. ✅ State management (StatefulWidget)

---

**Dibuat:** 28 Desember 2025  
**Developer:** Rumah UMKM Development Team
