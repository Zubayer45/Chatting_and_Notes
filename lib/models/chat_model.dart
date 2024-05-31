class ChatModel {
  int? id;
  String? name;
  String? icon;
  bool? isGroup;
  DateTime? dateTime;
  String? currentMessage;
  ChatModel(
      {this.id,
      this.name,
      this.icon,
      this.isGroup,
      this.dateTime,
      this.currentMessage});
}
