import '../lib/KhachHangCaNhan.dart';
import '../lib/DaiLyCap1.dart';
import '../lib/KhachHangCongTy.dart';
import '../lib/QuanLyHoaDon.dart';

void main() {
  // Khởi tạo đối tượng quản lý
  QuanLyHoaDon ql = QuanLyHoaDon();

  // Tạo một số hóa đơn mẫu với đơn giá máy lạnh giả định là 10.000.000 VNĐ
  ql.themHoaDon(KhachHangCaNhan("KH0001", "Nguyễn Văn A", 4, 10000000, 8)); // Cá nhân, mua 4, cách 8km
  ql.themHoaDon(DaiLyCap1("KH0002", "Đại lý Điện Máy Xanh", 10, 10000000, 6)); // Đại lý, mua 10, hợp tác 6 năm
  ql.themHoaDon(KhachHangCongTy("KH0003", "Công ty TNHH Phần Mềm", 2, 10000000, 2000)); // Cty, mua 2, 2000 NV
  ql.themHoaDon(KhachHangCaNhan("KH0004", "Trần Thị B", 4, 10000000, 15)); // Cá nhân, mua 4, cách 15km

  // 1. Xuất danh sách
  print("===== DANH SÁCH HÓA ĐƠN =====");
  ql.xuatDanhSach();

  // 2. Tính tổng
  print("=> Tổng thành tiền: ${ql.tongThanhTien()} VNĐ");
  print("=> Tổng tiền trợ giá: ${ql.tongTroGia()} VNĐ");
  print("=> Tổng chiết khấu cho KH Công ty: ${ql.tongChietKhauKHCongTy()} VNĐ\n");

  // 3. Tìm khách hàng mua nhiều nhất
  ql.khachHangMuaNhieuNhat();
  print("\n");

  // 4. Tìm kiếm theo mã khách hàng
  print("--- TÌM KIẾM HÓA ĐƠN MÃ KH0002 ---");
  ql.timTheoMa("KH0002");
  
  print("\n--- TÌM KIẾM HÓA ĐƠN MÃ KH9999 ---");
  ql.timTheoMa("KH9999");

  // 5. Sắp xếp danh sách
  print("\n--- KẾT QUẢ SẮP XẾP ---");
  ql.sapXepDanhSach();
  ql.xuatDanhSach();
}