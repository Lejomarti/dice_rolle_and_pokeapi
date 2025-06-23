import 'package:flutter/foundation.dart'; // Para @required, aunque no estrictamente necesario con null safety

/// Represents a single dice roll event.
class DiceRoll {
  final int value; // The value of the dice roll (1-6)
  final DateTime timestamp; // The time when the roll occurred

  /// Constructor for DiceRoll.
  DiceRoll({
    required this.value,
    required this.timestamp,
  });

  /// Factory constructor to create a DiceRoll from a JSON map.
  /// Useful for serialization/deserialization with SharedPreferences.
  factory DiceRoll.fromJson(Map<String, dynamic> json) {
    return DiceRoll(
      value: json['value'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String), // Parse string back to DateTime
    );
  }

  /// Converts this DiceRoll instance to a JSON map.
  /// Useful for serialization/deserialization with SharedPreferences.
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'timestamp': timestamp.toIso8601String(), // Convert DateTime to string for storage
    };
  }

  @override
  String toString() {
    return 'DiceRoll(value: $value, timestamp: $timestamp)';
  }
}