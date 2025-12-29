import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../utils/auth_service.dart';
import '../../utils/cart_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. VARIABLE STATE UNTUK KATEGORI
  String _kategoriTerpilih = "Semua"; // Defaultnya menampilkan semua
  final ScrollController _categoryScrollController = ScrollController();
  
  // 2. VARIABLE STATE UNTUK SEARCH
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();
  
  final List<String> _daftarKategori = [
    "Semua",
    "Makanan",
    "Minuman",
    "Fashion",
    "Kerajinan",
    "Jasa",
    "Kue & Camilan",
    "Hasil Bumi",
    "Tanaman & Bibit",
    "Produk Herbal",
    "Lauk Pauk",
    "Souvenir",
    "Peternakan"
  ];

  @override
  void dispose() {
    _categoryScrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  // 2. UPDATE DATABASE DUMMY (Tambahkan field 'kategori')
  final List<Map<String, dynamic>> _produkList = [
    // MAKANAN
    {
      "nama": "Keripik Singkong Pedas",
      "harga": 15000,
      "toko": "Dapur Bu Siti",
      "terjual": 50,
      "kategori": "Makanan",
      "image": Colors.orange[100]
    },
    {
      "nama": "Emping Melinjo Balado",
      "harga": 25000,
      "toko": "Camilan Bu Tini",
      "terjual": 35,
      "kategori": "Makanan",
      "image": Colors.amber[100]
    },
    
    // MINUMAN
    {
      "nama": "Kopi Robusta Lokal",
      "harga": 45000,
      "toko": "Kopi Tani Sejahtera",
      "terjual": 120,
      "kategori": "Minuman",
      "image": Colors.brown[100]
    },
    {
      "nama": "Jamu Kunyit Asam",
      "harga": 8000,
      "toko": "Jamu Sehat Ibu Wati",
      "terjual": 80,
      "kategori": "Minuman",
      "image": Colors.yellow[100]
    },
    
    // FASHION
    {
      "nama": "Batik Tulis Desa",
      "harga": 150000,
      "toko": "Butik Desa",
      "terjual": 5,
      "kategori": "Fashion",
      "image": Colors.purple[100]
    },
    {
      "nama": "Mukena Bordir Tangan",
      "harga": 185000,
      "toko": "Rajut Berkah",
      "terjual": 12,
      "kategori": "Fashion",
      "image": Colors.pink[100]
    },
    
    // KERAJINAN
    {
      "nama": "Anyaman Bambu",
      "harga": 75000,
      "toko": "Kriya Mandiri",
      "terjual": 15,
      "kategori": "Kerajinan",
      "image": Colors.green[100]
    },
    {
      "nama": "Tas Pandan Wangi",
      "harga": 95000,
      "toko": "Rajut Ibu",
      "terjual": 8,
      "kategori": "Kerajinan",
      "image": Colors.teal[100]
    },
    
    // JASA
    {
      "nama": "Jasa Desain Logo",
      "harga": 50000,
      "toko": "Santri Creative",
      "terjual": 10,
      "kategori": "Jasa",
      "image": Colors.blue[100]
    },
    {
      "nama": "Catering Nasi Kotak",
      "harga": 15000,
      "toko": "Catering Bu Yanti",
      "terjual": 150,
      "kategori": "Jasa",
      "image": Colors.indigo[100]
    },
    
    // KUE & CAMILAN
    {
      "nama": "Kue Lapis Legit",
      "harga": 125000,
      "toko": "Kue Mama Ina",
      "terjual": 30,
      "kategori": "Kue & Camilan",
      "image": Colors.orange[200]
    },
    {
      "nama": "Brownies Kukus Pandan",
      "harga": 35000,
      "toko": "Dapur Azzahra",
      "terjual": 55,
      "kategori": "Kue & Camilan",
      "image": Colors.green[200]
    },
    
    // HASIL BUMI
    {
      "nama": "Sayur Kangkung Segar",
      "harga": 3000,
      "toko": "Kebun Pak Jarwo",
      "terjual": 200,
      "kategori": "Hasil Bumi",
      "image": Colors.lightGreen[100]
    },
    {
      "nama": "Singkong Rebus",
      "harga": 5000,
      "toko": "Tani Muda",
      "terjual": 100,
      "kategori": "Hasil Bumi",
      "image": Colors.brown[50]
    },
    
    // TANAMAN & BIBIT
    {
      "nama": "Bibit Cabai Rawit",
      "harga": 5000,
      "toko": "Bibit Subur",
      "terjual": 70,
      "kategori": "Tanaman & Bibit",
      "image": Colors.red[100]
    },
    {
      "nama": "Tanaman Lidah Mertua",
      "harga": 25000,
      "toko": "Hijau Nursery",
      "terjual": 45,
      "kategori": "Tanaman & Bibit",
      "image": Colors.green[100]
    },
    
    // PRODUK HERBAL
    {
      "nama": "Madu Hutan Asli",
      "harga": 95000,
      "toko": "Herbal Berkah",
      "terjual": 40,
      "kategori": "Produk Herbal",
      "image": Colors.amber[200]
    },
    {
      "nama": "Minyak Kayu Putih",
      "harga": 15000,
      "toko": "Jamu Tradisional",
      "terjual": 60,
      "kategori": "Produk Herbal",
      "image": Colors.teal[200]
    },
    
    // LAUK PAUK
    {
      "nama": "Ikan Asin Jambal",
      "harga": 35000,
      "toko": "Lauk Sedap",
      "terjual": 55,
      "kategori": "Lauk Pauk",
      "image": Colors.orange[50]
    },
    {
      "nama": "Abon Sapi Pedas",
      "harga": 65000,
      "toko": "Abon Bu Nur",
      "terjual": 40,
      "kategori": "Lauk Pauk",
      "image": Colors.red[50]
    },
    
    // SOUVENIR
    {
      "nama": "Gantungan Kunci Batik",
      "harga": 15000,
      "toko": "Cinderamata Desa",
      "terjual": 90,
      "kategori": "Souvenir",
      "image": Colors.purple[100]
    },
    {
      "nama": "Kipas Bambu Lukis",
      "harga": 25000,
      "toko": "Kriya Seni",
      "terjual": 35,
      "kategori": "Souvenir",
      "image": Colors.brown[100]
    },
    
    // PETERNAKAN
    {
      "nama": "Telur Ayam Kampung",
      "harga": 35000,
      "toko": "Ternak Makmur",
      "terjual": 120,
      "kategori": "Peternakan",
      "image": Colors.yellow[200]
    },
    {
      "nama": "Ayam Kampung Hidup",
      "harga": 85000,
      "toko": "Peternakan Pak Udin",
      "terjual": 25,
      "kategori": "Peternakan",
      "image": Colors.orange[50]
    },
  ];

  // LOGIC: Menambah Produk Baru
  void _tambahProduk(String nama, String harga, String toko, String kategori) {
    if (nama.isEmpty || harga.isEmpty || toko.isEmpty) return;

    setState(() {
      _produkList.insert(0, {
        "nama": nama,
        "harga": int.tryParse(harga) ?? 0,
        "toko": toko,
        "terjual": 0,
        "kategori": kategori, // Simpan kategori
        "image": Colors.blue[100]
      });
    });
    Navigator.pop(context);
  }

  // LOGIC: Menghapus Produk
  void _hapusProduk(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Hapus Produk?"),
        content: Text("Hapus ${item['nama']} dari etalase?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Batal")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              setState(() {
                _produkList.remove(item);
              });
              Navigator.pop(ctx);
            },
            child: const Text("Hapus"),
          )
        ],
      ),
    );
  }

  // LOGIC: Format Rupiah
  String formatRupiah(int harga) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(harga);
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final user = authService.currentUser;
    final cartService = context.watch<CartService>();
    final cartItemCount = cartService.itemCount;
    
    // 3. LOGIC FILTERING (Saring data sebelum ditampilkan)
    List<Map<String, dynamic>> produkDitampilkan;
    if (_kategoriTerpilih == "Semua") {
      produkDitampilkan = _produkList;
    } else {
      produkDitampilkan = _produkList.where((item) => item['kategori'] == _kategoriTerpilih).toList();
    }
    
    // Filter berdasarkan search query
    if (_searchQuery.isNotEmpty) {
      produkDitampilkan = produkDitampilkan.where((item) {
        final nama = item['nama'].toString().toLowerCase();
        final toko = item['toko'].toString().toLowerCase();
        final query = _searchQuery.toLowerCase();
        return nama.contains(query) || toko.contains(query);
      }).toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: 120,
        title: Column(
          children: [
            // TIER 1: Branding & Profile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo & Brand
                Row(
                  children: const [
                    Icon(Icons.storefront, color: Colors.green, size: 28),
                    SizedBox(width: 10),
                    Text(
                      "Rumah UMKM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                // Profile Dropdown atau Login Button
                user.isGuest
                    ? ElevatedButton.icon(
                        onPressed: () => context.push('/login'),
                        icon: const Icon(Icons.login, size: 18),
                        label: const Text('Masuk/Daftar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    : PopupMenuButton<String>(
                        offset: const Offset(0, 50),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.green.shade100,
                                child: const Icon(Icons.person, size: 18, color: Colors.green),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                user.name,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.arrow_drop_down, size: 20),
                            ],
                          ),
                        ),
                        itemBuilder: (context) {
                          List<PopupMenuEntry<String>> menuItems = [
                            const PopupMenuItem(
                              value: 'profile',
                              child: Row(
                                children: [
                                  Icon(Icons.person_outline, size: 20),
                                  SizedBox(width: 12),
                                  Text('Profil Saya'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'orders',
                              child: Row(
                                children: [
                                  Icon(Icons.receipt_long_outlined, size: 20),
                                  SizedBox(width: 12),
                                  Text('Pesanan Saya'),
                                ],
                              ),
                            ),
                          ];

                          // Tambahkan menu Toko untuk Seller
                          if (user.isSeller) {
                            menuItems.add(
                              const PopupMenuItem(
                                value: 'store',
                                child: Row(
                                  children: [
                                    Icon(Icons.store_outlined, size: 20),
                                    SizedBox(width: 12),
                                    Text('Toko Saya'),
                                  ],
                                ),
                              ),
                            );
                          } else if (user.isCustomer) {
                            // Menu "Buka Toko" untuk Customer
                            menuItems.add(
                              const PopupMenuItem(
                                value: 'open-store',
                                child: Row(
                                  children: [
                                    Icon(Icons.storefront, size: 20, color: Colors.green),
                                    SizedBox(width: 12),
                                    Text('Buka Toko', style: TextStyle(color: Colors.green)),
                                  ],
                                ),
                              ),
                            );
                          }

                          menuItems.addAll([
                            const PopupMenuDivider(),
                            const PopupMenuItem(
                              value: 'settings',
                              child: Row(
                                children: [
                                  Icon(Icons.settings_outlined, size: 20),
                                  SizedBox(width: 12),
                                  Text('Pengaturan'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'logout',
                              child: Row(
                                children: [
                                  Icon(Icons.logout, size: 20, color: Colors.red),
                                  SizedBox(width: 12),
                                  Text('Keluar', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ]);

                          return menuItems;
                        },
                        onSelected: (value) {
                          // Navigate to respective screens
                          switch (value) {
                            case 'profile':
                              context.push('/profil');
                              break;
                            case 'orders':
                              context.push('/pesanan');
                              break;
                            case 'store':
                              context.push('/toko');
                              break;
                            case 'open-store':
                              context.push('/buka-toko');
                              break;
                            case 'settings':
                              context.push('/pengaturan');
                              break;
                            case 'logout':
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Keluar'),
                                  content: const Text('Apakah Anda yakin ingin keluar?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(ctx);
                                        await context.read<AuthService>().logout();
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Berhasil keluar')),
                                          );
                                        }
                                      },
                                      child: const Text('Keluar', style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );
                              break;
                          }
                        },
                      ),
              ],
            ),
            const SizedBox(height: 12),
            // TIER 2: Search & Cart
            Row(
              children: [
                // Search Bar
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari produk UMKM...',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    _searchQuery = '';
                                  });
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Cart Button with Badge
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: IconButton(
                        onPressed: () => context.push('/keranjang'),
                        icon: const Icon(Icons.shopping_cart_outlined, color: Colors.green),
                      ),
                    ),
                    if (cartItemCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Text(
                            '$cartItemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showFormTambah(),
        label: const Text("Jual Produk"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BANNER PROMO ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF43A047), Color(0xFF66BB6A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Beli Lokal, Sejahterakan Desa!",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Gratis Ongkir untuk sesama warga RW 05 khusus hari ini.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // --- KATEGORI (Responsive dengan Chevron untuk Desktop) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Kategori", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _buildCategorySection(),

            const SizedBox(height: 25),

            // --- GRID PRODUK (Hasil Filter) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Produk $_kategoriTerpilih", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("${produkDitampilkan.length} Produk", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 15),

            produkDitampilkan.isEmpty 
            ? const Center(child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text("Belum ada produk di kategori ini", style: TextStyle(color: Colors.grey)),
              ))
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 800 ? 5 : (constraints.maxWidth > 600 ? 4 : 2);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: produkDitampilkan.length, // Pakai list hasil filter
                    itemBuilder: (context, index) {
                      final item = produkDitampilkan[index];
                      return _kartuProduk(item);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
            
            // --- FOOTER PROFESSIONAL ---
            _footer(),
          ],
        ),
      ),
    );
  }

  // WIDGET: Kartu Produk
  // WIDGET: Kartu Produk
  Widget _kartuProduk(Map<String, dynamic> item) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell( // <--- 1. BUNGKUS DENGAN INKWELL
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // <--- 2. AKSI PINDAH HALAMAN
          // Kita kirim data 'item' (produk) ke halaman detail
          context.push('/detail', extra: item);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: item['image'],
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    child: Center(
                      child: Icon(Icons.shopping_bag, size: 40, color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                  Positioned(
                    top: 8, right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                      child: Text(item['kategori'], style: const TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['toko'], style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text(item['nama'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(formatRupiah(item['harga']), style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  
                  // Tombol kecil di bawah kita ganti jadi ikon saja agar tidak bentrok dengan klik kartu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       // Hapus tombol "Beli" yang besar, ganti text "Lihat Detail"
                       const Text("Lihat Detail >", style: TextStyle(fontSize: 10, color: Colors.green)),
                       const SizedBox(width: 10),
                       InkWell(
                        onTap: () => _hapusProduk(item),
                        child: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                       )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // WIDGET: Category Section with Desktop Chevrons and Mobile Scroll
  Widget _buildCategorySection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        
        if (isDesktop) {
          // Desktop: dengan chevron buttons
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Chevron Left Button
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    _categoryScrollController.animateTo(
                      _categoryScrollController.offset - 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                // Category List
                Expanded(
                  child: SingleChildScrollView(
                    controller: _categoryScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _daftarKategori.map((kategori) {
                        return _chipKategori(kategori, _kategoriTerpilih == kategori);
                      }).toList(),
                    ),
                  ),
                ),
                // Chevron Right Button
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    _categoryScrollController.animateTo(
                      _categoryScrollController.offset + 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          // Mobile: simple horizontal scroll
          return SingleChildScrollView(
            controller: _categoryScrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: _daftarKategori.map((kategori) {
                return _chipKategori(kategori, _kategoriTerpilih == kategori);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  // WIDGET: Chip Kategori (Custom untuk Full Text Visibility)
  Widget _chipKategori(String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _kategoriTerpilih = label;
            });
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: isActive ? Colors.green : Colors.grey.shade300,
                width: isActive ? 2 : 1,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : null,
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black87,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // DIALOG: Form Tambah Produk
  void _showFormTambah() {
    final namaController = TextEditingController();
    final hargaController = TextEditingController();
    final tokoController = TextEditingController();
    String kategoriPilih = "Makanan"; // Default kategori

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder( // Pakai StatefulBuilder biar dropdown bisa berubah
        builder: (context, setStateDialog) => AlertDialog(
          title: const Text("Tambah Produk Baru"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: namaController, decoration: const InputDecoration(labelText: "Nama Produk")),
              TextField(controller: hargaController, decoration: const InputDecoration(labelText: "Harga"), keyboardType: TextInputType.number),
              TextField(controller: tokoController, decoration: const InputDecoration(labelText: "Nama Toko")),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: kategoriPilih,
                decoration: const InputDecoration(labelText: "Kategori"),
                items: ["Makanan", "Minuman", "Fashion", "Kerajinan", "Jasa", "Kue & Camilan", "Hasil Bumi", "Tanaman & Bibit", "Produk Herbal", "Lauk Pauk", "Souvenir", "Peternakan"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (val) => setStateDialog(() => kategoriPilih = val!),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Batal")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: () => _tambahProduk(namaController.text, hargaController.text, tokoController.text, kategoriPilih),
              child: const Text("Jual Sekarang"),
            )
          ],
        ),
      ),
    );
  }

  // WIDGET: Footer Professional
  Widget _footer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1B5E20),
            const Color(0xFF0D3D10),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          // Menu Link (Baris)
          Wrap(
            spacing: 25,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _textLink("Tentang Kami"),
              _buildDivider(),
              _textLink("Cara Belanja"),
              _buildDivider(),
              _textLink("Daftar Mitra"),
              _buildDivider(),
              _textLink("Bantuan"),
            ],
          ),

          const SizedBox(height: 25),

          // Divider dengan icon
          Row(
            children: [
              Expanded(child: Divider(color: Colors.white.withOpacity(0.2), thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.storefront, color: Colors.white.withOpacity(0.4), size: 20),
              ),
              Expanded(child: Divider(color: Colors.white.withOpacity(0.2), thickness: 1)),
            ],
          ),

          const SizedBox(height: 25),

          // Kontak & Sosmed dengan hover effect
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _iconSosmed(Icons.facebook, "Facebook"),
              const SizedBox(width: 20),
              _iconSosmed(Icons.camera_alt, "Instagram"),
              const SizedBox(width: 20),
              _iconSosmed(Icons.email, "Email"),
              const SizedBox(width: 20),
              _iconSosmed(Icons.phone, "Phone"),
            ],
          ),

          const SizedBox(height: 25),
          
          // Copyright dengan style lebih baik
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.copyright, color: Colors.white.withOpacity(0.5), size: 14),
              const SizedBox(width: 5),
              Text(
                "2025 Smart Village System. All rights reserved.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Divider kecil antar link
  Widget _buildDivider() {
    return Container(
      height: 15,
      width: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }

  // Helper kecil untuk Teks Link Footer dengan hover effect
  Widget _textLink(String text) {
    String route = '/';
    if (text == "Tentang Kami") route = '/tentang';
    else if (text == "Cara Belanja") route = '/cara-belanja';
    else if (text == "Daftar Mitra") route = '/mitra';
    else if (text == "Bantuan") route = '/bantuan';
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => context.push(route),
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  // Helper kecil untuk Icon Sosmed dengan hover dan tooltip
  Widget _iconSosmed(IconData icon, String label) {
    return Tooltip(
      message: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}