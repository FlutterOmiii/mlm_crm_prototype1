import 'package:get/get.dart';

class TrainingController extends GetxController {
  final trainingModules = [
    {
      'title': 'getting_started',
      'description': 'Learn the basics of the platform',
      'icon': 'rocket',
      'duration': '15 min',
      'completed': true,
    },
    {
      'title': 'product_knowledge',
      'description': 'Understand our products in detail',
      'icon': 'lightbulb',
      'duration': '30 min',
      'completed': false,
    },
    {
      'title': 'sales_techniques',
      'description': 'Master effective sales strategies',
      'icon': 'trending_up',
      'duration': '45 min',
      'completed': false,
    },
    {
      'title': 'team_building',
      'description': 'Build and manage your team',
      'icon': 'group',
      'duration': '25 min',
      'completed': false,
    },
  ].obs;
}
