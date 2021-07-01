import 'package:bloc_analytics/bloc_analytics.dart';

class ExampleTracker implements Tracker {
  void logEvent(AnalyticsEvent event) {
    print('logEvent: $event');
  }

  void logPageView(String name) {
    print('logPageView: $name');
  }

  void setUserProperty(String key, Object any) {
    print('setUserProperty: $key');
  }

  void setUserId(String id) {
    print('setUserId: $id');
  }
}

void main() {
  final tracker = MultipleTracker([ExampleTracker()]);
  tracker.setUserId('97e7d993-745a-455f-aeac-0d04d5f0a035');

  tracker.logEvent(
    AnalyticsEvent(eventName: 'test', parameters: {'propertyName': 'value'}),
  );

  tracker.logPageView('page');

  tracker.setUserProperty('a property', 'value');
}
