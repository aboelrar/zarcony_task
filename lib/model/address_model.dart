class AddressModel {
  String? addressTitle;
  String? address;
  String? place;

  AddressModel({this.addressTitle, this.address, this.place});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressTitle = json['addressTitle'];
    address = json['address'];
    place = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressTitle'] = this.addressTitle;
    data['address'] = this.address;
    data['place'] = this.place;
    return data;
  }
}