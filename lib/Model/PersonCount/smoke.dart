
class Smoke {

  final String count_id;
  final String area_id;
  final String count;
  final String added_time;

	Smoke.fromJsonMap(Map<String, dynamic> map): 
		count_id = map["count_id"],
		area_id = map["area_id"],
		count = map["count"],
		added_time = map["added_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count_id'] = count_id;
		data['area_id'] = area_id;
		data['count'] = count;
		data['added_time'] = added_time;
		return data;
	}
}
