Uses tabuniverse, sysutils;

procedure InventoriBahanMentah (inf : textfile); {Membaca file eksternal yang bernama 'bahanmentah.txt' terus dimasukkin ke tipe bentukan mentah}

var {KAMUS LOKAL LoadBahanMentah}
	guardMark 	: integer; {Menandakan posisi karakter guard dalam string}
	slashMark 	: integer; {Menandakan posisi karakter slash dalam string)
	i 			: integer;
	j			: integer; {Menandakan jumlah bahan mentah dalam file eksternal}
	k			: integer; 
	temp	: array [1..100] of char;  {Menyimpan data harga bahan dalam bentuk string sebelum di-convert ke integer}
	tempHari	: array [1..100] of char;  {Menyimpan data jumlah bahan dalam bentuk string sebelum di-convert ke integer}
	tempBulan	: array [1..100] of char;
	temptahun	: array [1..100] of char;
	tempJumlah	: array [1..100] of char;
	
	
begin {ALGORITMA UTAMA LoadBahanMentah}
	assign (inf, 'inventoribahanmentah.txt');
	reset (inf);
	j := 1;
	while (not(EOF(inf))) do
	begin		
		readln (inf, temp);
		{Membaca nama bahan mentah yang bertipe string}
		guardMark := pos ('|', temp);
		for i := 1 to (guardMark-2) do
		begin
			tabInventoriM.tab.nama[i] := temp[i];
		end;
		{Membaca Hari beli yang bertipe integer}
		temp := copy (temp,guardMark+2, length(temp) - guardMark - 2);
		slashMark := pos ('/', temp);
		for i :=1 to (slashMark-1) do
		begin
			tempHari[i] := temp[i]
		end;
		tabInventoriM.tab[j].tglbeli.hari := StrToInt (tempHari);
		{Membaca Bulan beli yang bertipe integer}
		temp := copy (temp,slashmark+1, length(temp) - slashmark-1);
		slashMark := pos ('/', temp);
		for i :=1 to (slashmark) do
		begin
			tempBulan[i] := temp[i]
		end;
		tabinventoriM.tab[j].tglbeli.bulan := StrToInt (tempBulan);
		{Membaca Tahun beli yang bertipe integer}
		temp := copy (temp,slashmark + 1, length(temp) - slashmark -1);
		guardMark := pos ('|', temp);
		for i :=1 to (guardMark-2) do
		begin
			tempTahun[i] := temp[i]
		end;
		tabinventoriM.tab[j].tglbeli.tahun := StrToInt (tempTahun);
		{Membaca jumlah bahan mentah yang bertipe integer}
		temp := copy (temp,guardMark+2, length(temp) - guardMark - 2);
		for i :=1 to (length(temp)) do
		begin
			tempJumlah[i] := temp[i]
		end;
		tabinventoriM.tab[j].jumlah := StrToInt (tempJumlah);
		
		j := j + 1;
		end;
		close (inf);
+end.
