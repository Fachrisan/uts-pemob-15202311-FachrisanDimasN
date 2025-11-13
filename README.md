# UTS PEMROGRAMAN MOBILE

**Nama:** Fachrisan Dimas N</br>
**NIM:** 152023111</br>
**Kelas:** AA

---

## Deskripsi Proyek

Aplikasi ini dikembangkan menggunakan Flutter sebagai bagian dari tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile. Flutter dipilih karena bersifat cross-platform, sehingga aplikasi dapat dijalankan di Android maupun iOS dengan satu basis kode.</br></br>

Proyek ini menerapkan berbagai widget, layout, dan navigasi yang umum digunakan dalam pengembangan aplikasi mobile modern, serta memanfaatkan stateful widget dan routing untuk mengelola transisi antar halaman.

---

## Fitur Aplikasi

### 1. Splash Screen

<p align="center">
  <img src="https://github.com/user-attachments/assets/889359cf-5044-4881-aa64-a784182e6571" width="250" alt="Splash Screen">
</p>

Halaman ini merupakan tampilan awal ketika aplikasi MYAPPS dijalankan. Splash screen berfungsi untuk memberikan identitas aplikasi serta memperkenalkan pengembang sebelum pengguna diarahkan ke halaman utama (dashboard).</br></br>

**Komponen:**</br>
- Judul Aplikasi ("MYAPPS") ditampilkan dengan ukuran font besar di bagian atas</br>
- Foto Pengembang dengan latar berwarna merah agar terlihat kontras dan menarik</br>
- Nama dan NIM: "Fachrisan Dimas N" dan "NIM: 152023111"</br>
- Keterangan "Mobile Programming" di bagian bawah layar</br>
- Indikator Loading berupa animasi sederhana</br>

---

### 2. Dashboard

<p align="center">
  <img src="https://github.com/user-attachments/assets/e91b0929-8ea3-4479-b90e-faca742c0c41" width="250" alt="Dashboard">
</p>

Halaman Dashboard merupakan tampilan utama setelah pengguna melewati splash screen. Halaman ini menjadi pusat navigasi dari seluruh fitur yang ada dalam aplikasi MYAPPS.</br></br>

**Menu Utama:**</br>
- Biodata</br>
- Kontak</br>
- Kalkulator</br>
- Cuaca</br>
- Berita</br></br>

**Komponen:**</br>
- Bottom Navigation Bar dengan ikon menu utama</br>
- AppBar menampilkan nama halaman aktif</br>
- Body menampilkan konten dinamis sesuai menu yang dipilih</br>

---

### 3. Biodata

<p align="center">
  <img src="https://github.com/user-attachments/assets/e0aa6dfb-2e9f-4d2b-9829-5ae5c4620b40" width="250" alt="Biodata">
</p>

Halaman Biodata menampilkan informasi pribadi pengembang aplikasi secara lengkap dan terstruktur.</br></br>

**Komponen:**</br>
- Foto Profil menggunakan CircleAvatar</br>
- Informasi Pribadi: Nama Lengkap, NIM, Program Studi, Email, Alamat</br>
- Formulir Interaktif:</br>
  - Dropdown Menu untuk memilih jurusan atau program studi</br>
  - Radio Button untuk memilih jenis kelamin</br>
  - TextField untuk menulis alamat atau hobi</br>
  - Date Picker untuk memilih tanggal lahir</br>

---

### 4. Kontak

<p align="center">
  <img src="https://github.com/user-attachments/assets/1047acb7-8963-46eb-b1c3-cbc9e531d2cc" width="250" alt="Kontak">
</p>

Halaman Kontak menampilkan daftar kontak yang tersimpan secara statis di dalam aplikasi.</br></br>

**Komponen:**</br>
- AppBar dengan judul "Kontak"</br>
- Search Bar untuk mencari kontak berdasarkan nama</br>
- Filter dan Tombol:</br>
  - Semua: menampilkan seluruh daftar kontak</br>
  - Favorit: menampilkan kontak yang diberi tanda bintang</br>
  - Tambah: untuk menambah kontak baru</br>
- Daftar Kontak dengan ListView</br>
- Circle Avatar untuk menampilkan inisial nama</br></br>

**Halaman Detail Kontak:**</br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/3a78f7b2-2fcb-4489-a253-463edfa661fe" width="250" alt="Detail Kontak">
</p>

- Nama dan Status Online</br>
- Tombol Aksi: Pesan, Telepon, dan Video</br>
- Nomor Telepon dan Email dalam bentuk card</br>

---

### 5. Kalkulator

<p align="center">
  <img src="https://github.com/user-attachments/assets/05f41a13-fb7e-413b-9ee0-4d35046b2e83" width="250" alt="Kalkulator">
</p>

Halaman Kalkulator untuk melakukan perhitungan matematika dasar seperti penjumlahan, pengurangan, perkalian, dan pembagian.</br></br>

**Komponen:**</br>
- Layar Tampilan (Display Area) untuk menampilkan angka input dan hasil</br>
- Tombol Operasi dan Angka:</br>
  - Angka 0–9</br>
  - Operasi: +, −, ×, ÷, =</br>
  - Fungsi tambahan: x², √, AC, dan hapus</br>
- Mode History untuk menyimpan hasil perhitungan sebelumnya</br>
- Bottom Navigation Bar</br>

---

### 6. Cuaca

<p align="center">
  <img src="https://github.com/user-attachments/assets/9ee20e3a-df2f-4837-85d9-184e20c7fc4b" width="250" alt="Cuaca">
</p>

Halaman Cuaca menampilkan informasi kondisi cuaca terkini berdasarkan lokasi pengguna dengan warna biru gradasi.</br></br>

**Komponen:**</br>
- Informasi Lokasi dengan dropdown untuk memilih wilayah</br>
- Informasi Cuaca Utama:</br>
  - Ikon cuaca</br>
  - Suhu utama (contoh: 28°C)</br>
  - Deskripsi singkat (contoh: "Cerah Berawan")</br>
- Detail Kondisi Cuaca:</br>
  - Kelembapan: 65%</br>
  - Kecepatan Angin: 12 km/h</br>
  - Jarak Pandang: 10 km</br>
- Data Wilayah Lain</br>
- Prediksi Cuaca 7 hari ke depan dan prediksi per jam</br>

---

### 7. Berita

<p align="center">
  <img src="https://github.com/user-attachments/assets/38485884-7568-4e8a-b053-fd03b2d59b63" width="250" alt="Berita">
</p>

Halaman Berita menampilkan berbagai artikel dan informasi terkini berdasarkan kategori tertentu.</br></br>

**Komponen:**</br>
- Kategori Berita: Semua, Teknologi, dan Olahraga</br>
- Daftar Berita dengan news card:</br>
  - Judul singkat artikel</br>
  - Waktu rilis dan nama penulis</br></br>

**Halaman Detail Berita:**</br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/d6cd239b-c0f5-44e6-9282-fc410b26eb2e" width="250" alt="Detail Berita">
</p>

- Isi artikel lengkap dengan gambar utama</br>
- Nama penulis dan waktu publikasi</br>
- Tombol bookmark dan share</br>

---

## Teknologi yang Digunakan

- **Flutter**: Framework utama untuk pengembangan aplikasi</br>
- **Dart**: Bahasa pemrograman</br>
- **Stateful Widget**: Untuk mengelola state aplikasi</br>
- **Bottom Navigation Bar**: Untuk navigasi antar halaman</br>
- **ListView**: Untuk menampilkan daftar data</br>
- **TextField, Dropdown, Radio Button**: Untuk input form</br>
- **Date Picker**: Untuk pemilihan tanggal</br>

---

## Cara Menjalankan Aplikasi

1. Pastikan Flutter sudah terinstall di sistem Anda</br>
2. Clone repository ini</br>
3. Jalankan `flutter pub get` untuk menginstall dependencies</br>
4. Jalankan `flutter run` untuk menjalankan aplikasi</br>

---

## Lisensi

Proyek ini dibuat untuk keperluan akademis mata kuliah Pemrograman Mobile.

---

## Kontak

**Fachrisan Dimas N**</br>
NIM: 152023111</br>
Kelas: AA
