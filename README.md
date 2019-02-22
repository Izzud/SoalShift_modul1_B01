Soal Shift 1 Sistem Operasi
===========================

Soal 1
--------

1.	Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script,   file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, Hexdump

Langkah - langkah :
- Membuat script bash untuk mendekripsi file nature.zip
- <i>unzip</i> file nature.zip
- lalu setelah di unzip, akan muncul folder nature berisi file .jpg yang masih di enkripsi
- pindah ke direktori nature untuk mendekripsi file satu per satu
- lakukan looping (while loop) untuk mendekripsi file dengan menggunakan base64 dan hexdump
- hapus file yang dienkripsi, file ini akan digantikan dengan file yang sudah didekripsi
- buat crontab sesuai yang diinginkan soal.

#### Penjelasan cronjobs

`14 14 14 2 * /bin/bash /home/izzud/soal1.sh` --> artinya setiap jam 14:14 tanggal 14 Februari

`14 14 * 2 5 /bin/bash /home/izzud/soal1.sh` --> artinya setiap pukul 14:14 setiap hari jumat di bulan februari

<h5> Berikut source code <a href="https://github.com/Izzud/SoalShift_modul1_B01/blob/master/soal1.sh"> soal nomer 1 </a></h5>

<br>

Soal 2
------

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

<br>

Soal 3
------

3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
  - Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
  - Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
  - Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
  - Password yang dihasilkan tidak boleh sama.

 <br>
 
### Penjelasan script

`name="password"`

- Adalah nama file tanpa *suffix*

```
while [ 0 ]; do

done
```
- Berbeda dari bahasa lainnya, nilai 0 bernilai **true** sehingga loop ini akan dieksekusi selamanya. 


```
num=1
flag=0
```
- Inisiasi *counter (num)* sebagai **suffix** dari password yang akan di-generate dan *flag* untuk duplicate password (0 berarti tidak ada yang sama)


```
password=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
```
- Lalu kita akan mengambil karakter random dari `/dev/urandom` yang akan di-filter oleh command `tr -dc A-Za-z0-9` sehingga outputnya adalah random string yang berisi **huruf kapital**, **huruf kecil** dan **nomor**. **12 karakter pertama** akan dimasukkan ke variabel `password`.


```
while test -e "$name$num.txt"; do
	if [ password != $(echo $name$num.txt)  ]; then
		((num++))
	else
		flag=1
		break
	fi
done
```
- Blok loop ini akan mengecek semua file beserta isinya. Loop akan berhenti ketika ada __file yang hilang/tidak ada__ baik di tengah jalan maupun di akhir (`test -e "$name$num.txt"`), atau __password yang baru kita generate sama dengan isi salah satu file__.


```
if [ $flag ]; then
	echo $num $password
	filename="$name$num.txt"
	echo $password > $filename
	break
fi
```
- Terakhir, jika setelah dicek keseluruhan file yang ada dan tidak ditemukan adanya password yang sama, maka akan dibuat file berisi variabel `password`.

###### [Script no 3](../blob/master/SoalShift_modul1_B01/soal3.sh)

<br>

Soal 4
------
4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai
berikut:

- Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
- Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.
- Setelah huruf z akan kembali ke huruf a
- Backup file syslog setiap jam.
- Dan buatkan juga bash script untuk dekripsinya.

<br>

Problem ini adalah contoh penggunaan [Caesar Cipher](http://practicalcryptography.com/ciphers/caesar-cipher), dimana setiap huruf dari *plaintext* (syslog) akan digeser ke kanan dalam urutan abjad sesuai dengan jam saat script ini dijalankan. Kita bisa menggunakan command `tr` pada BASH.

![Ilustrasi](https://microbit-challenges.readthedocs.io/en/latest/_images/shift.png)

Misal untuk ilustrasi diatas, kita dapat menggunakan command `tr [ABCDEFGHIJKLMNOPQRSTUVWXYZ] [DEFGHIJKLMNOPQRSTUVWXYZABC]`, sehingga "A" akan digeser/*map* menjadi "D", "B" menjadi "E" dan seterusnya sampai "Z" menjadi "C". 

<br>

### Penjelasan script

Sebelumnya, harus dibuat direktori baru untuk menampung file output, dengan command `mkdir ~/no-4`

```
key=$(date +"%k")

input="/var/log/syslog"
```
- Pertama, kita mengambil *path* dari syslog dan jam saat script ini dijalankan sebagai *key* 

```
lower=abcdefghijklmnopqrstuvwxyz
lower=$lower$lower
upper=$(echo $lower | tr [a-z] [A-Z])
```
- Variabel `lower` berisi abjad a-z yang diulang sebanyak **2 kali**, `upper` juga sama seperti `lower` tetapi berisi huruf kapital.

```
output=$(date +"%H:%M %d-%m-%Y")
```
- `%H` berarti **jam** dalam bentuk 24hr, `%M` untuk **menit**, `%d` untuk **tanggal**, `%m` untuk **bulan** dan `%Y` untuk **tahun** (4 digit)

```
cat $input | tr [${lower:26}${upper:26}] [${lower:$key:26}${upper:$key:26}] > no-4/"$output"
```
- `${lower:26}` berisi karakter dari string `lower` mulai dari karakter ke 27, sama seperti [a-z] karena `lower` berisi abjad a-z yang diulang sebanyak 2 kali.

- Sedangkan `${lower:$key:26}` berisi karakter mulai dari karakter ke-`$key` sampai `$key`+25. Misal key=2, dan lower =`abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz` maka `${lower:$key:26}`berisi **cdefghijklmnopqrstuvwxyzab**

###### [Script no 4](../blob/master/SoalShift_modul1_B01/soal4.sh)

<br>

### Penjelasan script untuk dekripsi

Sama seperti script untuk mengenkripsi file syslog, hanya saja bedanya adanya blok perulangan untuk mendekripsi seluruh file yang telah dienkripsi: 

```
if [[ $(echo $f | grep "decrypted") && $? -eq 0 ]]; then
        continue
fi
```
- Jika file telah didekripsi, maka akan di-skip.

**Perbedaan lainnya adalah:**

+ `fname=$(basename "$f")` untuk mengekstrak nama file
+ `key=${fname:0:2}` untuk mengekstrak jam dari nama file
+ `output="$fname [decrypted]"` format file output, sama seperti file input hanya saja diberi tambahan string `[decrypted]`
+ `tr [${lower:$key:26}${upper:$key:26} [${lower:0:26}${upper:0:26}]` sama seperti untuk enkripsi, hanya saja dibalik.


###### [Script dekripsi](../blob/master/SoalShift_modul1_B01/soal4-decrypt.sh)

<br>

#### Penjelasan cronjobs

`0 * * * * /bin/bash /home/izzud/soal4.sh` berarti script akan dieksekusi setiap menit ke-0 setiap jamnya, dan setiap hari.

<br>

Soal 5
------
5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:
- Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
- Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
- Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
- Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

<br>

### Penjelasan script

Sebelumnya, harus dibuat direktori baru untuk menampung file output, dengan command `mkdir ~/modul1`

`cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && !/bash/ && NF < 13 {print}' > ~/modul1`

- `cat /var/log/syslog` berfungsi untuk menampilkan isi dari file syslog
- `tolower($0)` berarti semua input akan dianggap sebagai __lowercase__
- `/cron/ && !/bash/` string/pattern yang akan dicari. `!` menandakan **kecuali** pattern `bash`
- `NF < 13` berarti kolom tidak boleh melibihi 13
- `~/modul1/syslog` file output akan disimpan di direktori `/home/izzud/modul1` dengan nama `syslog`

###### [Script no 5](../blob/master/SoalShift_modul1_B01/soal5.sh)

<br>

#### Penjelasan cronjobs

`2-30/6 * * * * /bin/bash /home/izzud/soal5.sh` berarti script akan dieksekusi setiap menit ke-6, dimulai dari menit ke-2 sampai menit ke-30 (menit ke-2, 8, 14, 20, 26) setiap jamnya, dan setiap hari.
