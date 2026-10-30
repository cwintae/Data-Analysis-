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
select distinct kode_kabupaten_kota, nama_kabupaten_kota from umkm_jabar where kode_kabupaten_kota like "__7%";

--  berapa jumlah baris dari umkm_jabar?
select count(*) from umkm_jabar;
select count(*) as jumlah_baris from umkm_jabar; #menggunakan alias (as)

--  berapa jumlah umkm di kabupaten bekasi pada tahun 2017?
select sum(proyeksi_jumlah_umkm) as jumlah_umkm_kabupaten_bekasi_2017 from umkm_jabar 
where nama_kabupaten_kota= "kabupaten bekasi" and tahun= 2017;

-- 3. bagaimana tren jumlah umkm di kabupaten karawang dari tahun 2017 s/d 2021?
select tahun, sum(proyeksi_jumlah_umkm) as jumlah_umkm_kabupaten_karawang from umkm_jabar 
where nama_kabupaten_kota="kabupaten karawang" and tahun >=2017 and tahun <=2021 group by tahun;

--  berapa jumlah rata2 umkm setiap kategori usaha di setiap kabupaten/kota dari tahun ke tahun?
select tahun, nama_kabupaten_kota, kategori_usaha, avg(proyeksi_jumlah_umkm) as rerata_umkm_setiap_kategori_usaha 
from umkm_jabar where tahun = 2021 group by tahun, nama_kabupaten_kota, kategori_usaha;

--  nilai min & max dari kolom jumlah umkm?
select min(proyeksi_jumlah_umkm) as jumlah_umkm_min, max(proyeksi_jumlah_umkm) as jumlah_umkm_max from umkm_jabar;

--  kab/kota apa yg memiliki jmlh umkm kurang dari 100.000 pd tahun 2020?
select nama_kabupaten_kota, sum(proyeksi_jumlah_umkm) as jml_umkm_thn_2020 from umkm_jabar where tahun=2020 
group by nama_kabupaten_kota having jml_umkm_thn_2020 <=100000;

select*from umkm.umkm_jabar;

-- 1. membuat store procedure sederhana
DELIMITER $$
create procedure alldata()
begin
	select*from umkm.umkm_jabar;
end $$

-- 2. memanggil store prosedure
call alldata;

-- 3. mengecek stored procedure
show procedure status; 

-- menghapus stored procedure
drop procedure alldata;

