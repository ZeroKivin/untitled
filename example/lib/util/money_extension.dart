extension MoneyExtension on num {
  String get asMoney {
    var number = this;
    var sum = '';
    var count = 0;

    while (number > 0) {
      if (count == 3) {
        sum = ' $sum';
        count = 0;
      }
      sum = '${number % 10}$sum';
      number ~/= 10;
      count++;
    }

    return '$sum ₽';
  }
}
