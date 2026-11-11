## Instalasi

Langkah pertama adalah menginstal Rust. Kita akan mengunduh Rust melalui `rustup`, sebuah command line tool untuk mengelola versi Rust dan tools terkait. Anda memerlukan koneksi internet untuk mengunduhnya.

> Catatan: Jika karena alasan tertentu Anda memilih untuk tidak menggunakan `rustup`, silakan lihat halaman [Metode Instalasi Rust Lainnya][otherinstall] untuk mengetahui pilihan lainnya.

Langkah-langkah berikut akan menginstal versi stable terbaru dari Rust compiler. Jaminan stabilitas Rust memastikan bahwa semua contoh dalam buku ini yang berhasil dikompilasi akan tetap dapat dikompilasi dengan versi Rust yang lebih baru. Output mungkin sedikit berbeda antarversi karena Rust sering meningkatkan pesan error dan peringatan. Dengan kata lain, versi stable Rust yang lebih baru dan Anda instal menggunakan langkah-langkah ini seharusnya dapat digunakan dengan baik bersama materi dalam buku ini.

> ### Notasi Command Line
>
> Dalam bab ini dan sepanjang buku, kita akan menampilkan beberapa perintah yang digunakan di terminal. Baris yang harus Anda masukkan ke terminal selalu diawali dengan `$`. Anda tidak perlu mengetik karakter `$` tersebut; karakter itu merupakan command line prompt yang menunjukkan awal setiap perintah. Baris yang tidak diawali dengan `$` biasanya menampilkan output dari perintah sebelumnya. Selain itu, contoh khusus PowerShell akan menggunakan `>` sebagai pengganti `$`.

### Menginstal `rustup` di Linux atau macOS

Jika Anda menggunakan Linux atau macOS, buka terminal dan masukkan perintah berikut:

```console
$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

Perintah tersebut mengunduh sebuah script dan memulai instalasi tools `rustup`, yang akan menginstal versi stable terbaru dari Rust. Anda mungkin akan diminta memasukkan password. Jika instalasi berhasil, baris berikut akan muncul:

```text
Rust is installed now. Great!
```

Anda juga memerlukan _linker_, yaitu program yang digunakan Rust untuk menggabungkan hasil kompilasi menjadi satu file. Kemungkinan besar Anda sudah memilikinya. Jika mengalami error terkait linker, Anda perlu menginstal C compiler, yang biasanya sudah menyertakan linker. C compiler juga berguna karena beberapa package Rust yang umum digunakan bergantung pada kode C dan memerlukan C compiler.

Di macOS, Anda dapat memperoleh C compiler dengan menjalankan:

```console
$ xcode-select --install
```

Pengguna Linux umumnya perlu menginstal GCC atau Clang sesuai dengan dokumentasi distribusi Linux yang digunakan. Sebagai contoh, jika Anda menggunakan Ubuntu, Anda dapat menginstal package `build-essential`.

### Menginstal `rustup` di Windows

Di Windows, buka [https://www.rust-lang.org/tools/install][install]<!-- ignore
--> dan ikuti petunjuk untuk menginstal Rust. Pada salah satu tahap instalasi, Anda akan diminta untuk menginstal Visual Studio. Visual Studio menyediakan linker dan native libraries yang diperlukan untuk mengompilasi program. Jika Anda membutuhkan bantuan lebih lanjut untuk langkah ini, lihat
[https://rust-lang.github.io/rustup/installation/windows-msvc.html][msvc]<!--
ignore -->.

Bagian selanjutnya dari buku ini menggunakan perintah yang dapat dijalankan di _cmd.exe_ maupun PowerShell. Jika terdapat perbedaan khusus, kami akan menjelaskan perintah mana yang harus digunakan.

### Pemecahan Masalah

Untuk memeriksa apakah Rust telah terinstal dengan benar, buka shell dan masukkan baris berikut:

```console
$ rustc --version
```

Anda seharusnya melihat nomor versi, commit hash, dan tanggal commit untuk versi stable terbaru yang telah dirilis, dengan format berikut:

```text
rustc x.y.z (abcabcabc yyyy-mm-dd)
```

Jika informasi tersebut muncul, berarti Rust berhasil diinstal! Jika informasi tersebut tidak muncul, periksa apakah Rust sudah tercantum dalam system variable `%PATH%` Anda seperti berikut.

Di Windows CMD, gunakan:

```console
> echo %PATH%
```

Di PowerShell, gunakan:

```powershell
> echo $env:Path
```

Di Linux dan macOS, gunakan:

```console
$ echo $PATH
```

Jika semuanya sudah benar tetapi Rust masih belum berfungsi, ada beberapa tempat yang dapat Anda kunjungi untuk mendapatkan bantuan. Cari tahu cara menghubungi Rustaceans lainnya (julukan unik yang kami gunakan untuk menyebut diri kami sendiri) melalui [halaman komunitas][community].

### Memperbarui dan Menghapus Instalasi

Setelah Rust diinstal melalui `rustup`, memperbaruinya ke versi terbaru yang baru dirilis sangatlah mudah. Dari shell, jalankan script pembaruan berikut:

```console
$ rustup update
```

Untuk menghapus Rust dan `rustup`, jalankan script penghapusan instalasi berikut dari shell:

```console
$ rustup self uninstall
```

<!-- Old headings. Do not remove or links may break. -->
<a id="local-documentation"></a>

### Membaca Dokumentasi Lokal

Instalasi Rust juga menyertakan salinan dokumentasi lokal sehingga Anda dapat membacanya secara offline. Jalankan `rustup doc` untuk membuka dokumentasi lokal di browser.

Setiap kali sebuah tipe atau fungsi disediakan oleh standard library dan Anda tidak yakin apa kegunaannya atau bagaimana cara menggunakannya, gunakan dokumentasi application programming interface (API) untuk mencari tahu!

<!-- Old headings. Do not remove or links may break. -->
<a id="text-editors-and-integrated-development-environments"></a>

### Menggunakan Text Editor dan IDE

Buku ini tidak mengharuskan Anda menggunakan tools tertentu untuk menulis kode Rust. Hampir semua text editor dapat digunakan untuk menyelesaikan pekerjaan tersebut! Namun, banyak text editor dan integrated development environment (IDE) telah menyediakan dukungan bawaan untuk Rust. Anda dapat menemukan daftar berbagai editor dan IDE yang cukup terbaru di [halaman tools][tools] pada situs web Rust.

### Bekerja Secara Offline dengan Buku Ini

Dalam beberapa contoh, kita akan menggunakan package Rust di luar standard library. Untuk mengikuti contoh-contoh tersebut, Anda perlu memiliki koneksi internet atau sudah mengunduh dependensi yang diperlukan sebelumnya. Untuk mengunduh dependensi terlebih dahulu, Anda dapat menjalankan perintah berikut. (Kita akan menjelaskan apa itu `cargo` dan fungsi setiap perintah ini secara lebih terperinci nanti.)

<!-- When updating the version of `rand` used, also update the version of
`rand` used in these files so they all match:

* ch02-00-guessing-game-tutorial.md
* ch07-04-bringing-paths-into-scope-with-the-use-keyword.md
* ch14-03-cargo-workspaces.md
-->

```console
$ cargo new get-dependencies
$ cd get-dependencies
$ cargo add rand@0.10.1 trpl@0.2.0
```

Perintah tersebut akan menyimpan unduhan package ini ke dalam cache sehingga Anda tidak perlu mengunduhnya lagi nanti. Setelah menjalankan perintah ini, Anda tidak perlu menyimpan folder `get-dependencies`. Jika sudah menjalankan perintah tersebut, Anda dapat menggunakan flag `--offline` pada semua perintah `cargo` di bagian selanjutnya dari buku ini untuk menggunakan versi yang tersimpan dalam cache, alih-alih mencoba mengakses jaringan.

[otherinstall]: https://forge.rust-lang.org/infra/other-installation-methods.html
[install]: https://www.rust-lang.org/tools/install
[msvc]: https://rust-lang.github.io/rustup/installation/windows-msvc.html
[community]: https://www.rust-lang.org/community
[tools]: https://www.rust-lang.org/tools
