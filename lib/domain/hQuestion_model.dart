/* Developed by Eng Mouaz M AlShahmeh */
class HQuestionModel {
  HQuestionModel({
    this.id,
    this.question,
  });

  HQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
  }

  int? id;
  String? question;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    return data;
  }
}
