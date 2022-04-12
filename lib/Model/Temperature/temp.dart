
class Temp {

  final String temp_id;
  final String device_id;
  final String temp_value;
  final String reading_time;

	Temp.fromJsonMap(Map<String, dynamic> map): 
		temp_id = map["temp_id"],
		device_id = map["device_id"],
		temp_value = map["temp_value"],
		reading_time = map["reading_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['temp_id'] = temp_id;
		data['device_id'] = device_id;
		data['temp_value'] = temp_value;
		data['reading_time'] = reading_time;
		return data;
	}
}
