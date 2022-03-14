import 'package:chwialka_schedule/service/ice_rink_event_service.dart';
import 'package:test/test.dart';

void main() {
  test('Parsing ice rink schedule', () async {
    final service = IceRinkScheduleService();
    final result = await service.fetchSchedules();
  });
}
