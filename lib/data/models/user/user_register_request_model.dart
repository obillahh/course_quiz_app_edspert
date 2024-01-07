class UserRegisterRequestModel {
  String? userName;
  String? userEmail;
  String? userFoto;
  String? userAsalSekolah;
  String? jenjang;
  String? userGender;
  String? kelas;

  UserRegisterRequestModel({
    this.userName,
    this.userEmail,
    this.userFoto,
    this.userAsalSekolah,
    this.jenjang,
    this.userGender,
    this.kelas,
  });

  factory UserRegisterRequestModel.fromMap(Map<String, dynamic> map) =>
      UserRegisterRequestModel(
        userName: map["nama_lengkap"],
        userEmail: map["email"],
        userFoto: map["foto"],
        userAsalSekolah: map["nama_sekolah"],
        jenjang: map["jenjang"],
        userGender: map["gender"],
        kelas: map["kelas"],
      );

  Map<String, dynamic> toMap() => {
        "nama_lengkap": userName,
        "email": userEmail,
        "foto": userFoto,
        "nama_sekolah": userAsalSekolah,
        "jenjang": jenjang,
        "gender": userGender,
        "kelas": kelas,
      };
}
