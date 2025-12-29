import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifikasiPesanan = true;
  bool _notifikasiPromo = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Pengaturan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          // Account Section
          _buildSectionHeader('Akun'),
          _buildSettingTile(
            icon: Icons.person_outline,
            title: 'Edit Profil',
            subtitle: 'Ubah informasi pribadi',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit Profil (Coming Soon)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.lock_outline,
            title: 'Ubah Password',
            subtitle: 'Perbarui kata sandi akun',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ubah Password (Coming Soon)')),
              );
            },
          ),

          const SizedBox(height: 16),

          // Notification Section
          _buildSectionHeader('Notifikasi'),
          _buildSwitchTile(
            icon: Icons.notifications_outlined,
            title: 'Notifikasi Pesanan',
            subtitle: 'Update status pesanan',
            value: _notifikasiPesanan,
            onChanged: (value) {
              setState(() {
                _notifikasiPesanan = value;
              });
            },
          ),
          _buildSwitchTile(
            icon: Icons.local_offer_outlined,
            title: 'Notifikasi Promo',
            subtitle: 'Dapatkan info promo terbaru',
            value: _notifikasiPromo,
            onChanged: (value) {
              setState(() {
                _notifikasiPromo = value;
              });
            },
          ),

          const SizedBox(height: 16),

          // Appearance Section
          _buildSectionHeader('Tampilan'),
          _buildSwitchTile(
            icon: Icons.dark_mode_outlined,
            title: 'Mode Gelap',
            subtitle: 'Aktifkan tema gelap',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dark Mode (Coming Soon)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.language,
            title: 'Bahasa',
            subtitle: 'Indonesia',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pilih Bahasa (Coming Soon)')),
              );
            },
          ),

          const SizedBox(height: 16),

          // Privacy Section
          _buildSectionHeader('Privasi & Keamanan'),
          _buildSettingTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Kebijakan Privasi',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Kebijakan Privasi')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.description_outlined,
            title: 'Syarat & Ketentuan',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Syarat & Ketentuan')),
              );
            },
          ),

          const SizedBox(height: 16),

          // Support Section
          _buildSectionHeader('Dukungan'),
          _buildSettingTile(
            icon: Icons.help_outline,
            title: 'Pusat Bantuan',
            onTap: () => context.push('/bantuan'),
          ),
          _buildSettingTile(
            icon: Icons.info_outline,
            title: 'Tentang Aplikasi',
            subtitle: 'Versi 1.0.0',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Rumah UMKM',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.storefront, size: 50, color: Colors.green),
                children: [
                  const Text('Platform jual-beli produk UMKM lokal untuk meningkatkan kesejahteraan desa.'),
                ],
              );
            },
          ),

          const SizedBox(height: 24),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Keluar'),
                    content: const Text('Apakah Anda yakin ingin keluar dari akun?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          context.go('/');
                        },
                        child: const Text('Keluar', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Keluar dari Akun', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 22, color: Colors.green),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              )
            : null,
        trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SwitchListTile(
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 22, color: Colors.green),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              )
            : null,
        value: value,
        onChanged: onChanged,
        activeColor: Colors.green,
      ),
    );
  }
}
