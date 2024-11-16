import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  IconData toIcon() {
    switch (this) {
      case 'local_parking':
        return Icons.local_parking;
      case 'ac_unit':
        return Icons.ac_unit;
      case 'local_drink':
        return Icons.local_drink;
      case 'shower':
        return Icons.shower;
      case 'tv':
        return Icons.tv;
      case 'wifi':
        return Icons.wifi;
      case 'battery_saver':
        return Icons.battery_saver;
      case 'kitchen':
        return Icons.kitchen;
      case 'restaurant':
        return Icons.restaurant;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'local_laundry_service':
        return Icons.local_laundry_service;
      case 'videocam':
        return Icons.videocam;
      case 'elevator':
        return Icons.elevator;
      case 'credit_card':
        return Icons.credit_card;
      case 'pool':
        return Icons.pool;
      case 'bathtub':
        return Icons.bathtub;
      case 'food_bank':
        return Icons.food_bank;
      case 'accessible':
        return Icons.accessible;
      case 'cake':
        return Icons.cake;
      case 'nightlife':
        return Icons.nightlife;
      default:
        return Icons.check_circle;
    }
  }
}
