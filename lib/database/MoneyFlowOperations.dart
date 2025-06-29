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
      "id": id,
      "title": title,
      "amount": amount,
      "category": category,
      "description": description,
      "dateOfTransaction": dateOfTransaction,
      "proofOfPayment": proofOfPayment,
    };
  }

  factory MoneyFlowOperations.fromMap(Map<String, dynamic> map) {
    return MoneyFlowOperations(
      id: map["id"] as int?,
      title: map["title"] as String,
      amount: map["amount"] as double,
      category: map["category"] as String,
      description: map["description"] as String?,
      dateOfTransaction: map["dateOfTransaction"] as String,
      proofOfPayment: map["proofOfPayment"] as String?,
    );
  }

  @override
  String toString() {
    return 'MoneyFlowOperations(id: $id, title: $title, amount: $amount, category: $category)';
  }
}
