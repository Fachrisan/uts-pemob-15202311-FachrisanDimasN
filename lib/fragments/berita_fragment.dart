import 'package:flutter/material.dart';

class News {
  final String title;
  final String category;
  final String time;
  final String imageUrl;
  final Color categoryColor;
  final String content;
  final String author;

  News({
    required this.title,
    required this.category,
    required this.time,
    required this.imageUrl,
    required this.categoryColor,
    required this.content,
    required this.author,
  });
}

class BeritaFragment extends StatefulWidget {
  const BeritaFragment({super.key});

  @override
  State<BeritaFragment> createState() => _BeritaFragmentState();
}

class _BeritaFragmentState extends State<BeritaFragment> {
  String selectedCategory = 'Semua';

  final List<News> newsList = [
    News(
      title: 'Teknologi AI Terbaru Mengubah Industri Digital Indonesia',
      category: 'Teknologi',
      time: '2 jam lalu',
      imageUrl:
          'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
      categoryColor: const Color(0xFF3B82F6),
      author: 'Budi Santoso',
      content:
          '''Perkembangan teknologi kecerdasan buatan (AI) terus mengalami kemajuan pesat di Indonesia. Berbagai perusahaan teknologi lokal mulai mengadopsi AI untuk meningkatkan efisiensi operasional mereka.

Menurut data terbaru, industri teknologi Indonesia mengalami pertumbuhan signifikan dalam implementasi AI, terutama di sektor fintech, e-commerce, dan layanan digital.

Para ahli memprediksi bahwa dalam 5 tahun ke depan, AI akan menjadi komponen integral dalam hampir semua aspek bisnis digital di Indonesia. Hal ini membuka peluang besar bagi para profesional teknologi lokal.

Pemerintah juga mendukung pengembangan AI melalui berbagai program pelatihan dan insentif bagi startup teknologi yang fokus pada inovasi AI.''',
    ),
    News(
      title: 'Timnas Indonesia Raih Kemenangan Gemilang di Piala AFF',
      category: 'Olahraga',
      time: '3 jam lalu',
      imageUrl:
          'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=800',
      categoryColor: const Color(0xFF10B981),
      author: 'Ahmad Fauzi',
      content:
          '''Timnas Indonesia berhasil meraih kemenangan gemilang dalam pertandingan Piala AFF semalam. Dengan skor 3-1, tim Garuda menunjukkan performa luar biasa di hadapan ribuan penonton.

Gol pertama dicetak pada menit ke-15 melalui tendangan keras dari luar kotak penalti. Penonton langsung bersorak riuh menyaksikan gol spektakuler tersebut.

Pelatih tim nasional menyatakan bangga dengan pencapaian para pemain. "Ini adalah hasil kerja keras latihan berbulan-bulan," ujarnya dalam konferensi pers pasca pertandingan.

Kemenangan ini menempatkan Indonesia di posisi teratas klasemen sementara grup mereka, membuka peluang besar untuk melaju ke babak semifinal.''',
    ),
    News(
      title: 'Ekonomi Indonesia Tumbuh 5.2% di Kuartal Ketiga 2025',
      category: 'Ekonomi',
      time: '5 jam lalu',
      imageUrl:
          'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=800',
      categoryColor: const Color(0xFFF59E0B),
      author: 'Siti Rahmawati',
      content:
          '''Badan Pusat Statistik (BPS) mengumumkan bahwa ekonomi Indonesia mengalami pertumbuhan sebesar 5.2% pada kuartal ketiga tahun 2025. Angka ini melampaui ekspektasi para ekonom yang memperkirakan pertumbuhan di kisaran 4.8%.

Sektor yang berkontribusi besar terhadap pertumbuhan ini adalah industri manufaktur, perdagangan, dan jasa keuangan. Konsumsi rumah tangga juga menunjukkan peningkatan yang signifikan.

Menteri Keuangan menyatakan optimisme bahwa pertumbuhan ekonomi akan terus berlanjut hingga akhir tahun. Berbagai kebijakan stimulus ekonomi yang telah diterapkan mulai menunjukkan hasil positif.

Investasi asing juga mengalami peningkatan, menunjukkan kepercayaan investor terhadap stabilitas ekonomi Indonesia.''',
    ),
    News(
      title: 'Penemuan Vaksin Baru Membawa Harapan untuk Pengobatan',
      category: 'Kesehatan',
      time: '6 jam lalu',
      imageUrl:
          'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=800',
      categoryColor: const Color(0xFFEF4444),
      author: 'Dr. Mega Putri',
      content:
          '''Para peneliti dari Universitas Indonesia mengumumkan penemuan vaksin baru yang berpotensi mengobati penyakit tropis yang selama ini menjadi masalah kesehatan di Indonesia.

Vaksin ini telah melalui uji klinis tahap awal dengan hasil yang sangat menjanjikan. Efektivitasnya mencapai 87% dalam mencegah penyebaran penyakit.

Kepala tim peneliti menjelaskan bahwa pengembangan vaksin ini memakan waktu 5 tahun dengan melibatkan lebih dari 100 peneliti. Kolaborasi dengan lembaga kesehatan internasional juga memainkan peran penting.

Diharapkan vaksin ini bisa diproduksi secara massal dalam 2 tahun ke depan setelah menyelesaikan semua tahapan uji klinis yang diperlukan.''',
    ),
    News(
      title: 'Bandung Raih Penghargaan Kota Terbersih se-Indonesia',
      category: 'Berita Lokal',
      time: '8 jam lalu',
      imageUrl:
          'https://images.unsplash.com/photo-1589519160732-57fc498494f8?w=800',
      categoryColor: const Color(0xFF8B5CF6),
      author: 'Rina Handayani',
      content:
          '''Kota Bandung berhasil meraih penghargaan sebagai Kota Terbersih se-Indonesia dalam ajang Adipura 2025. Pencapaian ini merupakan hasil kerja keras seluruh elemen masyarakat dan pemerintah daerah.

Walikota Bandung menyampaikan apresiasi kepada seluruh warga yang telah berkontribusi dalam menjaga kebersihan kota. Program bank sampah dan daur ulang menjadi kunci keberhasilan ini.

Berbagai inovasi pengelolaan sampah telah diterapkan, termasuk penggunaan teknologi modern untuk pemilahan sampah otomatis. Partisipasi masyarakat dalam program ini mencapai 85%.

Penghargaan ini diharapkan dapat memotivasi kota-kota lain untuk meningkatkan upaya pengelolaan lingkungan dan kebersihan.''',
    ),
    News(
      title: 'Startup Indonesia Raih Pendanaan \$10 Juta dari Investor Global',
      category: 'Teknologi',
      time: '1 hari lalu',
      imageUrl:
          'https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=800',
      categoryColor: const Color(0xFF3B82F6),
      author: 'Rudi Hartono',
      content:
          '''Sebuah startup teknologi asal Jakarta berhasil meraih pendanaan Series A sebesar 10 juta dolar AS dari investor global. Pendanaan ini akan digunakan untuk ekspansi ke pasar Asia Tenggara.

CEO startup tersebut menyatakan bahwa pencapaian ini merupakan validasi dari model bisnis yang telah dikembangkan selama 3 tahun terakhir. "Kami sangat bersyukur mendapat kepercayaan dari investor," ujarnya.

Platform yang dikembangkan startup ini fokus pada solusi digital untuk UKM Indonesia. Hingga saat ini, platform mereka telah digunakan oleh lebih dari 50,000 pelaku UKM di seluruh Indonesia.

Para ahli industri memprediksi bahwa startup ini berpotensi menjadi unicorn dalam 2-3 tahun ke depan jika mampu mempertahankan pertumbuhan yang konsisten.''',
    ),
  ];

  List<News> get filteredNews {
    if (selectedCategory == 'Semua') {
      return newsList;
    }
    return newsList.where((news) => news.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Modern Header with categories
        Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Kategori Berita',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildModernCategoryChip('Semua', Icons.grid_view_rounded),
                    _buildModernCategoryChip(
                        'Teknologi', Icons.computer_rounded),
                    _buildModernCategoryChip(
                        'Olahraga', Icons.sports_soccer_rounded),
                    _buildModernCategoryChip(
                        'Ekonomi', Icons.trending_up_rounded),
                    _buildModernCategoryChip(
                        'Kesehatan', Icons.favorite_rounded),
                    _buildModernCategoryChip(
                        'Berita Lokal', Icons.location_city_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),

        // News List
        Expanded(
          child: filteredNews.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article_outlined,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Belum ada berita',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredNews.length,
                  itemBuilder: (context, index) {
                    final news = filteredNews[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(news: news),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  Image.network(
                                    news.imageUrl,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 180,
                                        color:
                                            news.categoryColor.withOpacity(0.1),
                                        child: Center(
                                          child: Icon(
                                            Icons.image_outlined,
                                            size: 48,
                                            color: news.categoryColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: news.categoryColor,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: news.categoryColor
                                                .withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        news.category,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Content
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.schedule_rounded,
                                        size: 14,
                                        color: Colors.grey.shade500,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        news.time,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Container(
                                        width: 3,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Icon(
                                        Icons.person_outline_rounded,
                                        size: 14,
                                        color: Colors.grey.shade500,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          news.author,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildModernCategoryChip(String label, IconData icon) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black87 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.black87 : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.grey.shade700,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Modern App Bar dengan Image
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back_rounded, color: Colors.black87),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.bookmark_border_rounded,
                      color: Colors.black87),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Berita disimpan'),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.share_rounded, color: Colors.black87),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Berita dibagikan'),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    news.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: news.categoryColor.withOpacity(0.1),
                        child: Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 80,
                            color: news.categoryColor,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: news.categoryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: news.categoryColor.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            news.category,
                            style: TextStyle(
                              color: news.categoryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Title
                        Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            height: 1.3,
                            color: Color(0xFF1A1A1A),
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Meta Info
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person_rounded,
                                color: Colors.grey.shade700,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news.author,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.schedule_rounded,
                                        size: 13,
                                        color: Colors.grey.shade500,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        news.time,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Divider
                        Container(
                          height: 1,
                          color: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 24),

                        // Content
                        Text(
                          news.content,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.8,
                            color: Color(0xFF2A2A2A),
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
