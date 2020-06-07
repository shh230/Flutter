class Chat {
  final String name;
  final String imageUrl;
  final String message;

  Chat({this.name, this.imageUrl, this.message});
  factory Chat.formJson(Map json) {
    return Chat(
      name: json['name'],
      imageUrl: json['imageUrl'],
      message: json['message'],
    );
  }
}