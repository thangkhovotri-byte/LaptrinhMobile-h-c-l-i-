import 'HoaDon.dart';

class KhachHangCongTy extends HoaDon {
  int soNhanVien;

  KhachHangCongTy(String ma, String ten, int sl, double gia, this.soNhanVien)
      : super.fullPara(ma, ten, sl, gia);

  @override
  double tinhChietKhau() {
    if (soNhanVien > 5000) return 0.07 * giaBan * soLuong; //[cite: 45]
    if (soNhanVien > 1000) return 0.05 * giaBan * soLuong; //[cite: 45]
    return 0.0;
  }

  @override
  double tinhTroGia() {
    return 120000.0 * soLuong; //[cite: 45]
  }
}