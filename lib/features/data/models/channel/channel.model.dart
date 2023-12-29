import 'plan_desc.model.dart';
import 'telegram_group.model.dart';

class PlanModel {
  int? id;
  String? nameChannel;
  String? name;
  int? discount;
  int? price;
  String? percentage1;
  dynamic percentage2;
  dynamic percentage3;
  int? numberBot;
  List<PlanDesc>? planDesc;
  List<TelegramGroup>? telegramGroups;

  PlanModel({
    this.id,
    this.nameChannel,
    this.name,
    this.discount,
    this.price,
    this.percentage1,
    this.percentage2,
    this.percentage3,
    this.numberBot,
    this.planDesc,
    this.telegramGroups,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        id: json['id'] as int?,
        nameChannel: json['nameChannel'] as String?,
        name: json['name'] as String?,
        discount: json['discount'] as int?,
        price: json['price'] as int?,
        percentage1: json['percentage1'] as String?,
        percentage2: json['percentage2'] as dynamic,
        percentage3: json['percentage3'] as dynamic,
        numberBot: json['number_bot'] as int?,
        planDesc: (json['plan_desc'] as List<dynamic>?)
            ?.map((e) => PlanDesc.fromJson(e as Map<String, dynamic>))
            .toList(),
        telegramGroups: (json['telegram_groups'] as List<dynamic>?)
            ?.map((e) => TelegramGroup.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameChannel': nameChannel,
        'name': name,
        'discount': discount,
        'price': price,
        'percentage1': percentage1,
        'percentage2': percentage2,
        'percentage3': percentage3,
        'number_bot': numberBot,
        'plan_desc': planDesc?.map((e) => e.toJson()).toList(),
        'telegram_groups': telegramGroups?.map((e) => e.toJson()).toList(),
      };
}
