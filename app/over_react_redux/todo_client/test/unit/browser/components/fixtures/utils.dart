import 'dart:js';

import 'package:over_react/over_react.dart';
import 'package:test/test.dart';
import 'package:time/time.dart';
import 'package:todo_client/src/components/shared/redraw_counter_component_mixin.dart';

export '../../fixtures/utils.dart';

bool muiJsIsAvailable() {
  // Skip these tests if the JS file isn't loaded (e.g. if you're running tests without an internet connection, etc)
  if (context['MaterialUI'] == null) {
    test('MaterialUI', () {},
        skip: 'Skipping MaterialUI tests because the required JS file from unpkg.com did not load');
    return false;
  }
  return true;
}

void initializeComponentTests() {
  enableTestMode();
  if (!muiJsIsAvailable()) return;
}

Future<Null> expectNoRedraws(RedrawCounterMixin component) async {
  final redrawCount = await component.didRedraw().future.timeout(20.milliseconds, onTimeout: () => 0);
  expect(redrawCount, 0);
}
