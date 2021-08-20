class IsaretEkrani {
  int? id;
  String? adi;
  String? resimYolu;
  String? aciklama;

  IsaretEkrani({this.id, this.adi, this.resimYolu, this.aciklama});

  IsaretEkrani.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    adi = json["Adi"];
    resimYolu = json["ResimYolu"];
    aciklama = json["Aciklama"];
  }
}
