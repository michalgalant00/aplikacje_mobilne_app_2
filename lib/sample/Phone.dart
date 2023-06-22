class Phone {
  final int id;
  String manufacturer;
  String model;
  String osVersion;
  String avatarFileName;

  Phone ({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.osVersion,
    required this.avatarFileName
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'manufacturer': manufacturer,
      'model': model,
      'osVersion': osVersion,
      'avatarFileName': avatarFileName,
    };
  }

  Map<String, dynamic> toMapNoId() {
    return {
      'manufacturer': manufacturer,
      'model': model,
      'osVersion': osVersion,
      'avatarFileName': avatarFileName,
    };
  }

  Phone toObject(Map<String, dynamic> map) {
    return Phone(
        id: map['id'],
        manufacturer: map['manufacturer'],
        model: map['mdoel'],
        osVersion: map['osVersion'],
        avatarFileName: map['avatarFileName']
    );
  }

  @override
  String toString() {
    return 'Phone {id: $id,'
        'manufacturer: $manufacturer,'
        'model: $model';
  }
}