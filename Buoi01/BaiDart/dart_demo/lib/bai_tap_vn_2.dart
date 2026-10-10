import 'dart:io';

void baiTapVeNha2() {
  // a. Nhập vào 1 chuỗi và xuất ra màn hình
  stdout.write("Nhập vào một chuỗi: ");
  String chuoi = stdin.readLineSync() ?? '';
  print("\n--- KẾT QUẢ ---");
  print("a. Chuỗi vừa nhập là: $chuoi");

  if (chuoi.trim().isEmpty) {
    print("Chuỗi rỗng, vui lòng nhập lại.");
    return;
  }

  // b. Cho biết chuỗi có bao nhiêu kí tự là nguyên âm
  // Bao gồm các nguyên âm tiếng Anh và tiếng Việt
  String tapNguyenAm = "aeiouyáàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵ";
  int demNguyenAm = 0;
  for (int i = 0; i < chuoi.length; i++) {
    if (tapNguyenAm.contains(chuoi[i].toLowerCase())) {
      demNguyenAm++;
    }
  }
  print("b. Số kí tự là nguyên âm: $demNguyenAm");

  // c. Cho biết chuỗi có bao nhiêu từ
  // Dùng RegExp r'\s+' để tách theo 1 hoặc nhiều khoảng trắng liên tiếp
  List<String> danhSachTu = chuoi.trim().split(RegExp(r'\s+'));
  int soTu = danhSachTu.length;
  print("c. Số từ trong chuỗi: $soTu");

  // d. Cho biết chuỗi có đối xứng hay không
  String chuoiDaoNguocKiTu = chuoi.split('').reversed.join('');
  bool doiXung = (chuoi == chuoiDaoNguocKiTu);
  print("d. Chuỗi ${doiXung ? 'CÓ' : 'KHÔNG'} đối xứng.");

  // e. Đảo ngược từ trong chuỗi
  String chuoiDaoNguocTu = danhSachTu.reversed.join(' ');
  print("e. Đảo ngược từ: $chuoiDaoNguocTu");
}