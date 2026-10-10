import 'HoaDon.dart';

class DaiLyCap1 extends HoaDon {
  int thoiGianHopTac; // Tính bằng năm[cite: 44]

  DaiLyCap1(String ma, String ten, int sl, double gia, this.thoiGianHopTac)
      : super.fullPara(ma, ten, sl, gia);

  @override
  double tinhChietKhau() {
    double phanTram = 30.0; //[cite: 44]
    if (thoiGianHopTac > 5) {
      phanTram += (thoiGianHopTac - 5); //[cite: 44]
      if (phanTram > 35.0) phanTram = 35.0; //[cite: 44]
    }
    return (phanTram / 100) * giaBan * soLuong;
  }
}