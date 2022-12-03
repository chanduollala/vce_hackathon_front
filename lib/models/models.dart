class Doctor{
  int? id;
  String? name;
  Hospital? hospital;
  int? fee;
  int? experience;
  Specialization? specialization;

  Doctor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        hospital =  Hospital.fromJson(json['hospital']),
        fee = json['fee'],
        experience = json['experience'],
        specialization = Specialization.fromJson(json['specialization']);



  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'fee': fee,
    'experience': experience,
    'hospital': hospital?.toJson(),
    'specialization': specialization?.toJson()
  };
}

class Specialization{
  int? id;
  String? title;

  Specialization.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'];



  Map<String, dynamic> toJson() => {
    'name': title,
    'id': id,

  };
}

class Hospital{
  int? id;
  String? name;
  String? latitude;
  String? longitude;

  Hospital.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        latitude = json['latitude'],
        longitude= json['longitude'];



  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'latitude': latitude,
    'longitude': longitude,
  };
}

