import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssessmentYearNotifier extends Notifier<int> {
  @override
  int build() {
    return DateTime.now().year;
  }

  void setYear(int year) {
    state = year;
  }

  List<int> get availableYears {
    return List.generate(
      21,
          (index) => 2010 + index,
    );
  }
}

final assessmentYearProvider =
NotifierProvider<AssessmentYearNotifier, int>(
  AssessmentYearNotifier.new,
);