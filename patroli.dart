// Studi Kasus Sistem Patroli Security
 
  Nama : Aditiya Surya Putra
  Nim :1124160148

enum StatusPatroli {
  tepatWaktu,
  terlambat,
  urutanSalah,
}

class Checkpoint {
  String nama;
  int urutan;
  int jamTarget;
  int menitTarget;

  Checkpoint(
    this.nama,
    this.urutan,
    this.jamTarget,
    this.menitTarget,
  );
}

StatusPatroli cekPatroli(
  Checkpoint checkpoint,
  int urutanScan,
  int jamScan,
  int menitScan,
) {
  // Cek urutan checkpoint
  if (urutanScan != checkpoint.urutan) {
    return StatusPatroli.urutanSalah;
  }

  int target = checkpoint.jamTarget * 60 + checkpoint.menitTarget;
  int scan = jamScan * 60 + menitScan;

  int selisih = scan - target;

  // Terlambat jika lebih dari 15 menit
  if (selisih > 15) {
    return StatusPatroli.terlambat;
  }

  return StatusPatroli.tepatWaktu;
}

void main() {
  String petugas = "Adit";

  List<Checkpoint> checkpoint = [
    Checkpoint("Gerbang Utama", 1, 8, 0),
    Checkpoint("Area Parkir", 2, 8, 15),
    Checkpoint("Gedung Utama", 3, 8, 30),
    Checkpoint("Area Belakang", 4, 8, 45),
  ];

  // Data scan
  List<Map<String, int>> scan = [
    {"urutan": 1, "jam": 8, "menit": 5},
    {"urutan": 2, "jam": 8, "menit": 20},
    {"urutan": 3, "jam": 8, "menit": 50},
    {"urutan": 4, "jam": 9, "menit": 10},
  ];

  print("================================");
  print("     SISTEM PATROLI SECURITY");
  print("================================");
  print("Petugas : $petugas");
  print("");

  for (int i = 0; i < checkpoint.length; i++) {
    var hasil = cekPatroli(
      checkpoint[i],
      scan[i]["urutan"]!,
      scan[i]["jam"]!,
      scan[i]["menit"]!,
    );

    String status;

    switch (hasil) {
      case StatusPatroli.tepatWaktu:
        status = "Tepat Waktu";
        break;

      case StatusPatroli.terlambat:
        status = "Terlambat";
        break;

      case StatusPatroli.urutanSalah:
        status = "Urutan Salah";
        break;
    }

    print("--------------------------------");
    print("Checkpoint : ${checkpoint[i].nama}");
    print("Urutan     : ${checkpoint[i].urutan}");
    print("Status     : $status");
  }

  print("--------------------------------");
  print("Patroli selesai.");
  print("================================");
}
