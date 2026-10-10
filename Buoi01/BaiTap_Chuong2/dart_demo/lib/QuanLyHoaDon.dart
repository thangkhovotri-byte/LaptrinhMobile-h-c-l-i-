import 'HoaDon.dart';
import 'KhachHangCongTy.dart';

class QuanLyHoaDon {
  List<HoaDon> dsHoaDon = [];

  // Nhập danh sách các hoá đơn
  void themHoaDon(HoaDon hd) {
    dsHoaDon.add(hd);
  }

  // Xuất danh sách các hoá đơn[cite: 45]
  void xuatDanhSach() {
    if (dsHoaDon.isEmpty) {
      print("Danh sách trống.");
      return;
    }
    for (var hd in dsHoaDon) {
      hd.xuatThongTin();
      print("------------------------------");
    }
  }

  // Tính tổng thành tiền của tất cả các hóa đơn[cite: 45]
  double tongThanhTien() {
    return dsHoaDon.fold(0, (sum, hd) => sum + hd.tinhThanhTien());
  }

  // Tính tổng tiền trợ giá mà công ty đã hỗ trợ[cite: 45]
  double tongTroGia() {
    return dsHoaDon.fold(0, (sum, hd) => sum + hd.tinhTroGia());
  }

  // Cho biết thông tin khách hàng có số lượng mua nhiều nhất[cite: 45]
  void khachHangMuaNhieuNhat() {
    if (dsHoaDon.isEmpty) return;
    int maxSL = dsHoaDon.fold(0, (max, hd) => hd.soLuong > max ? hd.soLuong : max);
    
    print("--- KHÁCH HÀNG MUA NHIỀU NHẤT ($maxSL SẢN PHẨM) ---");
    for (var hd in dsHoaDon.where((hd) => hd.soLuong == maxSL)) {
      hd.xuatThongTin();
    }
  }

  // Tổng số tiền chiết khấu của công ty đối với khách hàng công ty[cite: 45]
  double tongChietKhauKHCongTy() {
    return dsHoaDon.whereType<KhachHangCongTy>().fold(0, (sum, hd) => sum + hd.tinhChietKhau());
  }

  // Sắp xếp danh sách tăng dần theo số lượng, nếu bằng nhau thì giảm dần theo thành tiền[cite: 45]
  void sapXepDanhSach() {
    dsHoaDon.sort((a, b) {
      int cmp = a.soLuong.compareTo(b.soLuong);
      if (cmp != 0) return cmp;
      return b.tinhThanhTien().compareTo(a.tinhThanhTien());
    });
    print("=> Đã sắp xếp danh sách theo yêu cầu.");
  }

  // Tìm hóa đơn theo mã khách hàng, nếu không có in "Khách hàng lạ"[cite: 45]
  void timTheoMa(String maKH) {
    var ketQua = dsHoaDon.where((hd) => hd.maKH == maKH).toList();
    if (ketQua.isEmpty) {
      print("Khách hàng lạ");
    } else {
      for (var hd in ketQua) {
        hd.xuatThongTin();
      }
    }
  }
}