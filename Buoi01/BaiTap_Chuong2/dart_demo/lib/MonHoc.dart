abstract class MonHoc {
  String maMH;
  String tenMH;
  int soTC;

  MonHoc(this.maMH, this.tenMH, this.soTC); //[cite: 43]

  double tinhDTB();

  // Quy đổi điểm hệ 4 (điểm chữ)[cite: 43]
  String quyDoiDiem() {
    double dtb = tinhDTB();
    if (dtb >= 8.5) return 'A';
    if (dtb >= 7.0) return 'B';
    if (dtb >= 5.5) return 'C';
    if (dtb >= 4.0) return 'D';
    return 'F';
  }

  void xuatThongTin() {
    print("Mã: $maMH | Tên: $tenMH | TC: $soTC | ĐTB: ${tinhDTB().toStringAsFixed(2)} | Điểm chữ: ${quyDoiDiem()}");
  }
}

class LyThuyet extends MonHoc {
  double diemTieuLuan;
  double diemCuoiKy;

  LyThuyet(String maMH, String tenMH, int soTC, this.diemTieuLuan, this.diemCuoiKy)
      : super(maMH, tenMH, soTC);

  @override
  double tinhDTB() => diemTieuLuan * 0.3 + diemCuoiKy * 0.7; //[cite: 43]
}

class ThucHanh extends MonHoc {
  double kt1, kt2, kt3;

  ThucHanh(String maMH, String tenMH, int soTC, this.kt1, this.kt2, this.kt3)
      : super(maMH, tenMH, soTC);

  @override
  double tinhDTB() => (kt1 + kt2 + kt3) / 3; //
}

class DoAn extends MonHoc {
  double gvhd, gvpb;

  DoAn(String maMH, String tenMH, int soTC, this.gvhd, this.gvpb)
      : super(maMH, tenMH, soTC);

  @override
  double tinhDTB() => (gvhd + gvpb) / 2; //[cite: 44]
}