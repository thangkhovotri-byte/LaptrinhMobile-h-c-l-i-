abstract class HoaDon {
  String _maKH = '';
  String _tenKH = '';
  int _soLuong = 0;
  double _giaBan = 0;

  HoaDon() {
    _maKH = "KH0000";
    _tenKH = "Chưa xác định";
    _soLuong = 1;
    _giaBan = 1;
  }

  HoaDon.fullPara(String maKH, String tenKH, int soLuong, double giaBan) {
    this.maKH = maKH;
    this.tenKH = tenKH;
    this.soLuong = soLuong;
    this.giaBan = giaBan;
  }

  String get maKH => _maKH;
  set maKH(String value) {
    if (RegExp(r'^KH\d{4}$').hasMatch(value)) {
      _maKH = value;
    } else {
      print("Lỗi: Mã KH phải có dạng KHxxxx.");
    }
  }

  String get tenKH => _tenKH;
  set tenKH(String value) {
    if (value.isNotEmpty) _tenKH = value;
  }

  int get soLuong => _soLuong;
  set soLuong(int value) {
    if (value > 0) _soLuong = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value > 0) _giaBan = value;
  }

  double tinhChietKhau();
  double tinhTroGia() => 0.0; // Mặc định không trợ giá[cite: 45]

  double tinhVAT() => 0.1 * (_soLuong * _giaBan); //

  double tinhThanhTien() => (_soLuong * _giaBan) - tinhChietKhau() + tinhVAT(); //

  void xuatThongTin() {
    print("Mã KH: $_maKH | Tên: $_tenKH | SL: $_soLuong | Giá: $_giaBan");
    print("Chiết khấu: ${tinhChietKhau()} | Trợ giá: ${tinhTroGia()} | Thành tiền: ${tinhThanhTien()}");
  }
}