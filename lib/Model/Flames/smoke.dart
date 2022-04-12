
class Smoke {

  final String flame_id;
  final String device_id;
  final String flame_value;
  final String reading_time;

	Smoke.fromJsonMap(Map<String, dynamic> map): 
		flame_id = map["flame_id"],
		device_id = map["device_id"],
		flame_value = map["flame_value"],
		reading_time = map["reading_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['flame_id'] = flame_id;
		data['device_id'] = device_id;
		data['flame_value'] = flame_value;
		data['reading_time'] = reading_time;
		return data;
	}
}
