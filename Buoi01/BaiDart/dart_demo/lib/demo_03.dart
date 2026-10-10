// File: lib/demo_03.dart

void demo03() {
  // tạo một danh sách chứa các số nguyên
  List<int> arrs = [10, 20, 30, 40, 50];

  // Cách 1: Sử dụng vòng lặp for
  print("--- Cách 1: Sử dụng vòng lặp for ---");
  for (int i = 0; i < arrs.length; i++) {
    print("Phần tử thứ $i: ${arrs[i]}");
  }

  // Cách 2: Sử dụng forEach
  print("--- Cách 2: Sử dụng forEach ---");
  arrs.forEach((num) {
    print("Giá trị: $num");
  });

  // Cách 3: Sử dụng vòng lặp for-in
  print("--- Cách 3: Sử dụng vòng lặp for-in ---");
  for (var num in arrs) {
    print("Số: $num");
  }
}