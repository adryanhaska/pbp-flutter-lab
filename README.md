# Tugas 7
### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
- stateless widget adalah widget yang tidak memiliki state, artinya widget tersebut memiliki isi yang statis atau tidak dapat berubah
- stateful widget adalah widget yang memiliki state, artinya widget tersebut bersifat dinamis atau dapat berubah ubah sesuai dengan perintah yang diberikan

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `MaterialApp` : Widget untuk aplikasi Material
2. `Scaffold` : Widget untuk implementasi Material Design
3. `AppBar` : Widget untuk menambahkan bar di aplikasi
4. `Text` : Widget untuk menampilkan teks
5. `Center` : Widget untuk meletakan child di tengah - tengah parent
6. `Padding` : Widget untuk menambahkan padding
7. `Row` : Widget untuk layout Row
8. `FloatingActionButton` : Widget untuk menampilkan floating button yang dapat menjalankan action tertentu
9. `Spacer` : Widget untuk memberikan spasi
10. `Column` : Widget untuk layout column

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Untuk memberitahu framework bahwa ada nilai yang berubah. Pada implementasi counter di tugas ini, saat button memanggil fungsi yang berkaitan `setState()` dapat digunakan untuk menambahkan atau mengurangi nilai counter.

### Jelaskan perbedaan antara const dengan final.
`const` dan `final` sama-sama merupakan variabel yang _immutable_ atau tidak dapat diubah. Namun value pada `const` sudah diketahui atau _immutable_ sejak _compile time_ artinya atribut didalamnya tidak dapat diubah, berbeda dengan `final` yang masih dapat berubah. Sehingga `final` cocok digunakan apabila kita tidak mengetahui nilainya pada saat _compile time_.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. buat app baru dengan menjalankan `flutter create counter_7`
2. buat fungsi `_decrementCounter` yang dapat melakukan decrement nilai counter
    ```
    void _decrementCounter(){
        setState((){
          _counter--;
        });
      }
    ```
3. tambahkan button baru dan memasukannya di dalam satu row, buat juga kondisi ketika nilai counter = 0
    ```
    floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          children: <Widget>[
            if (_counter != 0)
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            const Spacer(),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    ```
4. buat kondisi yang menampilkan genap atau ganjil sesuai nilai counter, dan ubah juga style warnanya.
    ```
     _counter % 2 == 0 ?
                const Text(
                    "GENAP",
                  style: TextStyle(color: Colors.red),
                ):
                const Text(
                    "GANJIL",
                style: TextStyle(color: Colors.blue),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
    ```

# Tugas 8
### Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
Navigator pada flutter bekerja seperti struktur data stack, jadi untuk melakukan perpindahan logic kita dapat melakukan push navigator ke bagian stack paling atas, pushReplacemant bekerja sama seperti push namun pushReplacement mengganti stack paling atas tidak seperti push yang hanya menimpa.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Pada tugas 8 ini saya menggunakan widget widget yang sebelumnya saya telah gunakan pada tugas 7, namun saya juga menambahkan beberapa widget baru yang tidak ada di tugas 7 yaitu:
1. `Drawer` : Widget untuk melakukan navigasi
2. `Form` : Widget untuk implementasi Form
3. `ListTile` : Widget untuk menampung teks leading dan trailing
4. `Center` : Widget untuk menengahkan tampilan
5. `Datepicker` : Widget untuk memilih tanggal
6. `TeksStyle` : Widget untuk memberikan style pada teks
7. `DropDownBottonFormField` : Widget untuk membuat dropdown
8. `Card` : Widget untuk mengumpulkan data pada card
9. `TextInput` : Widget untuk input teks
10. `TextButton` : Widget untuk menampilkan button dengan teks

### Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
1. onPressed
2. onSaved
3. onTap
4. onChange

### Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator bekerja seperti struktur data stack. kaetika kita ingin mengganti halaman dari aplikasi flutter, yang kita lakukan adalah menimpa halaman tersebut atau menaruh halaman tersebut pada bagian atas stack (push), ketika ingin kembali ke halaman sebelumnya maka kita bisa menghilangkan halaman yang kita timpa sebelumnya (pop).

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. menambahkan drawer pada app yang telah dibuat sebelumnya
2. buat class yang menyimpan tipe data pada setiap input pada form
3. buat halaman form sesuai yang meminta judul, nominal, jenis, dan tanggal
4. buat halaman data yang menampilkan semua data yang telah di input pada Form, lalu tampilkan dengan card


# Tugas 9
### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Tetapi akan membuat prosesnya pengaksesannya menjadi lebih sulit. Sehingga lebih baik menggunakan model sebagai peratara sebelum melakukan pengambilan data JSON.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Pada tugas 9 ini saya menggunakan widget widget yang sebelumnya saya telah gunakan pada tugas 7 dan tugas 8, namun saya juga menambahkan beberapa widget baru yang tidak ada di tugas 7 dan tugas 8 yaitu:
1. `SizedBox` : Widget untuk membuat simple box dengan size tertentu
2. `Align` : Widget untuk Align child widget
3. `RichText` : Widget untuk menampilkan teks dengan style yang berbeda
4. `FutureBuilder` : Widget untuk menampilakn data yang diambil
5. `Checkbox` : Widget untuk menampilkan checkbox
6. `MaterialPageRoute` : Widget untuk route page
7. `GestureDetector` : Widget untuk mendeteksi adanya gesture seperti onTap()
8. `BoxDecoration` : Widget memberikan style bada box
9. `BoxShadow` : Widget untuk memberikan style pada shadow box

### Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
- buat model yang sesuai degan data json yang diambil
- ambil data menggunakan http get
- ubah data yang diambil ke dalam model yang sudah dibuat sebelumnya
- tampilkan data tersebut dengan widdget FutureBuilder

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. lakukan `flutter pub add http` pada project flutter untuk menambahkan package http
2. pisahkan file selain `main.dart` pada folder model atau folder page
3. buat model sesuai data json menggunakan bantuan [Quicktype](https://app.quicktype.io/)
4. aktifkan koneksi internet pada file `android/app/src/main/AndroidManifest.xml` dengan menambahkan kode
   ```
       <application>
       ...
       </application>
       <!-- Required to fetch data from the Internet. -->
       <uses-permission android:name="android.permission.INTERNET" />
   ```
5. ambil data json menggunakan http get
6. konfersi data ke model dengan melakukan fetch
7. tampilkan seluruh data dengan `FutureBuilder` pada halaman baru berisi seluruh watchlist
8. tambahkan beberapa widget untuk menampilkan halaman seperti pada contoh
9. buat halaman berisi detail dari mywatchlist dan tambahkan widget agar tampilan sesuai dengan contoh pada soal.
10. menambahkan routing ke halaman mywatchlist pada drawer
