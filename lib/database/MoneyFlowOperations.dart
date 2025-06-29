class MoneyFlowOperations {
  final int? id;
  final String title;
  final double amount;
  final String category;
  final String? description;
  final String dateOfTransaction;
  final String? proofOfPayment;

  MoneyFlowOperations({
    this.id,
    required this.title,
    required this.amount,
    required this.category,
    this.description,
    required this.dateOfTransaction,
    this.proofOfPayment,
  });

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Title": title,
      "Amount": amount,
      "Category": category,
      "Description": description,
      "DateOfTransaction": dateOfTransaction,
      "ProofOfPayment": proofOfPayment,
    };
  }

  factory MoneyFlowOperations.fromMap(Map<String, dynamic> map) {
    return MoneyFlowOperations(
      id: map["ID"] as int?,
      title: map["Title"] as String,
      amount: map["Amount"] as double,
      category: map["Category"] as String,
      description: map["Description"] as String?,
      dateOfTransaction: map["DateOfTransaction"] as String,
      proofOfPayment: map["ProofOfPayment"] as String?,
    );
  }

  @override
  String toString() {
    return 'MoneyFlowOperations(id: $id, title: $title, amount: $amount, category: $category)';
  }
}
