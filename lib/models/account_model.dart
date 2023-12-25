class UserAccount {
  String? accountNumber;
  String? title;
  double? balance;
  String? accountType;
  String? iban;
  String? bankName;
  String? cardNo;
  bool? isActive;

  UserAccount(
      {this.accountNumber,
      this.title,
      this.balance,
      this.accountType,
      this.iban,
      this.bankName,
      this.cardNo,
      this.isActive});

  UserAccount.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    title = json['title'];
    balance = json['balance'].toDouble();
    iban = json['iban'];
    bankName = json['bankName'];
    cardNo = json['cardNo'];
    isActive = json['isActive'];
  }
}
