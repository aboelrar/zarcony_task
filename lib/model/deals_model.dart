class DealsModel {
  String? color;
  String? title;
  String? pieces;
  String? duration;
  String? currentPrice;
  String? previousPrice;
  int? favStatus;

  DealsModel(
      {this.color,
        this.title,
        this.pieces,
        this.duration,
        this.currentPrice,
        this.previousPrice,
        this.favStatus});

  DealsModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    title = json['title'];
    pieces = json['pieces'];
    duration = json['duration'];
    currentPrice = json['current_price'];
    previousPrice = json['previous_price'];
    favStatus = json['fav_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['title'] = this.title;
    data['pieces'] = this.pieces;
    data['duration'] = this.duration;
    data['current_price'] = this.currentPrice;
    data['previous_price'] = this.previousPrice;
    data['fav_status'] = this.favStatus;
    return data;
  }
}