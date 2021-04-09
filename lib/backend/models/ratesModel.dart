class Rates {
  Rates({
    this.inr,
  });
  dynamic inr;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        inr: json["INR"],
      );
}
