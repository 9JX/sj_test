import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sj_test/sj_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('sj_test');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SjTest.platformVersion, '42');
  });
}
