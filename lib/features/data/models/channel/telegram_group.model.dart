class TelegramGroup {
  int? id;
  String? title;
  String? merchant;
  String? token;

  TelegramGroup({this.id, this.title, this.merchant, this.token});

  factory TelegramGroup.fromJson(Map<String, dynamic> json) => TelegramGroup(
        id: json['id'] as int?,
        title: json['title'] as String?,
        merchant: json['merchant'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'merchant': merchant,
        'token': token,
      };
}
