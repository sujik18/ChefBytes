import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chef_bytes/data/dummy_data.dart';

final mealsProvider = Provider((ref) => dummyMeals); //static one for a list of meals that doesnt change
