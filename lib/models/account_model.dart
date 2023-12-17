class UserAccount {
  final String id;
  final String userId;
  final String accountNumber;
  final String title;
  final double balance;
  final String accountType;
  final String iban;
  final String bankName;
  final String cardNo;
  final bool isActive;

  UserAccount(
      {required this.id,
      required this.userId,
      required this.accountNumber,
      required this.title,
      required this.balance,
      required this.accountType,
      required this.iban,
      required this.bankName,
      required this.cardNo,
      required this.isActive});
}
