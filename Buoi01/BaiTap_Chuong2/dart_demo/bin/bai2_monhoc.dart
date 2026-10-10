import 'dart:io';
import '../lib/MonHoc.dart';

void main() async {
  List<MonHoc> dsMonHoc = [];

  // Đọc nội dung file vào danh sách[cite: 44]
  try {
    List<String> lines = await File('lib/monhoc.txt').readAsLines();
    for (String line in lines) {
      List<String> parts = line.split('#');
      String loai = parts[0], ma = parts[1], ten = parts[2];
      int tc = int.parse(parts[3]);

      if (loai == 'LT') {
        dsMonHoc.add(LyThuyet(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5])));
      } else if (loai == 'TH') {
        dsMonHoc.add(ThucHanh(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5]), double.parse(parts[6])));
      } else if (loai == 'DA') {
        dsMonHoc.add(DoAn(ma, ten, tc, double.parse(parts[4]), double.parse(parts[5])));
      }
    }
  } catch (e) {
    print("Lỗi đọc file: $e"); return;
  }

  // Xuất danh sách môn học[cite: 44]
  print("--- DANH SÁCH MÔN HỌC ---");
  for (var mh in dsMonHoc) { mh.xuatThongTin(); }

  // Kiểm tra sắp xếp tăng dần theo tên[cite: 44]
  bool isSorted = true;
  for (int i = 0; i < dsMonHoc.length - 1; i++) {
    if (dsMonHoc[i].tenMH.compareTo(dsMonHoc[i + 1].tenMH) > 0) {
      isSorted = false; break;
    }
  }
  print("\n=> Danh sách ${isSorted ? 'ĐÃ' : 'CHƯA'} sắp xếp tăng dần theo tên.");

  // Sắp xếp tăng dần theo số tín chỉ[cite: 44]
  dsMonHoc.sort((a, b) => a.soTC.compareTo(b.soTC));
  print("\n--- DANH SÁCH TĂNG DẦN THEO TÍN CHỈ ---");
  for (var mh in dsMonHoc) { mh.xuatThongTin(); }

  // Môn học có số tín chỉ cao nhất[cite: 44]
  int maxTC = dsMonHoc.fold(0, (max, mh) => mh.soTC > max ? mh.soTC : max);
  print("\n--- MÔN CÓ TÍN CHỈ CAO NHẤT ($maxTC TC) ---");
  for (var mh in dsMonHoc.where((mh) => mh.soTC == maxTC)) { mh.xuatThongTin(); }

  // Tính số tín chỉ trung bình[cite: 44]
  double tbTC = dsMonHoc.fold(0, (sum, mh) => sum + mh.soTC) / dsMonHoc.length;
  print("\n=> Tín chỉ trung bình: ${tbTC.toStringAsFixed(2)}");

  // Tìm và thêm môn học[cite: 44]
  stdout.write("\nNhập tên môn học cần tìm: ");
  String? tenTim = stdin.readLineSync();
  if (tenTim != null && tenTim.isNotEmpty) {
    var index = dsMonHoc.indexWhere((mh) => mh.tenMH.toLowerCase() == tenTim.toLowerCase());
    if (index != -1) {
      print("Đã tìm thấy:");
      dsMonHoc[index].xuatThongTin();
    } else {
      print("Không tìm thấy. Hãy nhập để thêm vào cuối danh sách:");
      stdout.write("Mã MH: "); String maMoi = stdin.readLineSync() ?? "MH00";
      stdout.write("Số TC: "); int tcMoi = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      dsMonHoc.add(LyThuyet(maMoi, tenTim, tcMoi, 0, 0));
      print("Đã thêm thành công!");
    }
  }
}