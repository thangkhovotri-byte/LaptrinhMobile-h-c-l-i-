import 'HoaDon.dart';

class KhachHangCaNhan extends HoaDon {
  double khoangCach;

  KhachHangCaNhan(String ma, String ten, int sl, double gia, this.khoangCach)
      : super.fullPara(ma, ten, sl, gia);

  @override
  double tinhChietKhau() {
    double ck = (soLuong >= 3) ? (0.05 * giaBan * soLuong) : 0; //[cite: 44]
    if (khoangCach < 10) ck += 50000 * soLuong; //[cite: 44]
    return ck;
  }

  @override
  double tinhTroGia() {
    double troGia = 0.02 * giaBan * soLuong; //[cite: 45]
    if (soLuong > 2) troGia += 100000; //[cite: 45]
    return troGia;
  }
}