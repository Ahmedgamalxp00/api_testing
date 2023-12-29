class PlanDesc {
  String? desc;

  PlanDesc({this.desc});

  factory PlanDesc.fromJson(Map<String, dynamic> json) => PlanDesc(
        desc: json['desc'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'desc': desc,
      };
}
