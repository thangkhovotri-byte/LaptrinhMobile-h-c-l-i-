import 'dart:io';

// Hàm kiểm tra số nguyên tố
bool checkPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void xuLyDanhSach() {
  List<int> danhSach = [];
  
  // Khởi tạo danh sách
  stdout.write("Nhập số lượng phần tử của danh sách: ");
  int n = int.parse(stdin.readLineSync() ?? '0');

  for (int i = 0; i < n; i++) {
    stdout.write("Nhập phần tử thứ ${i + 1}: ");
    int val = int.parse(stdin.readLineSync() ?? '0');
    danhSach.add(val);
  }

  // a. Xuất danh sách vừa nhập ra màn hình
  print("\n--- KẾT QUẢ ---");
  print("a. Danh sách vừa nhập là: $danhSach");

  // b. Tính tổng các phần tử có trong danh sách
  int tong = 0;
  for (int so in danhSach) {
    tong += so;
  }
  print("b. Tổng các phần tử trong danh sách là: $tong");

  // c. Xuất các phần tử là số nguyên tố
  List<int> dsNguyenTo = [];
  for (int so in danhSach) {
    if (checkPrime(so)) {
      dsNguyenTo.add(so);
    }
  }
  print("c. Các phần tử là số nguyên tố: $dsNguyenTo");

  // d. Tìm kiếm và thêm vào đầu danh sách
  stdout.write("\nd. Nhập vào một giá trị bất kỳ để tìm kiếm: ");
  int giaTriTimKiem = int.parse(stdin.readLineSync() ?? '0');
  
  // indexOf sẽ trả về -1 nếu không tìm thấy, ngược lại trả về vị trí (index)
  int viTri = danhSach.indexOf(giaTriTimKiem); 
  
  if (viTri != -1) {
    print("-> Giá trị $giaTriTimKiem có trong danh sách ở vị trí index: $viTri");
  } else {
    print("-> Không tìm thấy $giaTriTimKiem trong danh sách. Tiến hành thêm vào đầu...");
    danhSach.insert(0, giaTriTimKiem); // Thêm vào vị trí số 0 (đầu danh sách)
    print("-> Danh sách mới sau khi thêm: $danhSach");
  }
}