
class Smoke {

  final String smoke_id;
  final String device_id;
  final String smoke_value;
  final String reading_time;

	Smoke.fromJsonMap(Map<String, dynamic> map): 
		smoke_id = map["smoke_id"],
		device_id = map["device_id"],
		smoke_value = map["smoke_value"],
		reading_time = map["reading_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['smoke_id'] = smoke_id;
		data['device_id'] = device_id;
		data['smoke_value'] = smoke_value;
		data['reading_time'] = reading_time;
		return data;
	}
}
