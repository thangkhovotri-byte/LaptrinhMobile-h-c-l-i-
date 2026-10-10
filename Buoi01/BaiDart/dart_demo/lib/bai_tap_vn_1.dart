import 'dart:io';
import 'dart:math';

void baiTapVeNha1() {
  Random random = Random();
  
  stdout.write("Nhập số lượng phần tử muốn tạo ngẫu nhiên: ");
  int n = int.parse(stdin.readLineSync() ?? '10');

  // Tạo danh sách n phần tử ngẫu nhiên từ 5 đến 100
  // Công thức: nextInt(max - min + 1) + min -> nextInt(100 - 5 + 1) + 5
  List<int> danhSach = List.generate(n, (_) => random.nextInt(96) + 5);

  print("\n--- KẾT QUẢ ---");
  // a. Xuất các phần tử
  print("a. Danh sách ngẫu nhiên được tạo: $danhSach");

  // b (trong tài liệu ghi a). Tính tổng
  int tong = 0;
  for (int so in danhSach) tong += so;
  print("b. Tổng các phần tử: $tong");

  // c (b). Tính trung bình cộng các số lẻ
  List<int> soLe = danhSach.where((x) => x % 2 != 0).toList();
  if (soLe.isEmpty) {
    print("c. Danh sách không có số lẻ.");
  } else {
    double tbc = soLe.reduce((a, b) => a + b) / soLe.length;
    print("c. Trung bình cộng các số lẻ: $tbc");
  }

  // d (c). Kiểm tra danh sách đối xứng
  bool doiXung = true;
  for (int i = 0; i < danhSach.length ~/ 2; i++) {
    if (danhSach[i] != danhSach[danhSach.length - 1 - i]) {
      doiXung = false;
      break;
    }
  }
  print("d. Danh sách ${doiXung ? 'CÓ' : 'KHÔNG'} đối xứng.");

  // e (d). Kiểm tra sắp xếp tăng dần
  bool tangDan = true;
  for (int i = 0; i < danhSach.length - 1; i++) {
    if (danhSach[i] > danhSach[i + 1]) {
      tangDan = false;
      break;
    }
  }
  print("e. Danh sách ${tangDan ? 'CÓ' : 'KHÔNG'} sắp xếp tăng dần.");

  // f (e). Tìm phần tử lớn nhất
  int maxVal = danhSach.reduce(max);
  print("f. Phần tử lớn nhất trong danh sách: $maxVal");

  // g (f). Tìm số chẵn lớn nhất
  List<int> soChan = danhSach.where((x) => x % 2 == 0).toList();
  if (soChan.isEmpty) {
    print("g. Danh sách không có số chẵn.");
  } else {
    int maxChan = soChan.reduce(max);
    print("g. Số chẵn lớn nhất: $maxChan");
  }

  // h (g). Nhập một giá trị, tìm và xóa
  stdout.write("\nh. Nhập một giá trị cần tìm và xóa: ");
  int giaTri = int.parse(stdin.readLineSync() ?? '0');

  if (!danhSach.contains(giaTri)) {
    print("-> Không tìm thấy giá trị $giaTri.");
  } else {
    // removeWhere sẽ xóa tất cả các phần tử thỏa mãn điều kiện
    danhSach.removeWhere((element) => element == giaTri);
    print("-> Đã xóa. Danh sách mới: $danhSach");
  }
}