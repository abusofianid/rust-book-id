# Pendahuluan

> Catatan: Edisi buku ini sama dengan [The Rust Programming Language][nsprust] yang tersedia dalam format cetak dan e-book dari [No Starch Press][nsp].

[nsprust]: https://nostarch.com/rust-programming-language-3rd-edition
[nsp]: https://nostarch.com/

Selamat datang di *The Rust Programming Language*, sebuah buku pengantar tentang Rust. Bahasa pemrograman Rust membantu Anda menulis perangkat lunak yang lebih cepat dan andal. Dalam desain bahasa pemrograman, kemudahan penggunaan pada tingkat tinggi (*high-level ergonomics*) dan kendali pada tingkat rendah (*low-level control*) sering kali saling bertentangan. Rust hadir untuk menantang pertentangan tersebut. Dengan menyeimbangkan kemampuan teknis yang kuat dan pengalaman pengembangan yang baik, Rust memberi Anda pilihan untuk mengendalikan detail tingkat rendah, seperti penggunaan memori, tanpa harus menghadapi segala kerumitan yang biasanya menyertai kendali semacam itu.

## Untuk Siapa Rust Ditujukan

Rust cocok untuk banyak orang karena berbagai alasan. Mari kita lihat beberapa kelompok yang paling penting.

### Tim Developer

Rust terbukti menjadi alat yang produktif untuk mendukung kolaborasi dalam tim developer berskala besar dengan tingkat pemahaman *systems programming* yang beragam. Kode tingkat rendah rentan terhadap berbagai bug tersembunyi yang, pada sebagian besar bahasa pemrograman lainnya, hanya dapat ditemukan melalui pengujian ekstensif dan peninjauan kode secara cermat oleh developer berpengalaman. Di Rust, *compiler* berperan sebagai penjaga gerbang dengan menolak kompilasi kode yang mengandung bug sulit ditemukan tersebut, termasuk bug konkurensi. Dengan bekerja bersama *compiler*, tim dapat memusatkan waktu dan perhatian pada logika program alih-alih menghabiskannya untuk mencari dan memperbaiki bug.

Rust juga menghadirkan berbagai alat developer modern ke dunia *systems programming*:

- Cargo, pengelola dependensi dan alat *build* bawaan, memudahkan penambahan, kompilasi, dan pengelolaan dependensi secara konsisten di seluruh ekosistem Rust.
- Alat pemformat kode `rustfmt` memastikan gaya penulisan kode tetap konsisten di antara para developer.
- Rust Language Server mendukung integrasi dengan *integrated development environment* (IDE), termasuk fitur pelengkapan kode dan pesan kesalahan langsung di dalam kode.

Dengan menggunakan berbagai alat tersebut dan alat lainnya dalam ekosistem Rust, developer dapat bekerja secara produktif saat menulis kode tingkat sistem.

### Mahasiswa

Rust ditujukan bagi mahasiswa dan siapa pun yang tertarik mempelajari konsep-konsep sistem. Dengan menggunakan Rust, banyak orang telah mempelajari berbagai topik seperti pengembangan sistem operasi. Komunitas Rust sangat terbuka dan senang menjawab pertanyaan para mahasiswa. Melalui berbagai upaya seperti buku ini, tim Rust ingin membuat konsep-konsep sistem lebih mudah diakses oleh lebih banyak orang, terutama mereka yang baru mengenal pemrograman.

### Perusahaan

Ratusan perusahaan, baik besar maupun kecil, menggunakan Rust dalam lingkungan produksi untuk berbagai keperluan, termasuk alat *command-line*, layanan web, alat DevOps, perangkat *embedded*, analisis dan *transcoding* audio maupun video, mata uang kripto, bioinformatika, mesin pencari, aplikasi *Internet of Things*, *machine learning*, bahkan bagian-bagian penting dari peramban web Firefox.

### Developer Open Source

Rust ditujukan bagi orang-orang yang ingin membangun bahasa pemrograman Rust, komunitasnya, alat developer, dan pustakanya. Kami akan sangat senang jika Anda turut berkontribusi pada bahasa Rust.

### Orang-Orang yang Mengutamakan Kecepatan dan Stabilitas

Rust ditujukan bagi orang-orang yang menginginkan kecepatan dan stabilitas dalam sebuah bahasa pemrograman. Yang dimaksud dengan kecepatan mencakup dua hal: seberapa cepat kode Rust dapat dijalankan dan seberapa cepat Rust memungkinkan Anda menulis program. Pemeriksaan yang dilakukan oleh *compiler* Rust memastikan stabilitas ketika fitur ditambahkan maupun ketika kode mengalami *refactoring*. Hal ini berbeda dengan kode lama yang rapuh dalam bahasa pemrograman tanpa pemeriksaan semacam itu, yang sering kali membuat developer takut untuk melakukan perubahan. Dengan mengupayakan abstraksi tanpa biaya tambahan (*zero-cost abstractions*)—fitur tingkat tinggi yang dikompilasi menjadi kode tingkat rendah dengan kecepatan setara kode yang ditulis secara manual—Rust berusaha memastikan bahwa kode yang aman juga merupakan kode yang cepat.

Bahasa Rust berharap dapat mendukung banyak kelompok pengguna lainnya; kelompok yang disebutkan di sini hanyalah beberapa pemangku kepentingan terbesarnya. Secara keseluruhan, ambisi terbesar Rust adalah menghilangkan kompromi yang telah diterima para programmer selama puluhan tahun dengan menyediakan keamanan *dan* produktivitas, kecepatan *dan* kemudahan penggunaan. Cobalah Rust dan lihat apakah pendekatan yang ditawarkannya sesuai dengan kebutuhan Anda.

## Untuk Siapa Buku Ini Ditujukan

Buku ini mengasumsikan bahwa Anda pernah menulis kode menggunakan bahasa pemrograman lain, tetapi tidak mengasumsikan bahasa tertentu yang pernah Anda gunakan. Kami berusaha membuat materi dalam buku ini dapat diakses secara luas oleh pembaca dengan berbagai latar belakang pemrograman. Kami tidak akan menghabiskan banyak waktu untuk membahas apa itu pemrograman atau bagaimana cara berpikir dalam pemrograman. Jika Anda benar-benar baru mengenal pemrograman, akan lebih baik jika Anda membaca buku yang secara khusus memberikan pengantar tentang pemrograman.

## Cara Menggunakan Buku Ini

Secara umum, buku ini mengasumsikan bahwa Anda membacanya secara berurutan dari awal hingga akhir. Bab-bab berikutnya dibangun berdasarkan konsep yang diperkenalkan dalam bab-bab sebelumnya. Beberapa bab awal mungkin tidak membahas secara mendalam detail dari suatu topik, tetapi topik tersebut akan dibahas kembali dalam bab berikutnya.

Dalam buku ini, Anda akan menemukan dua jenis bab: bab konsep dan bab proyek. Dalam bab konsep, Anda akan mempelajari salah satu aspek dari Rust. Dalam bab proyek, kita akan membangun program-program kecil bersama dengan menerapkan materi yang telah dipelajari sejauh ini. Bab 2, Bab 12, dan Bab 21 merupakan bab proyek; sedangkan bab lainnya merupakan bab konsep.

**Bab 1** menjelaskan cara memasang Rust, menulis program "Hello, world!", serta menggunakan Cargo, yaitu pengelola paket dan alat *build* milik Rust. **Bab 2** merupakan pengenalan praktis untuk menulis program menggunakan Rust, dengan mengajak Anda membuat permainan tebak angka. Di sini, kita akan membahas berbagai konsep secara umum, sementara bab-bab berikutnya akan memberikan penjelasan yang lebih terperinci. Jika Anda ingin langsung mencoba menulis kode, Bab 2 adalah tempat yang tepat untuk memulainya. Namun, jika Anda termasuk pembelajar yang sangat teliti dan lebih suka memahami setiap detail sebelum melanjutkan, Anda dapat melewati Bab 2 dan langsung menuju **Bab 3**, yang membahas fitur-fitur Rust yang serupa dengan fitur dalam bahasa pemrograman lainnya. Setelah itu, Anda dapat kembali ke Bab 2 ketika ingin mengerjakan proyek dengan menerapkan detail yang telah dipelajari.

Dalam **Bab 4**, Anda akan mempelajari sistem *ownership* milik Rust. **Bab 5** membahas *struct* dan metode. **Bab 6** membahas *enum*, ekspresi `match`, serta konstruksi alur kendali `if let` dan `let...else`. Anda akan menggunakan *struct* dan *enum* untuk membuat tipe data khusus.

Dalam **Bab 7**, Anda akan mempelajari sistem modul Rust serta aturan privasi untuk mengatur kode dan *application programming interface* (API) publiknya. **Bab 8** membahas beberapa struktur data koleksi umum yang disediakan oleh pustaka standar: *vector*, *string*, dan *hash map*. **Bab 9** membahas filosofi dan teknik penanganan kesalahan (*error handling*) dalam Rust.

**Bab 10** membahas lebih dalam tentang *generics*, *traits*, dan *lifetimes*, yang memungkinkan Anda mendefinisikan kode agar dapat diterapkan pada berbagai tipe data. **Bab 11** membahas pengujian (*testing*). Meskipun Rust memiliki jaminan keamanan, pengujian tetap diperlukan untuk memastikan bahwa logika program Anda sudah benar. Dalam **Bab 12**, kita akan membangun implementasi sendiri dari sebagian fungsionalitas alat *command-line* `grep`, yang digunakan untuk mencari teks di dalam berkas. Untuk melakukannya, kita akan menggunakan banyak konsep yang telah dibahas pada bab-bab sebelumnya.

**Bab 13** membahas *closures* dan *iterators*, yaitu fitur-fitur Rust yang berasal dari bahasa pemrograman fungsional. Dalam **Bab 14**, kita akan mempelajari Cargo secara lebih mendalam dan membahas praktik terbaik untuk membagikan pustaka Anda kepada orang lain. **Bab 15** membahas *smart pointer* yang disediakan oleh pustaka standar serta *trait* yang memungkinkan fungsionalitasnya.

Dalam **Bab 16**, kita akan membahas berbagai model pemrograman konkuren dan bagaimana Rust membantu Anda memprogram dengan banyak *thread* tanpa rasa khawatir. Dalam **Bab 17**, kita akan melanjutkan pembahasan tersebut dengan mempelajari sintaks `async` dan `await` milik Rust, beserta *task*, *future*, dan *stream*, serta model konkurensi ringan yang dimungkinkan oleh fitur-fitur tersebut.

**Bab 18** membahas perbandingan idiom Rust dengan prinsip-prinsip pemrograman berorientasi objek yang mungkin sudah Anda kenal. **Bab 19** merupakan referensi mengenai *pattern* dan *pattern matching*, yaitu cara yang ampuh untuk mengekspresikan berbagai gagasan dalam program Rust. **Bab 20** berisi kumpulan topik tingkat lanjut yang menarik, termasuk *unsafe Rust*, makro, serta pembahasan lebih lanjut mengenai *lifetimes*, *traits*, tipe data, fungsi, dan *closures*.

Dalam **Bab 21**, kita akan menyelesaikan sebuah proyek dengan mengimplementasikan *web server* multithread tingkat rendah!

Terakhir, terdapat beberapa lampiran yang berisi informasi berguna mengenai bahasa Rust dalam format yang lebih menyerupai buku referensi. **Lampiran A** membahas kata kunci Rust, **Lampiran B** membahas operator dan simbol Rust, **Lampiran C** membahas *trait* yang dapat diturunkan (*derivable traits*) dan disediakan oleh pustaka standar, **Lampiran D** membahas beberapa alat pengembangan yang berguna, dan **Lampiran E** menjelaskan edisi-edisi Rust. Dalam **Lampiran F**, Anda dapat menemukan terjemahan buku ini ke berbagai bahasa. Sementara itu, **Lampiran G** membahas bagaimana Rust dibuat dan apa yang dimaksud dengan *nightly Rust*.

Tidak ada cara yang salah untuk membaca buku ini. Jika Anda ingin melompat ke bagian berikutnya, silakan saja! Anda mungkin perlu kembali ke bab-bab sebelumnya jika mengalami kebingungan. Namun, lakukanlah dengan cara yang paling sesuai bagi Anda.

<span id="ferris"></span>

Bagian penting dari proses mempelajari Rust adalah memahami cara membaca pesan kesalahan yang ditampilkan oleh *compiler*. Pesan-pesan tersebut akan membantu Anda menemukan kode yang dapat berjalan dengan benar. Oleh karena itu, kami akan menyediakan banyak contoh kode yang tidak dapat dikompilasi, beserta pesan kesalahan yang akan ditampilkan oleh *compiler* dalam setiap situasi. Perlu diingat bahwa jika Anda memasukkan dan menjalankan contoh kode secara acak, kode tersebut mungkin tidak dapat dikompilasi! Pastikan Anda membaca teks di sekitarnya untuk mengetahui apakah contoh yang sedang Anda coba memang dimaksudkan untuk menghasilkan kesalahan. Dalam sebagian besar situasi, kami akan mengarahkan Anda ke versi kode yang benar dari setiap contoh yang tidak dapat dikompilasi.

Ferris juga akan membantu Anda membedakan kode yang memang tidak dimaksudkan untuk berjalan dengan benar:

| Ferris | Makna |
| --- | --- |
| <img src="img/ferris/does_not_compile.svg" class="ferris-explain" alt="Ferris dengan tanda tanya"/> | Kode ini tidak dapat dikompilasi! |
| <img src="img/ferris/panics.svg" class="ferris-explain" alt="Ferris mengangkat kedua tangannya"/> | Kode ini mengalami *panic*! |
| <img src="img/ferris/not_desired_behavior.svg" class="ferris-explain" alt="Ferris mengangkat satu capit dan mengangkat bahu"/> | Kode ini tidak menghasilkan perilaku yang diinginkan. |

Dalam sebagian besar situasi, kami akan mengarahkan Anda ke versi kode yang benar dari setiap contoh yang tidak dapat dikompilasi.

## Kode Sumber

Berkas sumber yang digunakan untuk menghasilkan buku ini dapat ditemukan di [GitHub][book].

[book]: https://github.com/rust-lang/book/tree/main/src
