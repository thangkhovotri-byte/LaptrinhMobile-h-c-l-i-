abstract class PhongThue {
  String maPhong;
  int soNguoi;
  double soDien;
  double soNuoc;

  PhongThue(this.maPhong, this.soNguoi, this.soDien, this.soNuoc);

  // Phương thức trừu tượng tính tiền
  double tinhTien();

  void inThongTin() {
    print("Mã phòng: $maPhong | Số người: $soNguoi | Điện: $soDien | Nước: $soNuoc | Tiền phòng: ${tinhTien()}");
  }
}

class PhongLoaiA extends PhongThue {
  int soNguoiThan;

  PhongLoaiA(String maPhong, int soNguoi, double soDien, double soNuoc, this.soNguoiThan)
      : super(maPhong, soNguoi, soDien, soNuoc);

  @override
  double tinhTien() {
    // Tiền = 1400 + 2*Số điện + 8*Số nước + 50*SoNguoithan[cite: 43]
    return 1400 + (2 * soDien) + (8 * soNuoc) + (50 * soNguoiThan);
  }
}

class PhongLoaiB extends PhongThue {
  double giatUi;
  int soMay;

  PhongLoaiB(String maPhong, int soNguoi, double soDien, double soNuoc, this.giatUi, this.soMay)
      : super(maPhong, soNguoi, soDien, soNuoc);

  @override
  double tinhTien() {
    // Tiền = 2000 + 2*Số điện + 8*Số nước + Giatui*5 + Somay*100[cite: 43]
    return 2000 + (2 * soDien) + (8 * soNuoc) + (giatUi * 5) + (soMay * 100);
  }
}