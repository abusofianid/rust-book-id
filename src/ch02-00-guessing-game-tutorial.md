# Membuat Program Permainan Tebak Angka

Mari kita mulai mempelajari Rust melalui proyek praktik yang akan kita kerjakan bersama! Bab ini memperkenalkan beberapa konsep umum dalam Rust dengan menunjukkan cara menggunakannya dalam program nyata. Anda akan mempelajari `let`, `match`, methods, associated functions, external crates, dan banyak lagi! Pada bab-bab berikutnya, kita akan membahas konsep-konsep tersebut secara lebih mendalam. Dalam bab ini, Anda hanya akan berlatih memahami dasar-dasarnya.

Kita akan mengimplementasikan sebuah permasalahan pemrograman klasik untuk pemula: permainan tebak angka. Berikut cara kerjanya: Program akan menghasilkan bilangan bulat acak antara 1 dan 100. Kemudian, program akan meminta pemain memasukkan tebakan. Setelah tebakan dimasukkan, program akan memberi tahu apakah angka tebakan terlalu kecil atau terlalu besar. Jika tebakan benar, permainan akan menampilkan pesan ucapan selamat dan berakhir.

## Menyiapkan Proyek Baru

Untuk menyiapkan proyek baru, buka direktori _projects_ yang telah Anda buat pada Bab 1, lalu buat proyek baru menggunakan Cargo seperti berikut:

```console
$ cargo new guessing_game
$ cd guessing_game
```

Perintah pertama, `cargo new`, menerima nama proyek (`guessing_game`) sebagai argumen pertama. Perintah kedua berpindah ke direktori proyek yang baru dibuat.

Perhatikan file _Cargo.toml_ yang dihasilkan:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial
rm -rf no-listing-01-cargo-new
cargo new no-listing-01-cargo-new --name guessing_game
cd no-listing-01-cargo-new
cargo run > output.txt 2>&1
cd ../../..
-->

<span class="filename">Filename: Cargo.toml</span>

```toml
{{#include ../listings/ch02-guessing-game-tutorial/no-listing-01-cargo-new/Cargo.toml}}
```

Seperti yang telah Anda lihat pada Bab 1, `cargo new` membuatkan program "Hello, world!" untuk Anda. Perhatikan file _src/main.rs_:

<span class="filename">Filename: src/main.rs</span>

```rust
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-01-cargo-new/src/main.rs}}
```

Sekarang, mari kita kompilasi program "Hello, world!" ini dan menjalankannya sekaligus menggunakan perintah `cargo run`:

```console
{{#include ../listings/ch02-guessing-game-tutorial/no-listing-01-cargo-new/output.txt}}
```

Perintah `run` sangat berguna ketika Anda perlu melakukan iterasi dengan cepat pada sebuah proyek, seperti yang akan kita lakukan dalam permainan ini. Kita dapat menguji setiap perubahan dengan cepat sebelum melanjutkan ke tahap berikutnya.

Buka kembali file _src/main.rs_. Anda akan menulis seluruh kode di dalam file ini.

## Memproses Tebakan

Bagian pertama dari program permainan tebak angka akan meminta input dari pengguna, memproses input tersebut, dan memeriksa apakah input sudah sesuai dengan format yang diharapkan. Sebagai langkah awal, kita akan mengizinkan pemain memasukkan tebakan. Masukkan kode pada Listing 2-1 ke dalam _src/main.rs_.

<Listing number="2-1" file-name="src/main.rs" caption="Code that gets a guess from the user and prints it">

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:all}}
```

</Listing>

Kode ini memuat banyak informasi, jadi mari kita bahas baris demi baris. Untuk mendapatkan input dari pengguna dan kemudian menampilkan hasilnya sebagai output, kita perlu memasukkan library input/output `io` ke dalam scope. Library `io` berasal dari standard library, yang dikenal sebagai `std`:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:io}}
```

Secara default, Rust memiliki sekumpulan item yang didefinisikan dalam standard library dan otomatis dimasukkan ke dalam scope setiap program. Kumpulan ini disebut _prelude_, dan Anda dapat melihat seluruh isinya [in the standard library documentation][prelude].

Jika suatu type yang ingin Anda gunakan tidak termasuk dalam prelude, Anda harus memasukkan type tersebut ke dalam scope secara eksplisit menggunakan statement `use`. Menggunakan library `std::io` memberi Anda akses ke sejumlah fitur yang berguna, termasuk kemampuan untuk menerima input dari pengguna.

Seperti yang telah Anda lihat pada Bab 1, function `main` merupakan titik masuk (entry point) ke dalam program:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:main}}
```

Syntax `fn` mendeklarasikan function baru; tanda kurung `()` menunjukkan bahwa function tersebut tidak memiliki parameter; dan kurung kurawal `{` menandai awal body function.

Seperti yang juga telah Anda pelajari pada Bab 1, `println!` adalah macro yang mencetak string ke layar:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:print}}
```

Kode ini menampilkan prompt yang menjelaskan permainan dan meminta pengguna untuk memasukkan input.

<a id="storing-values-with-variables"></a>

### Menyimpan Nilai dalam Variabel

Selanjutnya, kita akan membuat _variabel_ untuk menyimpan input dari pengguna, seperti berikut:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:string}}
```

Sekarang program mulai menarik! Ada banyak hal yang terjadi dalam satu baris kecil ini. Kita menggunakan statement `let` untuk membuat variabel. Berikut contoh lainnya:

```rust,ignore
let apples = 5;
```

Baris ini membuat variabel baru bernama `apples` dan mengikatnya dengan nilai `5`. Dalam Rust, variabel secara default bersifat immutable, yang berarti setelah kita memberikan sebuah nilai kepada variabel, nilainya tidak dapat diubah. Kita akan membahas konsep ini secara lebih mendalam pada bagian [“Variables and Mutability”][variables-and-mutability]<!-- ignore -->
di Bab 3. Untuk membuat variabel menjadi mutable, kita menambahkan `mut` sebelum nama variabel:

```rust,ignore
let apples = 5; // immutable
let mut bananas = 5; // mutable
```

> Catatan: Sintaks `//` memulai komentar yang berlanjut hingga akhir baris.
> Rust mengabaikan semua yang ada di dalam komentar. Kita akan membahas komentar
> lebih lanjut di [Chapter 3][comments]<!-- ignore -->.

Kembali ke program tebak angka, sekarang kamu sudah tahu bahwa `let mut guess`
akan memperkenalkan sebuah variabel mutable bernama `guess`. Tanda sama dengan
(`=`) memberi tahu Rust bahwa kita ingin mengikat sesuatu ke variabel tersebut.
Di sebelah kanan tanda sama dengan terdapat nilai yang diikat ke `guess`, yaitu
hasil pemanggilan `String::new`, sebuah function yang mengembalikan instance
baru dari `String`.
[`String`][string]<!-- ignore --> adalah tipe string yang disediakan oleh standard library, yang berupa teks UTF-8 yang dapat diperluas.

Sintaks `::` pada baris `::new` menunjukkan bahwa `new` adalah associated
function dari tipe `String`. _Associated function_ adalah function yang
diimplementasikan pada suatu tipe, dalam hal ini `String`. Function `new` ini
membuat string baru yang kosong. Kamu akan menemukan function `new` pada banyak
tipe karena nama ini umum digunakan untuk function yang membuat nilai baru
dari suatu jenis tertentu.

Secara keseluruhan, baris `let mut guess = String::new();` telah membuat
sebuah variabel mutable yang saat ini terikat pada instance baru `String`
yang masih kosong. Fiuh!

### Menerima Input dari Pengguna

Ingat bahwa kita telah menyertakan fungsionalitas input/output dari standard
library dengan `use std::io;` pada baris pertama program. Sekarang kita akan
memanggil function `stdin` dari modul `io`, yang memungkinkan kita menangani
input dari pengguna:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:read}}
```

Jika kita tidak mengimpor modul `io` dengan `use std::io;` di awal program,
kita tetap dapat menggunakan function tersebut dengan menuliskan pemanggilan
function ini sebagai `std::io::stdin`. Function `stdin` mengembalikan sebuah
instance dari
[`std::io::Stdin`][iostdin]<!-- ignore -->, yang merupakan tipe yang merepresentasikan handle ke standard input untuk terminal kamu.

Selanjutnya, baris `.read_line(&mut guess)` memanggil [`read_line`][read_line]<!--
ignore --> method pada handle standard input untuk mendapatkan input dari pengguna.
Kita juga meneruskan `&mut guess` sebagai argumen ke `read_line` untuk memberi
tahu method tersebut ke dalam string mana input pengguna harus disimpan.
Tugas utama `read_line` adalah mengambil apa pun yang diketik pengguna ke
standard input dan menambahkannya ke dalam sebuah string (tanpa menimpa
isinya), sehingga kita meneruskan string tersebut sebagai argumen. Argumen
string harus bersifat mutable agar method dapat mengubah isi string tersebut.

Tanda `&` menunjukkan bahwa argumen ini adalah sebuah _reference_, yang
memungkinkan beberapa bagian kode kamu mengakses satu bagian data tanpa perlu
menyalin data tersebut ke dalam memori berkali-kali. Reference merupakan fitur
yang kompleks, dan salah satu keunggulan utama Rust adalah betapa aman dan
mudahnya menggunakan reference. Kamu tidak perlu mengetahui banyak detail
tentang hal tersebut untuk menyelesaikan program ini. Untuk saat ini, yang
perlu kamu ketahui adalah bahwa, seperti variabel, reference secara default
bersifat immutable. Oleh karena itu, kamu perlu menulis `&mut guess`, bukan
`&guess`, agar reference tersebut bersifat mutable. (Chapter 4 akan menjelaskan
reference secara lebih mendalam.)

<!-- Old headings. Do not remove or links may break. -->

<a id="handling-potential-failure-with-result"></a>

### Menangani Kemungkinan Kegagalan dengan `Result`

Kita masih mengerjakan baris kode ini. Sekarang kita membahas bagian teks
ketiga, tetapi perlu diperhatikan bahwa bagian ini masih merupakan satu baris
kode secara logis. Bagian berikutnya adalah method ini:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:expect}}
```

Kita sebenarnya bisa menulis kode ini seperti berikut:

```rust,ignore
io::stdin().read_line(&mut guess).expect("Failed to read line");
```

Namun, satu baris yang terlalu panjang sulit dibaca, jadi sebaiknya kita
membaginya menjadi beberapa baris. Sering kali, menambahkan baris baru dan
spasi tambahan merupakan pilihan yang bijak untuk memecah baris panjang saat
memanggil method dengan sintaks `.method_name()`. Sekarang, mari kita bahas
apa yang dilakukan baris ini.

Seperti yang telah disebutkan sebelumnya, `read_line` memasukkan apa pun yang
dimasukkan pengguna ke dalam string yang kita teruskan kepadanya, tetapi
function ini juga mengembalikan sebuah nilai `Result`. [`Result`][result]<!--
ignore --> adalah sebuah [_enumeration_][enums]<!-- ignore -->, yang sering disebut _enum_, merupakan tipe yang dapat berada dalam salah satu
dari beberapa kemungkinan state. Kita menyebut setiap state yang mungkin
tersebut sebagai _variant_.

[Chapter 6][enums]<!-- ignore --> akan membahas enum secara lebih mendalam. Tujuan dari tipe `Result` ini adalah
untuk menyimpan informasi penanganan error.

Variant dari `Result` adalah `Ok` dan `Err`. Variant `Ok` menunjukkan bahwa
operasi berhasil, dan berisi nilai yang berhasil dihasilkan. Variant `Err`
berarti operasi gagal, dan berisi informasi tentang bagaimana atau mengapa
operasi tersebut gagal.

Nilai dari tipe `Result`, seperti nilai dari tipe apa pun, memiliki method yang
didefinisikan untuknya. Sebuah instance dari `Result` memiliki method [`expect` method][expect]<!-- ignore -->
yang dapat kamu panggil. Jika instance `Result` ini merupakan nilai `Err`,
`expect` akan menyebabkan program mengalami crash dan menampilkan pesan yang
kamu berikan sebagai argumen kepada `expect`. Jika method `read_line`
mengembalikan `Err`, kemungkinan besar hal tersebut disebabkan oleh error
yang berasal dari sistem operasi yang mendasarinya. Jika instance `Result`
ini merupakan nilai `Ok`, `expect` akan mengambil nilai kembalian yang
disimpan oleh `Ok` dan mengembalikan nilai tersebut secara langsung kepadamu
agar dapat kamu gunakan. Dalam kasus ini, nilai tersebut adalah jumlah byte
dalam input pengguna.

Jika kamu tidak memanggil `expect`, program akan berhasil dikompilasi, tetapi
kamu akan mendapatkan sebuah warning:

```console
{{#include ../listings/ch02-guessing-game-tutorial/no-listing-02-without-expect/output.txt}}
```

Rust memberikan warning bahwa kamu belum menggunakan nilai `Result` yang
dikembalikan oleh `read_line`, yang menunjukkan bahwa program belum menangani
kemungkinan terjadinya error.

Cara yang tepat untuk menghilangkan warning ini adalah dengan menulis kode
penanganan error. Namun, dalam kasus kita, kita hanya ingin membuat program
crash ketika terjadi masalah, sehingga kita dapat menggunakan `expect`. Kamu
akan mempelajari cara memulihkan program dari error di [Chapter
9][recover]<!-- ignore -->.

### Mencetak Nilai dengan Placeholder `println!`

Selain kurung kurawal penutup, hanya ada satu baris lagi yang perlu kita bahas
dari kode sejauh ini:

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-01/src/main.rs:print_guess}}
```

Baris ini mencetak string yang sekarang berisi input dari pengguna. Sepasang
kurung kurawal `{}` merupakan placeholder: Anggap `{}` seperti capit kepiting
kecil yang menahan sebuah nilai pada tempatnya. Saat mencetak nilai sebuah
variabel, nama variabel dapat ditempatkan di dalam kurung kurawal. Saat
mencetak hasil evaluasi sebuah expression, tempatkan kurung kurawal kosong
di dalam format string, lalu ikuti format string tersebut dengan daftar
expression yang dipisahkan koma untuk dicetak pada setiap placeholder kurung
kurawal kosong, sesuai urutannya. Mencetak sebuah variabel dan hasil dari
sebuah expression dalam satu pemanggilan `println!` akan terlihat seperti ini:

```rust
let x = 5;
let y = 10;

println!("x = {x} and y + 2 = {}", y + 2);
```

Kode ini akan mencetak `x = 5 and y + 2 = 12`.

### Menguji Bagian Pertama

Mari kita uji bagian pertama dari game tebak angka ini. Jalankan program menggunakan `cargo run`:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-01/
cargo clean
cargo run
input 6 -->

```console
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 6.44s
     Running `target/debug/guessing_game`
Guess the number!
Please input your guess.
6
You guessed: 6
```

Pada tahap ini, bagian pertama dari game telah selesai: Kita sudah menerima
input dari keyboard, lalu mencetaknya.

## Menghasilkan Angka Rahasia

Selanjutnya, kita perlu menghasilkan angka rahasia yang akan coba ditebak oleh
pengguna. Angka rahasia tersebut harus berbeda setiap kali agar game ini tetap
menyenangkan untuk dimainkan berulang kali. Kita akan menggunakan angka acak
antara 1 dan 100 agar game ini tidak terlalu sulit. Rust belum menyertakan
fungsionalitas untuk menghasilkan angka acak di dalam standard library-nya.
Namun, tim Rust menyediakan sebuah [`rand`
crate][randcrate] dengan fungsionalitas tersebut.

<!-- Old headings. Do not remove or links may break. -->
<a id="using-a-crate-to-get-more-functionality"></a>

### Menambahkan Fungsionalitas dengan Crate

Remember that a crate is a collection of Rust source code files. The project
we’ve been building is a binary crate, which is an executable. The `rand` crate
is a library crate, which contains code that is intended to be used in other
programs and can’t be executed on its own.

Cargo’s coordination of external crates is where Cargo really shines. Before we
can write code that uses `rand`, we need to modify the _Cargo.toml_ file to
include the `rand` crate as a dependency. Open that file now and add the
following line to the bottom, beneath the `[dependencies]` section header that
Cargo created for you. Be sure to specify `rand` exactly as we have here, with
this version number, or the code examples in this tutorial may not work:

<!-- When updating the version of `rand` used, also update the version of
`rand` used in these files so they all match:

* ch01-01-installation.md
* ch07-04-bringing-paths-into-scope-with-the-use-keyword.md
* ch14-03-cargo-workspaces.md
-->

<span class="filename">Filename: Cargo.toml</span>

```toml
{{#include ../listings/ch02-guessing-game-tutorial/listing-02-02/Cargo.toml:8:}}
```

In the _Cargo.toml_ file, everything that follows a header is part of that
section that continues until another section starts. In `[dependencies]`, you
tell Cargo which external crates your project depends on and which versions of
those crates you require. In this case, we specify the `rand` crate with the
semantic version specifier `0.10.1`. Cargo understands [Semantic
Versioning][semver]<!-- ignore --> (sometimes called _SemVer_), which is a
standard for writing version numbers. The specifier `0.10.1` is actually
shorthand for `^0.10.1`, which means any version that is at least 0.10.1 but
below 0.11.0.

Cargo considers these versions to have public APIs compatible with version
0.10.1, and this specification ensures that you’ll get the latest patch release
that will still compile with the code in this chapter. Any version 0.11.0 or
greater is not guaranteed to have the same API as what the following examples
use.

Now, without changing any of the code, let’s build the project, as shown in
Listing 2-2.

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-02/
rm Cargo.lock
cargo clean
cargo build -->

<Listing number="2-2" caption="The output from running `cargo build` after adding the `rand` crate as a dependency">

```console
$ cargo build
    Updating crates.io index
     Locking 8 packages to latest Rust 1.96.0 compatible versions
  Downloaded rand_core v0.10.1
  Downloaded chacha20 v0.10.1
  Downloaded rand v0.10.1
  Downloaded 3 crates (162.9KiB) in 0.59s
   Compiling libc v0.2.186
   Compiling rand_core v0.10.1
   Compiling getrandom v0.4.3
   Compiling cfg-if v1.0.4
   Compiling chacha20 v0.10.1
   Compiling rand v0.10.1
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 2.03s
```

</Listing>

You may see different version numbers (but they will all be compatible with the
code, thanks to SemVer!) and different lines (depending on the operating
system), and the lines may be in a different order.

When we include an external dependency, Cargo fetches the latest versions of
everything that dependency needs from the _registry_, which is a copy of data
from [Crates.io][cratesio]. Crates.io is where people in the Rust ecosystem
post their open source Rust projects for others to use.

After updating the registry, Cargo checks the `[dependencies]` section and
downloads any crates listed that aren’t already downloaded. In this case,
although we only listed `rand` as a dependency, Cargo also grabbed other crates
that `rand` depends on to work. After downloading the crates, Rust compiles
them and then compiles the project with the dependencies available.

If you immediately run `cargo build` again without making any changes, you
won’t get any output aside from the `Finished` line. Cargo knows it has already
downloaded and compiled the dependencies, and you haven’t changed anything
about them in your _Cargo.toml_ file. Cargo also knows that you haven’t changed
anything about your code, so it doesn’t recompile that either. With nothing to
do, it simply exits.

If you open the _src/main.rs_ file, make a trivial change, and then save it and
build again, you’ll only see two lines of output:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-02/
touch src/main.rs
cargo build -->

```console
$ cargo build
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.13s
```

These lines show that Cargo only updates the build with your tiny change to the
_src/main.rs_ file. Your dependencies haven’t changed, so Cargo knows it can
reuse what it has already downloaded and compiled for those.

<!-- Old headings. Do not remove or links may break. -->
<a id="ensuring-reproducible-builds-with-the-cargo-lock-file"></a>

#### Ensuring Reproducible Builds

Cargo has a mechanism that ensures that you can rebuild the same artifact every
time you or anyone else builds your code: Cargo will use only the versions of
the dependencies you specified until you indicate otherwise. For example, say
that next week version 0.10.2 of the `rand` crate comes out, and that version
contains an important bug fix, but it also contains a regression that will
break your code. To handle this, Rust creates the _Cargo.lock_ file the first
time you run `cargo build`, so we now have this in the _guessing_game_
directory.

When you build a project for the first time, Cargo figures out all the versions
of the dependencies that fit the criteria and then writes them to the
_Cargo.lock_ file. When you build your project in the future, Cargo will see
that the _Cargo.lock_ file exists and will use the versions specified there
rather than doing all the work of figuring out versions again. This lets you
have a reproducible build automatically. In other words, your project will
remain at 0.10.1 until you explicitly upgrade, thanks to the _Cargo.lock_ file.
Because the _Cargo.lock_ file is important for reproducible builds, it’s often
checked into source control with the rest of the code in your project.

#### Updating a Crate to Get a New Version

When you _do_ want to update a crate, Cargo provides the command `update`,
which will ignore the _Cargo.lock_ file and figure out all the latest versions
that fit your specifications in _Cargo.toml_. Cargo will then write those
versions to the _Cargo.lock_ file. Otherwise, by default, Cargo will only look
for versions greater than 0.10.1 and less than 0.11.0. If the `rand` crate has
released the two new versions 0.10.2 and 0.999.0, you would see the following if
you ran `cargo update`:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-02/
cargo update
assuming there is a new version of rand; otherwise use another update
as a guide to creating the hypothetical output shown here -->

```console
$ cargo update
    Updating crates.io index
     Locking 1 package to latest Rust 1.96.0 compatible version
    Updating rand v0.10.1 -> v0.10.2 (available: v0.999.0)
```

Cargo ignores the 0.999.0 release. At this point, you would also notice a
change in your _Cargo.lock_ file noting that the version of the `rand` crate
you are now using is 0.10.2. To use `rand` version 0.999.0 or any version in the
0.999._x_ series, you’d have to update the _Cargo.toml_ file to look like this
instead (don’t actually make this change because the following examples assume
you’re using `rand` 0.10):

```toml
[dependencies]
rand = "0.999.0"
```

The next time you run `cargo build`, Cargo will update the registry of crates
available and reevaluate your `rand` requirements according to the new version
you have specified.

There’s a lot more to say about [Cargo][doccargo]<!-- ignore --> and [its
ecosystem][doccratesio]<!-- ignore -->, which we’ll discuss in Chapter 14, but
for now, that’s all you need to know. Cargo makes it very easy to reuse
libraries, so Rustaceans are able to write smaller projects that are assembled
from a number of packages.

### Generating a Random Number

Let’s start using `rand` to generate a number to guess. The next step is to
update _src/main.rs_, as shown in Listing 2-3.

<Listing number="2-3" file-name="src/main.rs" caption="Adding code to generate a random number">

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-03/src/main.rs:all}}
```

</Listing>

First, we add the line `use rand::prelude::*;`. The `prelude` module contains
the most commonly used parts of the `rand` crate, and `use` makes those items
available in our program's scope.

Next, we’re adding two lines in the middle. In the first line, we call the
`rand::rng` function that gives us the particular random number generator we’re
going to use: one that is local to the current thread of execution and is
seeded by the operating system. Then, we call the `random_range` method on the
random number generator. This method is defined by the `RngExt` trait that is
part of the `rand::prelude` module that we brought into scope with the `use
rand::prelude::*;` statement. The `random_range` method takes a range
expression as an argument and generates a random number in the range. The kind
of range expression we’re using here takes the form `start..=end` and is
inclusive on the lower and upper bounds, so we need to specify `1..=100` to
request a number between 1 and 100.

> Note: You won’t just know what to bring into scope and which methods and
> functions to call from a crate, so each crate has documentation with
> instructions for using it. Another neat feature of Cargo is that running the
> `cargo doc --open` command will build documentation provided by all your
> dependencies locally and open it in your browser. If you’re interested in
> other functionality in the `rand` crate, for example, run `cargo doc --open`
> and click `rand` in the sidebar on the left.

The second new line prints the secret number. This is useful while we’re
developing the program to be able to test it, but we’ll delete it from the
final version. It’s not much of a game if the program prints the answer as soon
as it starts!

Try running the program a few times:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-03/
cargo run
4
cargo run
5
-->

```console
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.02s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 7
Please input your guess.
4
You guessed: 4

$ cargo run
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.02s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 83
Please input your guess.
5
You guessed: 5
```

You should get different random numbers, and they should all be numbers between
1 and 100. If you get warnings, they are safe to ignore. If you get errors,
please check that you have `rand = "0.10.1"` in your *Cargo.toml* as future
versions of `rand` may have a different API, but any version in the `0.10`
series should work with the code in this chapter.

## Comparing the Guess to the Secret Number

Now that we have user input and a random number, we can compare them. That step
is shown in Listing 2-4. Note that this code won’t compile just yet, as we will
explain.

<Listing number="2-4" file-name="src/main.rs" caption="Handling the possible return values of comparing two numbers">

```rust,ignore,does_not_compile
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-04/src/main.rs:here}}
```

</Listing>

First, we add another `use` statement, bringing a type called
`std::cmp::Ordering` into scope from the standard library. The `Ordering` type
is another enum and has the variants `Less`, `Greater`, and `Equal`. These are
the three outcomes that are possible when you compare two values.

Then, we add five new lines at the bottom that use the `Ordering` type. The
`cmp` method compares two values and can be called on anything that can be
compared. It takes a reference to whatever you want to compare with: Here, it’s
comparing `guess` to `secret_number`. Then, it returns a variant of the
`Ordering` enum we brought into scope with the `use` statement. We use a
[`match`][match]<!-- ignore --> expression to decide what to do next based on
which variant of `Ordering` was returned from the call to `cmp` with the values
in `guess` and `secret_number`.

A `match` expression is made up of _arms_. An arm consists of a _pattern_ to
match against, and the code that should be run if the value given to `match`
fits that arm’s pattern. Rust takes the value given to `match` and looks
through each arm’s pattern in turn. Patterns and the `match` construct are
powerful Rust features: They let you express a variety of situations your code
might encounter, and they make sure you handle them all. These features will be
covered in detail in Chapter 6 and Chapter 19, respectively.

Let’s walk through an example with the `match` expression we use here. Say that
the user has guessed 50 and the randomly generated secret number this time is
38.

When the code compares 50 to 38, the `cmp` method will return
`Ordering::Greater` because 50 is greater than 38. The `match` expression gets
the `Ordering::Greater` value and starts checking each arm’s pattern. It looks
at the first arm’s pattern, `Ordering::Less`, and sees that the value
`Ordering::Greater` does not match `Ordering::Less`, so it ignores the code in
that arm and moves to the next arm. The next arm’s pattern is
`Ordering::Greater`, which _does_ match `Ordering::Greater`! The associated
code in that arm will execute and print `Too big!` to the screen. The `match`
expression ends after the first successful match, so it won’t look at the last
arm in this scenario.

However, the code in Listing 2-4 won’t compile yet. Let’s try it:

<!--
The error numbers in this output should be that of the code **WITHOUT** the
anchor or snip comments
-->

```console
{{#include ../listings/ch02-guessing-game-tutorial/listing-02-04/output.txt}}
```

The core of the error states that there are _mismatched types_. Rust has a
strong, static type system. However, it also has type inference. When we wrote
`let mut guess = String::new()`, Rust was able to infer that `guess` should be
a `String` and didn’t make us write the type. The `secret_number`, on the other
hand, is a number type. A few of Rust’s number types can have a value between 1
and 100: `i32`, a 32-bit number; `u32`, an unsigned 32-bit number; `i64`, a
64-bit number; as well as others. Unless otherwise specified, Rust defaults to
an `i32`, which is the type of `secret_number` unless you add type information
elsewhere that would cause Rust to infer a different numerical type. The reason
for the error is that Rust cannot compare a string and a number type.

Ultimately, we want to convert the `String` the program reads as input into a
number type so that we can compare it numerically to the secret number. We do
so by adding this line to the `main` function body:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-03-convert-string-to-number/src/main.rs:here}}
```

The line is:

```rust,ignore
let guess: u32 = guess.trim().parse().expect("Please type a number!");
```

We create a variable named `guess`. But wait, doesn’t the program already have
a variable named `guess`? It does, but helpfully Rust allows us to shadow the
previous value of `guess` with a new one. _Shadowing_ lets us reuse the `guess`
variable name rather than forcing us to create two unique variables, such as
`guess_str` and `guess`, for example. We’ll cover this in more detail in
[Chapter 3][shadowing]<!-- ignore -->, but for now, know that this feature is
often used when you want to convert a value from one type to another type.

We bind this new variable to the expression `guess.trim().parse()`. The `guess`
in the expression refers to the original `guess` variable that contained the
input as a string. The `trim` method on a `String` instance will eliminate any
whitespace at the beginning and end, which we must do before we can convert the
string to a `u32`, which can only contain numerical data. The user must press
<kbd>enter</kbd> to satisfy `read_line` and input their guess, which adds a
newline character to the string. For example, if the user types <kbd>5</kbd> and
presses <kbd>enter</kbd>, `guess` looks like this: `5\n`. The `\n` represents
“newline.” (On Windows, pressing <kbd>enter</kbd> results in a carriage return
and a newline, `\r\n`.) The `trim` method eliminates `\n` or `\r\n`, resulting
in just `5`.

The [`parse` method on strings][parse]<!-- ignore --> converts a string to
another type. Here, we use it to convert from a string to a number. We need to
tell Rust the exact number type we want by using `let guess: u32`. The colon
(`:`) after `guess` tells Rust we’ll annotate the variable’s type. Rust has a
few built-in number types; the `u32` seen here is an unsigned, 32-bit integer.
It’s a good default choice for a small positive number. You’ll learn about
other number types in [Chapter 3][integers]<!-- ignore -->.

Additionally, the `u32` annotation in this example program and the comparison
with `secret_number` means Rust will infer that `secret_number` should be a
`u32` as well. So, now the comparison will be between two values of the same
type!

The `parse` method will only work on characters that can logically be converted
into numbers and so can easily cause errors. If, for example, the string
contained `A👍%`, there would be no way to convert that to a number. Because it
might fail, the `parse` method returns a `Result` type, much as the `read_line`
method does (discussed earlier in [“Handling Potential Failure with
`Result`”](#handling-potential-failure-with-result)<!-- ignore -->). We’ll treat
this `Result` the same way by using the `expect` method again. If `parse`
returns an `Err` `Result` variant because it couldn’t create a number from the
string, the `expect` call will crash the game and print the message we give it.
If `parse` can successfully convert the string to a number, it will return the
`Ok` variant of `Result`, and `expect` will return the number that we want from
the `Ok` value.

Let’s run the program now:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/no-listing-03-convert-string-to-number/
touch src/main.rs
cargo run
  76
-->

```console
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.26s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 58
Please input your guess.
  76
You guessed: 76
Too big!
```

Nice! Even though spaces were added before the guess, the program still figured
out that the user guessed 76. Run the program a few times to verify the
different behavior with different kinds of input: Guess the number correctly,
guess a number that is too high, and guess a number that is too low.

We have most of the game working now, but the user can make only one guess.
Let’s change that by adding a loop!

## Allowing Multiple Guesses with Looping

The `loop` keyword creates an infinite loop. We’ll add a loop to give users
more chances at guessing the number:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-04-looping/src/main.rs:here}}
```

As you can see, we’ve moved everything from the guess input prompt onward into
a loop. Be sure to indent the lines inside the loop another four spaces each
and run the program again. The program will now ask for another guess forever,
which actually introduces a new problem. It doesn’t seem like the user can quit!

The user could always interrupt the program by using the keyboard shortcut
<kbd>ctrl</kbd>-<kbd>C</kbd>. But there’s another way to escape this insatiable
monster, as mentioned in the `parse` discussion in [“Comparing the Guess to the
Secret Number”](#comparing-the-guess-to-the-secret-number)<!-- ignore -->: If
the user enters a non-number answer, the program will crash. We can take
advantage of that to allow the user to quit, as shown here:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/no-listing-04-looping/
touch src/main.rs
cargo run
(too small guess)
(too big guess)
(correct guess)
quit
-->

```console
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.23s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 59
Please input your guess.
45
You guessed: 45
Too small!
Please input your guess.
60
You guessed: 60
Too big!
Please input your guess.
59
You guessed: 59
You win!
Please input your guess.
quit

thread 'main' (6694925) panicked at src/main.rs:28:47:
Please type a number!: ParseIntError { kind: InvalidDigit }
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
```

Typing `quit` will quit the game, but as you’ll notice, so will entering any
other non-number input. This is suboptimal, to say the least; we want the game
to also stop when the correct number is guessed.

### Quitting After a Correct Guess

Let’s program the game to quit when the user wins by adding a `break` statement:

<span class="filename">Filename: src/main.rs</span>

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/no-listing-05-quitting/src/main.rs:here}}
```

Adding the `break` line after `You win!` makes the program exit the loop when
the user guesses the secret number correctly. Exiting the loop also means
exiting the program, because the loop is the last part of `main`.

### Handling Invalid Input

To further refine the game’s behavior, rather than crashing the program when
the user inputs a non-number, let’s make the game ignore a non-number so that
the user can continue guessing. We can do that by altering the line where
`guess` is converted from a `String` to a `u32`, as shown in Listing 2-5.

<Listing number="2-5" file-name="src/main.rs" caption="Ignoring a non-number guess and asking for another guess instead of crashing the program">

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-05/src/main.rs:here}}
```

</Listing>

We switch from an `expect` call to a `match` expression to move from crashing
on an error to handling the error. Remember that `parse` returns a `Result`
type and `Result` is an enum that has the variants `Ok` and `Err`. We’re using
a `match` expression here, as we did with the `Ordering` result of the `cmp`
method.

If `parse` is able to successfully turn the string into a number, it will
return an `Ok` value that contains the resultant number. That `Ok` value will
match the first arm’s pattern, and the `match` expression will just return the
`num` value that `parse` produced and put inside the `Ok` value. That number
will end up right where we want it in the new `guess` variable we’re creating.

If `parse` is _not_ able to turn the string into a number, it will return an
`Err` value that contains more information about the error. The `Err` value
does not match the `Ok(num)` pattern in the first `match` arm, but it does
match the `Err(_)` pattern in the second arm. The underscore, `_`, is a
catch-all value; in this example, we’re saying we want to match all `Err`
values, no matter what information they have inside them. So, the program will
execute the second arm’s code, `continue`, which tells the program to go to the
next iteration of the `loop` and ask for another guess. So, effectively, the
program ignores all errors that `parse` might encounter!

Now everything in the program should work as expected. Let’s try it:

<!-- manual-regeneration
cd listings/ch02-guessing-game-tutorial/listing-02-05/
cargo run
(too small guess)
(too big guess)
foo
(correct guess)
-->

```console
$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.13s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 61
Please input your guess.
10
You guessed: 10
Too small!
Please input your guess.
99
You guessed: 99
Too big!
Please input your guess.
foo
Please input your guess.
61
You guessed: 61
You win!
```

Awesome! With one tiny final tweak, we will finish the guessing game. Recall
that the program is still printing the secret number. That worked well for
testing, but it ruins the game. Let’s delete the `println!` that outputs the
secret number. Listing 2-6 shows the final code.

<Listing number="2-6" file-name="src/main.rs" caption="Complete guessing game code">

```rust,ignore
{{#rustdoc_include ../listings/ch02-guessing-game-tutorial/listing-02-06/src/main.rs}}
```

</Listing>

At this point, you’ve successfully built the guessing game. Congratulations!

## Summary

This project was a hands-on way to introduce you to many new Rust concepts:
`let`, `match`, functions, the use of external crates, and more. In the next
few chapters, you’ll learn about these concepts in more detail. Chapter 3
covers concepts that most programming languages have, such as variables, data
types, and functions, and shows how to use them in Rust. Chapter 4 explores
ownership, a feature that makes Rust different from other languages. Chapter 5
discusses structs and method syntax, and Chapter 6 explains how enums work.

[prelude]: ../std/prelude/index.html
[variables-and-mutability]: ch03-01-variables-and-mutability.html#variables-and-mutability
[comments]: ch03-04-comments.html
[string]: ../std/string/struct.String.html
[iostdin]: ../std/io/struct.Stdin.html
[read_line]: ../std/io/struct.Stdin.html#method.read_line
[result]: ../std/result/enum.Result.html
[enums]: ch06-00-enums.html
[expect]: ../std/result/enum.Result.html#method.expect
[recover]: ch09-02-recoverable-errors-with-result.html
[randcrate]: https://crates.io/crates/rand
[semver]: http://semver.org
[cratesio]: https://crates.io/
[doccargo]: https://doc.rust-lang.org/cargo/
[doccratesio]: https://doc.rust-lang.org/cargo/reference/publishing.html
[match]: ch06-02-match.html
[shadowing]: ch03-01-variables-and-mutability.html#shadowing
[parse]: ../std/primitive.str.html#method.parse
[integers]: ch03-02-data-types.html#integer-types
