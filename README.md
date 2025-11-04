# Tugas 7 PBP

# 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget. 
Jawab: Widget tree adalah susunan widget yang membentuk tampilan aplikasi Flutter. Setiap widget bisa punya anak (child) di dalamnya. Parent mengatur posisi dan tampilan anaknya, sedangkan child mengikuti struktur dari parent-nya.

# 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Jawab: Ada beberapa widget yang saya gunakan pada Tugas 7 ini. Widget tersebut yaitu MaterialApp (kerangka utama aplikasi), Scaffold (struktur halaman), AppBar (bagian atas dengan judul), Column dan Row (penyusun layout), Card dan Container (membuat tampilan kotak), GridView (menampilkan tombol dalam grid), Text, Icon, InkWell (agar tombol bisa ditekan), dan SnackBar (menampilkan pesan saat tombol ditekan).

# 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Jawab: MaterialApp digunakan untuk membuat aplikasi dengan gaya Material Design. Widget ini jadi root karena mengatur tema, warna, dan navigasi seluruh aplikasi.

# 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Jawab: StatelessWidget digunakan untuk tampilan yang tidak berubah, sedangkan StatefulWidget digunakan kalau tampilan bisa berubah karena interaksi atau data baru. Misalnya, teks biasa pakai StatelessWidget, tapi form input pakai StatefulWidget.

# 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Jawab: BuildContext menyimpan informasi posisi widget di dalam widget tree. Biasanya dipakai di metode build() untuk mengakses data, tema, atau menampilkan SnackBar dari Scaffold terdekat.

# 6.  Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Jawab: Hot reload memperbarui kode tanpa menghapus state aplikasi (cepat untuk lihat perubahan kecil).
Hot restart memulai ulang seluruh aplikasi dari awal, jadi semua state hilang.