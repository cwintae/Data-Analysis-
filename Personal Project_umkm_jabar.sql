create database umkm;
select*from umkm_jabar;

-- tampilkan data umkm di kota bandung
select*from umkm_jabar where nama_kabupaten_kota ="kota bandung";

-- tampilkan data umkm dari tahun 2019 dan disusun berdasarkan kategori usaha
select*from umkm_jabar where tahun >=2019 order by kategori_usaha, tahun;

-- menampilkan hanya 10 baris saja
select*from umkm_jabar where tahun >=2019 order by kategori_usaha, tahun limit 10;

-- menampilkan kategori_usaha apa aja yg ada di dlm dataset
select distinct kategori_usaha from umkm_jabar; #distinct = menghapus data duplikat dan hanya menampilkan yg unik

-- menampilkan seluruh data hanya kategori usaha fashion & makanan
select*from umkm_jabar where kategori_usaha in ("fashion", "makanan");
select*from umkm_jabar where kategori_usaha = "fashion" or "makanan";

-- tampilkan seluruh data dengan kategori usaha fashion di kabupaten karawang 
select*from umkm_jabar where kategori_usaha = "fashion" and nama_kabupaten_kota ="kabupaten karawang";

-- tampikan seluruh data selain kategori usaha kuliner,makanan & minuman
select*from umkm_jabar where kategori_usaha not in ("kuliner", "makanan", "minuman");

-- dari tahun 2018 s/d 2020 bagaimana tren jumlah umkm di kabupaten tasikmalaya utk kategori usaha batik
select nama_kabupaten_kota, kategori_usaha, proyeksi_jumlah_umkm, satuan, tahun from umkm_jabar 
where tahun <=2020 and tahun >=2018 and nama_kabupaten_kota ="kabupaten tasikmalaya" and kategori_usaha ="batik";

-- diantara kota bandung, kabupaten bandung dan kabupaten bandung barat, dimanakah umkm kuliner terpusat pada tahun 2021?
select*from umkm_jabar where nama_kabupaten_kota like "%bandung%" and kategori_usaha ="kuliner" and tahun=2021;

-- kabupaten/kota mana saja yg memiliki angka 7 pada digit ke 3 kode tsb?
select distinct kode_kabupaten_kota, nama_kabupaten_kota from umkm_jabar where kode_kabupaten_kota like "__7%";TT
