import 'package:flutter/foundation.dart';

class RolledDice {
  int value;


RolledDice ({
  required this.value,
});


//No es necesario aun, pero lo pongo
factory RolledDice.fromJson(Map<String, dynamic> json) {
  return RolledDice(
    value: json['value'],
  );
}

Map<String, dynamic> toJson() {
  return{
    'value': value,
  };
}

  @override
  String toString() {
    return 'RolledDice{value: $value}';
  }
}
