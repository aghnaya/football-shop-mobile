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

###
# Tugas 8 PBP

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Jawab: 
- Navigator.push() digunakan jika ingin berpindah ke halaman baru tanpa menghilangkan halaman sebelumnya. Jadi, pengguna masih bisa kembali ke halaman sebelumnya dengan tombol back. Pada aplikasi Football Shop ini, digunakan ketika pengguna menekan kartu “Create Product” dari halaman utama, pengguna bisa kembali ke halaman utama setelah selesai mengisi form.
- Navigator.pushReplacement() digunakan jika ingin mengganti halaman saat ini dengan halaman yang baru, sehingga pengguna tidak akan kembali ke halaman sebelumnya. Di aplikasi ini, hal ini digunakan pada menu yang ada di Drawer. Misalnya, saat berpindah dari Drawer ke halaman utama. 

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Jawab:
Pada aplikasi ini, Scaffold dimanfaatkan sebagai kerangka dasar untuk setiap halaman. Scaffold menyediakan struktur yang standar seperti area AppBar, Drawer, dan body. AppBar digunakan untuk menampilkan judul halaman yang konsisten di berbagai halaman. Drawer berfungsi sebagai menu samping agar pengguna dapat berpindah antar halaman dengan mudah.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Jawab:
- Padding membantu memberikan ruang antar elemen sehingga tampilan tidak terasa sempit. 
- SingleChildScrollView digunakan agar halaman dapat di-scroll ketika kontennya melebihi tinggi layar, terutama ketika keyboard muncul. 
- ListView digunakan untuk menata elemen-elemen form secara vertikal dan responsif, tanpa harus mengatur satu per satu tinggi komponen.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Jawab:
Untuk menjaga identitas yang konsisten, digunakan ThemeData dan ColorScheme. Dengan menentukan warna utama sebagai warna dasar dari Football Shop, dan diterapkan juga pada tombol-tombol yang ada. Dengan menyesuaikan ini, aplikasi terlihat konsisten.
