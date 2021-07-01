import 'analytics_event.dart';
import 'tracker.dart';

/// A tracker that allow you to use different services at once
class MultipleTracker implements Tracker {
  const MultipleTracker(this.trackers);

  final Iterable<Tracker> trackers;

  @override
  void logPageView(String name) {
    try {
      for (final tracker in trackers) {
        tracker.logPageView(name);
      }
    } on Exception {
      //
    }
  }

  @override
  void logEvent(AnalyticsEvent event) {
    try {
      for (final tracker in trackers) {
        tracker.logEvent(event);
      }
    } on Exception {
      //
    }
  }

  @override
  void setUserProperty(String key, Object any) {
    try {
      for (final tracker in trackers) {
        tracker.setUserProperty(key, any);
      }
    } on Exception {
      //
    }
  }

  @override
  void setUserId(String id) {
    try {
      for (final tracker in trackers) {
        tracker.setUserId(id);
      }
    } on Exception {
      //
    }
  }
}
