class RecordModel{
  final int id;
  final DateTime created_at;
  final String description;

  RecordModel({
    required this.id,
    required this.created_at,
    required this.description,

  });
  factory RecordModel.create(String description){
    return RecordModel(
      id: 0,
      description: description,
      created_at: DateTime.now()
    );
  }

  String formatDate(){
    final d = created_at;
    return"${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}";
}

}