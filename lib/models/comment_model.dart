class CommentModel {
  String? comment;
  String? title;
  String? todayDate;
  String? uidDriver;
  String? response;
  String? name;
  String? seenAdmin;
  String? uidDoc;
  String? reply;
  String? seenDriver;

  CommentModel({
    this.title,
    this.comment,
    this.uidDriver,
    this.response,
    this.todayDate,
    this.name,
    this.seenAdmin,
    this.uidDoc,
    this.reply,
    this.seenDriver
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    comment = json['comment'];
    uidDriver = json['uidDriver'];
    response = json['response'];
    todayDate = json['todayDate'];
    name = json['name'];
    seenAdmin = json['seenAdmin'];
    uidDoc = json['uidDoc'];
    reply = json['reply'];
    seenDriver = json['seenDriver'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'comment': comment,
      'uidDriver': uidDriver,
      'response': response,
      'todayDate': todayDate,
      'name': name,
      'seenAdmin': seenAdmin,
      'uidDoc': uidDoc,
      'reply': reply,
      'seenDriver': seenDriver,
    };
  }
}
