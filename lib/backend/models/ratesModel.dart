class Rates {
  Rates({
    this.inr,
  });
  double inr;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        inr: json["INR"],
      );
}
