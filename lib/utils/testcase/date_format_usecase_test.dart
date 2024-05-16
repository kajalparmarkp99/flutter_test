
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/utils/usecase/date_format_usecase.dart';

void main() {
  test('Format DateTime to dd-MM-yyyy format', () {
    final useCase = DateFormatUseCase();
    final dateTime = DateTime(2024, 5, 15);
    final formattedDate = useCase.formatDateTime(dateTime, 'dd-MM-yyyy');
    expect(formattedDate, '15-05-2024');
  });
}