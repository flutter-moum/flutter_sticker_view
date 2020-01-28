import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sticker/sticker.dart';

void main() {
  const MethodChannel channel = MethodChannel('sticker');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
//
//  test('getPlatformVersion', () async {
//    expect(await Sticker.platformVersion, '42');
//  });
}
