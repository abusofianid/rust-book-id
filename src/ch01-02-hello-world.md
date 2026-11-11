## Hello, World!

Sekarang setelah Anda menginstal Rust, saatnya menulis program Rust pertama Anda. Dalam mempelajari bahasa pemrograman baru, sudah menjadi tradisi untuk menulis program sederhana yang menampilkan teks `Hello, world!` di layar. Jadi, kita akan melakukan hal yang sama di sini!

> Catatan: Buku ini mengasumsikan bahwa Anda memiliki pemahaman dasar tentang command line. Rust tidak menetapkan persyaratan khusus terkait editor, tools, atau lokasi penyimpanan kode Anda. Jadi, jika Anda lebih suka menggunakan IDE daripada command line, silakan gunakan IDE favorit Anda. Saat ini, banyak IDE telah menyediakan dukungan Rust dalam berbagai tingkat. Periksa dokumentasi IDE yang Anda gunakan untuk mengetahui detailnya. Tim Rust berfokus pada penyediaan dukungan IDE yang baik melalui `rust-analyzer`. Lihat [Lampiran D][devtools]<!-- ignore --> untuk informasi lebih lanjut.

<!-- Old headings. Do not remove or links may break. -->
<a id="creating-a-project-directory"></a>

### Menyiapkan Direktori Project

Pertama, Anda akan membuat direktori untuk menyimpan kode Rust. Rust tidak mempermasalahkan lokasi penyimpanan kode Anda. Namun, untuk latihan dan project dalam buku ini, kami menyarankan Anda membuat direktori _projects_ di home directory dan menyimpan semua project di sana.

Buka terminal dan masukkan perintah berikut untuk membuat direktori _projects_ serta direktori untuk project “Hello, world!” di dalam direktori _projects_ tersebut.

Untuk Linux, macOS, dan PowerShell di Windows, masukkan:

```console
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```

Untuk Windows CMD, masukkan:

```cmd
> mkdir "%USERPROFILE%\projects"
> cd /d "%USERPROFILE%\projects"
> mkdir hello_world
> cd hello_world
```

<!-- Old headings. Do not remove or links may break. -->
<a id="writing-and-running-a-rust-program"></a>

<a id="rust-program-basics"></a>
### Dasar-Dasar Program Rust

Selanjutnya, buat file source code baru dan beri nama _main.rs_. File Rust selalu diakhiri dengan ekstensi _.rs_. Jika nama file Anda terdiri dari lebih dari satu kata, konvensi yang digunakan adalah memisahkan setiap kata dengan underscore. Sebagai contoh, gunakan _hello_world.rs_ daripada _helloworld.rs_.

Sekarang, buka file _main.rs_ yang baru saja Anda buat dan masukkan kode pada Listing 1-1.

<Listing number="1-1" file-name="main.rs" caption="Program yang menampilkan `Hello, world!`">

```rust
fn main() {
    println!("Hello, world!");
}
```

</Listing>

Simpan file tersebut, lalu kembali ke jendela terminal di direktori _~/projects/hello_world_. Di Linux atau macOS, masukkan perintah berikut untuk mengompilasi dan menjalankan file tersebut:

```console
$ rustc main.rs
$ ./main
Hello, world!
```

Di Windows, masukkan perintah `.\main` sebagai pengganti `./main`:

```powershell
> rustc main.rs
> .\main
Hello, world!
```

Apa pun sistem operasi yang Anda gunakan, teks `Hello, world!` seharusnya muncul di terminal. Jika output tersebut tidak muncul, lihat kembali bagian [“Pemecahan Masalah”][troubleshooting]<!-- ignore --> pada bagian Instalasi untuk mengetahui cara mendapatkan bantuan.

Jika `Hello, world!` berhasil ditampilkan, selamat! Anda secara resmi telah menulis program Rust. Itu berarti Anda sekarang adalah seorang programmer Rust—selamat bergabung!

<!-- Old headings. Do not remove or links may break. -->

<a id="anatomy-of-a-rust-program"></a>

### Anatomi Program Rust

Mari kita tinjau program “Hello, world!” ini secara lebih terperinci. Berikut bagian pertama dari program tersebut:

```rust
fn main() {

}
```

Baris-baris ini mendefinisikan sebuah function bernama `main`. Function `main` memiliki keistimewaan: function ini selalu menjadi kode pertama yang dijalankan dalam setiap program Rust yang dapat dieksekusi. Di sini, baris pertama mendeklarasikan function bernama `main` yang tidak memiliki parameter dan tidak mengembalikan nilai apa pun. Jika terdapat parameter, parameter tersebut akan ditulis di dalam tanda kurung (`()`).

Body function dibungkus dengan `{}`. Rust mewajibkan penggunaan kurung kurawal pada semua body function. Sebaiknya, kurung kurawal pembuka ditempatkan pada baris yang sama dengan deklarasi function, dengan satu spasi di antaranya.

> Catatan: Jika Anda ingin menerapkan gaya penulisan kode yang konsisten di seluruh project Rust, Anda dapat menggunakan tools formatter otomatis bernama `rustfmt` untuk memformat kode sesuai gaya tertentu (pembahasan lebih lanjut tentang `rustfmt` terdapat di [Lampiran D][devtools]<!-- ignore -->). Tim Rust telah menyertakan tools ini dalam distribusi standar Rust, sebagaimana `rustc`, sehingga seharusnya sudah terinstal di komputer Anda!

Body dari function `main` berisi kode berikut:

```rust
println!("Hello, world!");
```

Baris ini melakukan seluruh pekerjaan dalam program sederhana ini: menampilkan teks ke layar. Ada tiga hal penting yang perlu diperhatikan di sini.

Pertama, `println!` memanggil sebuah macro Rust. Jika yang dipanggil adalah sebuah function, penulisannya akan menjadi `println` (tanpa `!`). Macro Rust merupakan cara untuk menulis kode yang menghasilkan kode guna memperluas sintaks Rust. Kita akan membahasnya secara lebih terperinci di [Chapter 20][ch20-macros]<!-- ignore -->. Untuk saat ini, Anda hanya perlu mengetahui bahwa penggunaan `!` berarti Anda sedang memanggil macro, bukan function biasa, dan macro tidak selalu mengikuti aturan yang sama seperti function.

Kedua, Anda melihat string `"Hello, world!"`. Kita meneruskan string ini sebagai argument ke `println!`, lalu string tersebut ditampilkan di layar.

Ketiga, kita mengakhiri baris dengan titik koma (`;`), yang menandakan bahwa expression ini telah selesai dan expression berikutnya siap dimulai. Sebagian besar baris kode Rust diakhiri dengan titik koma.

<!-- Old headings. Do not remove or links may break. -->
<a id="compiling-and-running-are-separate-steps"></a>

### Kompilasi dan Eksekusi

Anda baru saja menjalankan program yang baru dibuat. Jadi, mari kita periksa setiap langkah dalam proses tersebut.

Sebelum menjalankan program Rust, Anda harus mengompilasinya menggunakan Rust compiler dengan memasukkan perintah `rustc` dan memberikan nama file source code Anda, seperti berikut:

```console
$ rustc main.rs
```

Jika Anda memiliki latar belakang Bahasa C atau C++, Anda mungkin menyadari bahwa proses ini mirip dengan `gcc` atau `clang`. Setelah berhasil dikompilasi, Rust akan menghasilkan sebuah binary executable.

Di Linux, macOS, dan PowerShell pada Windows, Anda dapat melihat file executable tersebut dengan memasukkan perintah `ls` di shell:

```console
$ ls
main  main.rs
```

Di Linux dan macOS, Anda akan melihat dua file. Dengan PowerShell di Windows, Anda akan melihat tiga file yang sama seperti jika menggunakan CMD. Jika menggunakan CMD di Windows, masukkan perintah berikut:

```cmd
> dir /B %= the /B option says to only show the file names =%
main.exe
main.pdb
main.rs
```

Perintah tersebut menampilkan file source code dengan ekstensi _.rs_, file executable (_main.exe_ di Windows, sedangkan _main_ di semua platform lainnya), dan, jika menggunakan Windows, sebuah file yang berisi debugging information dengan ekstensi _.pdb_. Dari sini, Anda dapat menjalankan file _main_ atau _main.exe_ seperti berikut:

```console
$ ./main # or .\main on Windows
```

Jika file _main.rs_ Anda berisi program “Hello, world!”, baris ini akan menampilkan `Hello, world!` di terminal.

Jika Anda lebih terbiasa dengan bahasa dynamic, seperti Ruby, Python, atau JavaScript, mungkin Anda belum terbiasa mengompilasi dan menjalankan program sebagai dua langkah yang terpisah. Rust adalah bahasa yang _ahead-of-time compiled_, yang berarti Anda dapat mengompilasi sebuah program dan memberikan file executable-nya kepada orang lain, sehingga mereka dapat menjalankannya meskipun Rust belum terinstal di komputer mereka. Jika Anda memberikan file _.rb_, _.py_, atau _.js_ kepada seseorang, mereka masing-masing harus memiliki implementasi Ruby, Python, atau JavaScript yang terinstal. Namun, dalam bahasa-bahasa tersebut, Anda hanya memerlukan satu perintah untuk mengompilasi dan menjalankan program. Setiap desain bahasa pemrograman memiliki trade-off.

Mengompilasi program hanya dengan `rustc` sudah cukup untuk program sederhana. Namun, seiring berkembangnya project, Anda akan membutuhkan cara untuk mengelola semua opsi dan mempermudah berbagi kode. Selanjutnya, kita akan memperkenalkan tools Cargo, yang akan membantu Anda menulis program Rust untuk kebutuhan nyata.

[troubleshooting]: ch01-01-installation.html#troubleshooting
[devtools]: appendix-04-useful-development-tools.html
[ch20-macros]: ch20-05-macros.html
