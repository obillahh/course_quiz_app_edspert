class UserUpdateRequestModel {
  String? namaLengkap;
  String? email;
  String? foto;
  String? namaSekolah;
  String? jenjang;
  String? gender;
  String? kelas;

  UserUpdateRequestModel({
    this.namaLengkap,
    this.email,
    this.foto,
    this.namaSekolah,
    this.jenjang,
    this.gender,
    this.kelas,
  });

  factory UserUpdateRequestModel.fromMap(Map<String, dynamic> json) =>
      UserUpdateRequestModel(
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        foto: json["foto"],
        namaSekolah: json["nama_sekolah"],
        jenjang: json["jenjang"],
        gender: json["gender"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toMap() => {
        "nama_lengkap": namaLengkap,
        "email": email,
        "foto": foto,
        "nama_sekolah": namaSekolah,
        "jenjang": jenjang,
        "gender": gender,
        "kelas": kelas,
      };
}
