import 'dart:async';

import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_bloc_analytics/firebase_bloc_analytics.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  late Tracker subject;
  late FirebaseAnalytics analytics;

  setUp(() {
    analytics = MockFirebaseAnalytics();
    subject = FirebaseTracker(analytics);

    when(
      () => analytics.logEvent(
        name: any(named: 'name'),
        parameters: any(named: 'parameters'),
      ),
    ).thenAnswer(
      (_) => Future.value(),
    );

    when(
      () => analytics.setCurrentScreen(
        screenName: any(named: 'screenName'),
      ),
    ).thenAnswer(
      (_) => Future.value(),
    );

    when(
      () => analytics.setUserProperty(
        name: any(named: 'name'),
        value: any(named: 'value'),
      ),
    ).thenAnswer(
      (_) => Future.value(),
    );

    when(
      () => analytics.setUserId(any()),
    ).thenAnswer(
      (_) => Future.value(),
    );
  });

  test('logEvent', () {
    const event = AnalyticsEvent(
      eventName: 'test event',
      parameters: {'test parameter': 'value'},
    );

    subject.logEvent(event);

    verify(
      () => analytics.logEvent(
        name: 'test_event',
        parameters: {'test_parameter': 'value'},
      ),
    );
  });

  test('logPageView', () {
    const pageName = 'test';

    subject.logPageView(pageName);

    verify(() => analytics.setCurrentScreen(screenName: pageName));
  });

  test('setUserProperty', () {
    const property = 'key';
    const value = 'value';

    subject.setUserProperty(property, value);

    verify(() => analytics.setUserProperty(name: property, value: value));
  });

  test('setUserId', () {
    const id = '97e7d993-745a-455f-aeac-0d04d5f0a035';

    subject.setUserId(id);

    verify(() => analytics.setUserId(id));
  });
}
