import 'dart:io';

// Hàm phụ để kiểm tra chữ số nguyên tố (các chữ số nguyên tố chỉ có thể là 2, 3, 5, 7)
bool isPrimeDigit(int digit) {
  return digit == 2 || digit == 3 || digit == 5 || digit == 7;
}

void xuLySoNguyen() {
  stdout.write("Nhập một số nguyên dương > 10: ");
  String? input = stdin.readLineSync();
  
  if (input == null || input.isEmpty) return;
  int number = int.parse(input);
  
  if (number <= 10) {
    print("Số nhập vào phải lớn hơn 10!");
    return;
  }

  String numStr = number.toString();
  int soChuSo = numStr.length; // Yêu cầu a
  int tong = 0; // Yêu cầu b
  bool coSoLe = false; // Yêu cầu c
  int maxDigit = 0; // Yêu cầu d
  bool coSoNguyenTo = false; // Yêu cầu e

  for (int i = 0; i < soChuSo; i++) {
    int digit = int.parse(numStr[i]);
    
    tong += digit; // Cộng dồn tính tổng
    
    if (digit % 2 != 0) coSoLe = true; // Kiểm tra số lẻ
    
    if (digit > maxDigit) maxDigit = digit; // Tìm max
    
    if (isPrimeDigit(digit)) coSoNguyenTo = true; // Kiểm tra nguyên tố
  }

  print("--- KẾT QUẢ ---");
  print("a. Số $number có $soChuSo chữ số.");
  print("b. Tổng các chữ số là: $tong");
  print("c. Có chứa chữ số lẻ không? -> ${coSoLe ? 'Có' : 'Không'}");
  print("d. Chữ số lớn nhất trong số đã nhập là: $maxDigit");
  print("e. Có chứa chữ số nguyên tố không? -> ${coSoNguyenTo ? 'Có' : 'Không'}");
}