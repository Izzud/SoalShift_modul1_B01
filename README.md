
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

<h5> Berikut source code <a href="https://github.com/Izzud/SoalShift_modul1_B01/blob/master/soal1.sh"> soal nomer 1 </a></h65>
