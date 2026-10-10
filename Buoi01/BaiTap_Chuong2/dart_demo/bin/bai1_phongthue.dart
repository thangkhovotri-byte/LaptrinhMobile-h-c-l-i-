import 'dart:io';
import '../lib/PhongThue.dart';

void main() async {
  List<PhongThue> dsPhong = [];

  // 1. Đọc nội dung file phongthue.txt[cite: 43]
  try {
    List<String> lines = await File('lib/phongthue.txt').readAsLines();
    for (String line in lines) {
      List<String> parts = line.split('#');
      if (parts[0].startsWith('A')) {
        dsPhong.add(PhongLoaiA(parts[0], int.parse(parts[1]), double.parse(parts[2]),
            double.parse(parts[3]), int.parse(parts[4])));
      } else if (parts[0].startsWith('B')) {
        dsPhong.add(PhongLoaiB(parts[0], int.parse(parts[1]), double.parse(parts[2]),
            double.parse(parts[3]), double.parse(parts[4]), int.parse(parts[5])));
      }
    }
  } catch (e) {
    print("Lỗi đọc file: $e");
    return;
  }

  // 2. In ra màn hình thông tin các phòng thuê[cite: 43]
  print("--- DANH SÁCH TẤT CẢ PHÒNG THUÊ ---");
  for (var p in dsPhong) { p.inThongTin(); }

  // 3. In ra danh sách các phòng có số người thuê > 2[cite: 43]
  print("\n--- PHÒNG CÓ SỐ NGƯỜI THUÊ > 2 ---");
  for (var p in dsPhong.where((p) => p.soNguoi > 2)) { p.inThongTin(); }

  // 4. Tính tổng tiền phòng thu được[cite: 43]
  double tongTien = dsPhong.fold(0, (sum, p) => sum + p.tinhTien());
  print("\n=> Tổng tiền thu được: $tongTien");

  // 5. Sắp xếp giảm dần theo số điện tiêu thụ[cite: 43]
  dsPhong.sort((a, b) => b.soDien.compareTo(a.soDien));
  print("\n--- DANH SÁCH SAU KHI SẮP XẾP GIẢM DẦN THEO SỐ ĐIỆN ---");
  for (var p in dsPhong) { p.inThongTin(); }

  // 6. In ra màn hình danh sách các phòng loại A[cite: 43]
  print("\n--- DANH SÁCH PHÒNG LOẠI A ---");
  for (var p in dsPhong.whereType<PhongLoaiA>()) { p.inThongTin(); }
}