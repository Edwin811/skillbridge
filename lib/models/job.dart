class MicroJob {
  final String id;
  final String title;
  final String company;
  final String category;
  final String deadline;
  final String salary;
  final String distance;
  final String imageAsset;
  final String goal;
  final List<String> keyPoints;
  final List<String> skills;
  final double rating;
  final int reviewsCount;
  bool isBookmarked;

  MicroJob({
    required this.id,
    required this.title,
    required this.company,
    required this.category,
    required this.deadline,
    required this.salary,
    required this.distance,
    required this.imageAsset,
    required this.goal,
    required this.keyPoints,
    required this.skills,
    this.rating = 4.9,
    this.reviewsCount = 34,
    this.isBookmarked = false,
  });
}

final List<MicroJob> mockJobs = [
  MicroJob(
    id: 'kopi-sentosa',
    title: 'Redesign Menu & Feed Instagram',
    company: 'Kopi Sentosa Cafe',
    category: 'Product & Content Design',
    deadline: 'Deadline Oct 20, 2026',
    salary: 'Rp 2.500.000',
    distance: '1.8 km',
    imageAsset: 'assets/images/coffee_shop.jpg',
    goal: 'Membangun sebuah design style dan guideline yang bisa digunakan oleh barista & admin UMKM dalam membuat konten visual serta promosi media sosial secara konsisten dan menarik pelanggan muda.',
    keyPoints: [
      'Color, Typography, dan Grid Template feed',
      '9 Desain Feed Instagram + 3 Story Template (Canva/Figma)',
      'Desain Menu Meja & Barcode QRIS Siap Cetak',
      'Handbook Panduan Barista & Mini Tutoring 1 Jam',
    ],
    skills: ['Canva Pro', 'Figma', 'Instagram Marketing', 'Copywriting'],
    rating: 4.9,
    reviewsCount: 34,
    isBookmarked: true,
  ),
  MicroJob(
    id: 'batik-lestari',
    title: 'UI/UX & Brand Guide UMKM',
    company: 'Batik Kinanti Boutique',
    category: 'Branding & E-Commerce',
    deadline: 'Deadline Oct 28, 2026',
    salary: 'Rp 3.500.000',
    distance: '3.2 km',
    imageAsset: 'assets/images/design_workspace.jpg',
    goal: 'Mengembangkan identitas visual toko batik online, foto katalog produk modern untuk Shopee & Tokopedia, serta panduan warna kemasan ramah lingkungan.',
    keyPoints: [
      'Logo refresh & Palet Warna Brand Guideline',
      'Desain Template Banner Toko Tokopedia & Shopee',
      'Panduan Fotografi Produk dengan Smartphone',
      'Packaging Sleeve Design untuk kotak hampers batik',
    ],
    skills: ['Adobe Photoshop', 'Figma', 'Product Photography', 'Branding'],
    rating: 5.0,
    reviewsCount: 28,
  ),
  MicroJob(
    id: 'toko-grosir',
    title: 'Data Analyst & Pembukuan Kas Excel',
    company: 'Toko Grosir Barokah',
    category: 'Finance & Administration',
    deadline: 'Deadline Oct 24, 2026',
    salary: 'Rp 1.500.000',
    distance: '2.1 km',
    imageAsset: 'assets/images/bookkeeping.jpg',
    goal: 'Merapikan pencatatan stok barang masuk-keluar harian ke dalam template Excel otomatis dengan formula laba-rugi sederhana yang mudah diisi kasir.',
    keyPoints: [
      'Template Excel Buku Kas Harian & Laba Rugi',
      'Dashboard Grafik Penjualan Barang Terlaris per Bulan',
      'Formula Otomatis Peringatan Stok Menipis',
      'Pelatihan 45 Menit untuk Kasir Toko',
    ],
    skills: ['Microsoft Excel', 'Data Entry', 'Akuntansi Sederhana', 'Dashboard'],
    rating: 4.8,
    reviewsCount: 19,
  ),
];
