UTS PEMOGRAMAN MOBILE
Nama : Fachrisan Dimas N
NIM " 152023111
Kelas : AA

Aplikasi ini dikembangkan menggunakan Flutter sebagai bagian dari tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile. Flutter dipilih karena bersifat cross-platform, sehingga aplikasi dapat dijalankan di Android maupun iOS dengan satu basis kode. Proyek ini menerapkan berbagai widget, layout, dan navigasi yang umum digunakan dalam pengembangan aplikasi mobile modern, serta memanfaatkan stateful widget dan routing untuk mengelola transisi antar halaman.

Fitur Aplikasi

- Splash Screen
- Dashboard
- Biodata
- Kontak
- Kalkulator
- Cuaca
-Berita

1.  Splash Screen
<p align="center">
  <img src="https://github.com/user-attachments/assets/889359cf-5044-4881-aa64-a784182e6571" width="250" alt="Splash Screen">
</p>
Halaman ini merupakan tampilan awal ketika aplikasi MYAPPS dijalankan. Splash screen berfungsi untuk memberikan identitas aplikasi serta memperkenalkan pengembang sebelum pengguna diarahkan ke halaman utama (dashboard).
Pada tampilan ini, terdapat beberapa elemen utama, yaitu:
- Judul Aplikasi (“MYAPPS”)
  Ditampilkan dengan ukuran font besar di bagian atas untuk memperjelas nama aplikasi.
-Foto Pengembang
  Menampilkan gambar diri sebagai identitas pembuat aplikasi. Foto ditempatkan di tengah dengan latar berwarna merah agar terlihat kontras dan menarik.
-Nama dan NIM
  Ditampilkan di bawah foto, dengan teks “Fachrisan Dimas N” dan “NIM: 15202311” untuk menunjukkan data pribadi pembuat aplikasi.
-Keterangan “Mobile Programming”
  Diletakkan di bagian bawah layar sebagai informasi tambahan bahwa aplikasi ini dibuat untuk mata kuliah Pemrograman Mobile.
  Indikator Loading
  Berupa animasi sederhana yang menunjukkan bahwa aplikasi sedang dalam proses pemuatan menuju halaman berikutnya.
  
2. Dashboard
<p align="center">
  <img src="https://github.com/user-attachments/assets/e91b0929-8ea3-4479-b90e-faca742c0c41" width="250" alt="Splash Screen">
</p>
Halaman Dashboard merupakan tampilan utama setelah pengguna melewati splash screen. Halaman ini menjadi pusat navigasi dari seluruh fitur yang ada dalam aplikasi MYAPPS.
Pada halaman dashboard, pengguna dapat mengakses berbagai menu utama yang telah ditentukan dalam ketentuan tugas UTS, yaitu:
-Biodata
-Kontak
-Kalkulator
-Cuaca
-Berita
Setiap menu diakses menggunakan Bottom Navigation Bar, di mana setiap ikon mewakili satu halaman atau fragment yang berbeda. Pendekatan ini digunakan agar navigasi antar halaman lebih mudah dan efisien tanpa harus berpindah activity.
Komponen Utama:
-Bottom Navigation Bar
  Berisi ikon-ikon menu utama seperti profil (Biodata), kontak, kalkulator, cuaca, dan berita.
  Setiap tombol akan mengarahkan pengguna ke halaman yang berbeda sesuai fungsinya.
-AppBar / Judul Halaman
  Menampilkan nama halaman aktif di bagian atas, misalnya “Dashboard”, “Biodata”, atau “Kontak”, sehingga pengguna tahu sedang berada di menu mana.
-Body / Konten Utama
  Bagian ini menampilkan tampilan dinamis sesuai menu yang dipilih. Misalnya, ketika pengguna menekan ikon kalkulator, maka area konten menampilkan tampilan kalkulator sederhana.
  
3.  Biodata
<p align="center">
  <img src="https://github.com/user-attachments/assets/e0aa6dfb-2e9f-4d2b-9829-5ae5c4620b40" width="250" alt="Splash Screen">
</p>
Halaman Biodata digunakan untuk menampilkan informasi pribadi pengembang aplikasi secara lengkap dan terstruktur. Halaman ini menjadi salah satu menu utama pada dashboard aplikasi MYAPPS.
Tampilan dirancang agar informatif dan menarik, dengan memanfaatkan berbagai widget interaktif Flutter seperti TextField, DropdownButton, RadioListTile, dan DatePicker.
Komponen Utama:
-Foto Profil
  Menampilkan foto pengembang di bagian atas halaman sebagai identitas utama. Foto biasanya berbentuk lingkaran menggunakan widget CircleAvatar agar tampil modern dan simetris.
-Informasi Pribadi (Static Text)
  Menampilkan data dasar seperti:
  -Nama Lengkap
  -NIM
  -Program Studi
  -Email
  -Alamat
-Formulir Interaktif (Input Data)
  Terdapat beberapa elemen input yang dapat diisi pengguna, seperti:
  -Dropdown Menu untuk memilih jurusan atau program studi.
  -Radio Button untuk memilih jenis kelamin.
  -TextField untuk menulis alamat atau hobi.
  -Date Picker untuk memilih tanggal lahir.

4.  Kontak
<p align="center">
  <img src="https://github.com/user-attachments/assets/1047acb7-8963-46eb-b1c3-cbc9e531d2cc" width="250" alt="Splash Screen">
</p>
Halaman Kontak berfungsi untuk menampilkan daftar kontak yang tersimpan secara statis di dalam aplikasi. Fitur ini dibuat untuk melatih kemampuan menampilkan data berbentuk daftar (list) dan mengelola tampilan dinamis dengan elemen interaktif.
-Komponen Utama:
  AppBar (Judul Halaman)
  Menampilkan teks “Kontak” di bagian atas layar sebagai penanda halaman aktif.
-Search Bar
  Kolom pencarian yang memungkinkan pengguna untuk mencari kontak berdasarkan nama.
  (Fitur bersifat statis — pencarian belum terhubung ke data dinamis.)
-Filter dan Tombol Tambah
  Terdapat tiga tombol utama di bawah kolom pencarian:
  Semua: menampilkan seluruh daftar kontak.
  Favorit: menampilkan kontak yang diberi tanda bintang (★).
  + Tambah: untuk menambah kontak baru (fungsi belum dinamis).
-Daftar Kontak (List View)
  Menampilkan data kontak seperti nama, inisial, dan status terakhir (misalnya “Online”, “5 menit lalu”, atau “1 jam lalu”).
  Setiap item daftar menggunakan tampilan Circle Avatar untuk menampilkan inisial nama kontak dengan desain sederhana dan rapi.
-Ikon Favorit (★)
  Menandai kontak penting yang ditampilkan di bagian “Favorit”.
Halaman Detail Kontak
<p align="center">
  <img src="https://github.com/user-attachments/assets/3a78f7b2-2fcb-4489-a253-463edfa661fe" width="250" alt="Splash Screen">
</p>
Ketika salah satu kontak diklik, pengguna diarahkan ke halaman Detail Kontak.
Halaman ini berisi informasi lebih lengkap, antara lain:
-Nama dan Status Online
-Tombol Aksi: Pesan, Telepon, dan Video (ikon interaktif menggunakan button widget).
-Nomor Telepon dan Email dalam bentuk card agar mudah dibaca.
-Tampilan dibuat dengan konsep user-friendly, memanfaatkan ListV
5.  Kalkulator
<p align="center">
  <img src="https://github.com/user-attachments/assets/05f41a13-fb7e-413b-9ee0-4d35046b2e83" width="250" alt="Splash Screen">
</p>
Halaman Kalkulator digunakan untuk melakukan perhitungan matematika dasar seperti penjumlahan, pengurangan, perkalian, dan pembagian. Tampilan dibuat sederhana dengan kombinasi warna gelap dan tombol berwarna agar mudah dibedakan.
Komponen Utama:
 -Layar Tampilan (Display Area)
  Menampilkan angka input dan hasil perhitungan secara real-time.
 -Tombol Operasi dan Angka
  Terdiri dari tombol angka 0–9, serta tombol operasi seperti +, −, ×, ÷, =, dan beberapa fungsi tambahan seperti x², √, AC, dan hapus.
 -Navigasi Bawah (Bottom Navigation Bar)
  Berisi menu utama: Biodata, Kontak, Kalkulator, Cuaca, dan Berita. Menu Kalkulator aktif ditandai dengan warna biru.
 -Mode History
  Aplikasi memiliki mode history, yang berfungsi menyimpan hasil perhitungan sebelumnya agar pengguna dapat melihat kembali riwayat operasi yang telah dilakukan.
6.  Cuaca
<p align="center">
  <img src="https://github.com/user-attachments/assets/9ee20e3a-df2f-4837-85d9-184e20c7fc4b" width="250" alt="Splash Screen">
</p>
Halaman Cuaca digunakan untuk menampilkan informasi kondisi cuaca terkini berdasarkan lokasi pengguna. Tampilan halaman ini dibuat dengan warna biru gradasi agar mencerminkan suasana langit dan mudah dikenali.
Komponen Utama:
 -Informasi Lokasi
  Menampilkan nama kota, misalnya Bandung, Indonesia, yang dapat diganti sesuai lokasi pengguna. Lokasi ditampilkan dalam bentuk dropdown agar pengguna bisa memilih wilayah lain.
 -Informasi Cuaca Utama
  Bagian tengah menampilkan ikon cuaca (misalnya matahari untuk cuaca cerah) disertai suhu utama, seperti 28°C, dan deskripsi singkat “Cerah Berawan.”
 -Detail Kondisi Cuaca
  Menampilkan data tambahan seperti:
  -Kelembapan: 65%
  -Kecepatan Angin: 12 km/h
  -Jarak Pandang: 10 km
 -Data Wilayah Lain
  Di dalam halaman ini juga tersedia informasi cuaca untuk beberapa wilayah berbeda, sehingga pengguna dapat memantau kondisi di berbagai kota.
 -Prediksi Cuaca
  Aplikasi menampilkan perkiraan cuaca 7 hari ke depan dan juga prediksi setiap jamnya, membantu pengguna untuk mengetahui perubahan suhu dan kondisi secara lebih detail.
7.  Berita
<p align="center">
  <img src="https://github.com/user-attachments/assets/38485884-7568-4e8a-b053-fd03b2d59b63" width="250" alt="Splash Screen">
</p>
Halaman Berita digunakan untuk menampilkan berbagai artikel dan informasi terkini berdasarkan kategori tertentu. Halaman ini dirancang agar informatif dan mudah diakses oleh pengguna melalui tampilan daftar berita yang rapi.
Komponen Utama:
 -Kategori Berita
  Bagian atas halaman berisi pilihan kategori seperti Semua, Teknologi, dan Olahraga. Pengguna dapat memilih kategori sesuai minat untuk memfilter berita yang ditampilkan.
 -Daftar Berita
  Menampilkan beberapa kartu berita (news card) lengkap dengan:
  Judul singkat artikel, seperti “Teknologi AI Terbaru Mengubah Industri Digital Indonesia”.
  Waktu rilis (contoh: 2 jam lalu) dan nama penulis (contoh: Budi Santoso).
 -Halaman Detail Berita
 <p align="center">
  <img src="https://github.com/user-attachments/assets/d6cd239b-c0f5-44e6-9282-fc410b26eb2e" width="250" alt="Splash Screen">
</p>
  Saat salah satu berita dipilih, pengguna diarahkan ke halaman detail yang menampilkan isi artikel secara lengkap beserta gambar utama, nama penulis, waktu publikasi, dan tombol untuk menyimpan (bookmark) atau    membagikan (share) berita.

  
