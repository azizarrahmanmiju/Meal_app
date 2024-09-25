
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/Dummydata.dart';

final meals_provider = Provider((ref) {
  return dummyMeals;
}

);

