
Soal Shift 1 Sistem Operasi

1.	Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script,   file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, Hexdump

Langkah - langkah :
- Membuat script bash untuk mendekripsi file nature.zip
- <i>unzip</i> file nature.zip
- lalu setelah di unzip, akan muncul folder nature berisi file .jpg yang masih di enkripsi
- pindah ke direktori nature untuk mendekripsi file satu per satu
- lakukan looping (for loop) untuk mendekripsi file dengan menggunakan base64 dan hexdump
- hapus file yang dienkripsi, file ini akan digantikan dengan file yang sudah didekripsi
- buat crontab sesuai yang diinginkan soal.

`14 14 14 2 * /bin/bash ~/Documents/SoalShift_modul1_B01/soal1.sh` --> artinya setiap jam 14:14 tanggal 14 Februari

`14 14 * 2 5 /bin/bash ~/Documents/SoalShift_modul1_B01/soal1.sh` --> artinya setiap pukul 14:14 setiap hari jumat di bulan februari

<h5> Berikut source code <a href="https://github.com/Izzud/SoalShift_modul1_B01/blob/master/soal1.sh"> soal nomer 1 </a></h5>

2.	Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
a.	Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
b.	Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
c.	Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

langkah - langkah :

  (a) buat sript awk sebagai berikut 

  `awk -F ',' '{if($7=="2012")i[$1]+=$10} END {for (x in i) print i[x] " "x}' WA_Sales_Products_2012-14.csv|sort -nr|head -1`

  langkah dalam script awk :
  - mencari data dari tahun 2012 (kolom 7). Jika ditemukan, maka akan diambil nama country nya (kolom 1) disimpan dalam array i.      Kemudian untuk setiap i yang sama, maka quantity (kolom 10) dijumlahkan.
  - kemudian jika semua data pada tahun 2012 sudah ditemukan dan dihitung, quantity diurutkan dari yang paling besar dengan `sort -nr` 
  - kemudian diambil satu data teratas dengan `head -1` lalu di print quantity beserta nama negaranya.

  (b) ubah script awk dari nomer (a) menjadi 

  `awk -F ',' '{if($7=="2012" && $1=="United States")i[$4]+=$10} END {for (x in i) print i[x] " "x}' WA_Sales_Products_2012-14.csv|sort -nr|head -3
`

  langkah dalam script awk :
  - mencari data dari tahun 2012 (kolom 7) dan country nya United States (dari hasil 2.a) . Jika ditemukan, maka akan diambil nama <i>Product Line</i> nya (kolom 4) disimpan dalam array i. Kemudian untuk setiap i yang sama, maka quantity (kolom 10) dijumlahkan.
  - kemudian jika semua data yang memenuhi kondisi if sudah ditemukan dan dihitung, quantity diurutkan dari yang paling besar dengan `sort -nr` 
  - kemudian diambil tiga data teratas dengan `head -3` lalu di print quantity beserta nama <i>Product Line</i> nya.

  (c) ubah script awk dari nomer (b) menjadi 

  `awk -F ',' '{if($7=="2012" && $1=="United States" && ($4=="Personal Accessories" || $4=="Camping Equipment" || $4=="Outdoor Protection")i[$6]+=$10} END {for (x in i) print i[x] " "x}' WA_Sales_Products_2012-14.csv|sort -nr|head -3
`

  langkah dalam script awk :
  - mencari data dari tahun 2012 (kolom 7) dan country nya United States (dari hasil 2.a) serta <i>Produt Line</i> yang didapatkan dari soal 2b . Jika ditemukan, maka akan diambil nama <i>Product</i> nya (kolom 6) disimpan dalam array i. Kemudian untuk setiap i yang sama, maka quantity (kolom 10) dijumlahkan.
  - kemudian jika semua data yang memenuhi kondisi if sudah ditemukan dan dihitung, quantity diurutkan dari yang paling besar dengan `sort -nr` 
  - kemudian diambil tiga data teratas dengan `head -3` lalu di print quantity beserta nama <i>Product</i> nya.

<h5> Berikut source code <a href="https://github.com/Izzud/SoalShift_modul1_B01/blob/master/soal2.sh"> soal nomer 2 </a></h5>

