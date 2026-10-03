void main() {
  // PERHITUNGAN NILAI MAHASISWA
  int tugas = 82;
  int uts = 75;
  int uas = 88;
  int jumlahHadir = 13;

  double hasilAkhir =
      (tugas * 0.30) +
      (uts * 0.30) +
      (uas * 0.40);

  bool nilaiMemenuhi = hasilAkhir >= 60;
  bool kehadiranMemenuhi = jumlahHadir >= 11;

  print('=== HASIL PENILAIAN ===');
  print('Nilai akhir : ${hasilAkhir.toStringAsFixed(1)}');
  print('Grade       : ${tentukanGrade(hasilAkhir)}');
  print('Lulus       : ${nilaiMemenuhi && kehadiranMemenuhi}');

  // OPERATOR TERNARY
  int usiaMahasiswa = 21;

  String kategoriUsia =
      usiaMahasiswa >= 17 ? 'Sudah dewasa' : 'Belum dewasa';

  print('\n=== KATEGORI USIA ===');
  print('Usia      : $usiaMahasiswa tahun');
  print('Kategori  : $kategoriUsia');

  // SEWA KAMERA
  print('\n=== SEWA KAMERA ===');

  print(prosesSewaKamera(2, true));
  print(prosesSewaKamera(6, true));
  print(prosesSewaKamera(3, false));

  // SWITCH STATEMENT
  String jadwal = 'Minggu';

  print('\n=== JADWAL ===');

  switch (jadwal) {
    case 'Sabtu':
    case 'Minggu':
      print('Hari ini libur');
      break;

    default:
      print('Hari ini ada kegiatan kuliah');
  }

  // SWITCH EXPRESSION
  String kodeGrade = 'B';

  String deskripsi = switch (kodeGrade) {
    'A' => 'Prestasi sangat baik',
    'B' => 'Prestasi baik',
    'C' => 'Prestasi cukup',
    'D' => 'Perlu meningkatkan belajar',
    _ => 'Grade tidak dikenal',
  };

  print('\n=== KETERANGAN GRADE ===');
  print('Grade      : $kodeGrade');
  print('Keterangan : $deskripsi');
}

// FUNCTION MENENTUKAN GRADE
String tentukanGrade(double nilai) {
  if (nilai >= 85) {
    return 'A';
  } else if (nilai >= 70) {
    return 'B';
  } else if (nilai >= 60) {
    return 'C';
  } else {
    return 'D';
  }
}

// FUNCTION SEWA KAMERA
String prosesSewaKamera(
  int jumlahKamera,
  bool kameraTersedia,
) {
  if (jumlahKamera > 5) {
    return 'Sewa ditolak: maksimal 5 kamera';
  }

  if (!kameraTersedia) {
    return 'Sewa ditolak: kamera sedang tidak tersedia';
  }

  return 'Sewa kamera berhasil dilakukan';
}
