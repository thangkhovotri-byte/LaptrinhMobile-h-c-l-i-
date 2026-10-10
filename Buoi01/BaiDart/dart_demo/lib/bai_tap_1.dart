// File: lib/bai_tap_1.dart
import 'dart:io';

void tinhTienKem() {
  stdout.write("Nhập số que kem cần mua (>0): ");
  String? slInput = stdin.readLineSync();
  int soLuong = int.parse(slInput ?? '0');

  if (soLuong <= 0) {
    print("Số lượng que kem phải lớn hơn 0!");
    return; // Kết thúc hàm nếu nhập sai
  }

  stdout.write("Nhập giá tiền cho 1 que kem: ");
  String? giaInput = stdin.readLineSync();
  double giaTien = double.parse(giaInput ?? '0');

  double tongTien = soLuong * giaTien;
  double thanhTien = 0;

  // Tính toán giảm giá theo yêu cầu bài toán
  if (soLuong > 10) {
    thanhTien = tongTien * 0.9; // Giảm 10%
    print("Bạn được giảm 10%!");
  } else if (soLuong >= 5 && soLuong <= 10) {
    thanhTien = tongTien * 0.95; // Giảm 5%
    print("Bạn được giảm 5%!");
  } else {
    thanhTien = tongTien; // Không giảm
    print("Bạn không được giảm giá.");
  }

  print("Số tiền thực tế phải trả là: $thanhTien VNĐ");
}