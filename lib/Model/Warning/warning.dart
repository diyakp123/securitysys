
class Warning {

  final String w_id;
  final String device_id;
  final String mq4_value;
  final String smoke_value;
  final String flame_value;
  final String temp_value;
  final String count;
  final String reading_time;

	Warning.fromJsonMap(Map<String, dynamic> map): 
		w_id = map["w_id"],
		device_id = map["device_id"],
		mq4_value = map["mq4_value"],
		smoke_value = map["smoke_value"],
		flame_value = map["flame_value"],
		temp_value = map["temp_value"],
		count = map["count"],
		reading_time = map["reading_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['w_id'] = w_id;
		data['device_id'] = device_id;
		data['mq4_value'] = mq4_value;
		data['smoke_value'] = smoke_value;
		data['flame_value'] = flame_value;
		data['temp_value'] = temp_value;
		data['count'] = count;
		data['reading_time'] = reading_time;
		return data;
	}
}
