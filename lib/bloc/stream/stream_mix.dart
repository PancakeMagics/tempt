
import 'dart:async';

import 'package:tempt/bloc/stream/sub/extension.dart';

import '../../data/store/model/model.dart';
import '../../data/store/service/service.dart';

extension MixStreams<M> on Iterable<Stream<M>> {
  Stream<Iterable<M>> mix({
    FieldsSet? mixMatch,
    bool Function(M? model)? mixValid,
    bool mixAll = true,
  }) {
    late final StreamController<Iterable<M>> controller;
    final subscriptions = <StreamSubscription<M>>[];

    void mixSubscriptionAndListen() {
      final list = <M>[];
      int priority = 0;

      for (var stream in this) {
        final subscription = stream.listen(null)..onError((e) => throw e);

        bool streamYetSubscribed = true;
        int streamPriority = -1;

        void subscribe(M event) {
          streamYetSubscribed = false;
          streamPriority = priority++;
          subscriptions
              .add(subscription); // enable pause, resume, cancel stream
          list.add(event); // enable listening
        }

        void unsubscribe() {}

        /// listen
        if (mixAll) {
          // listen all streams
          subscription.onData((event) {
            if (streamYetSubscribed) {
              subscribe(event);
            } else {
              list.replaceRange(streamPriority, streamPriority + 1, [event]);
            }
            controller.add(list);
          });
        } else {
          // listen valid streams

          bool eventIsValid(M event) {
            if (M is DataModel) {
              event as DataModel;
              if (mixMatch != null) {
                return event.match(mixMatch);
              } else if (mixValid != null) {
                return mixValid(event);
              } else {
                throw QueryNoWhereError();
              }

            } else {
              throw UnimplementedError();
            }
          }

          subscription.onData((event) {
            if (eventIsValid(event)) {
              if (streamYetSubscribed) {
                subscribe(event);
              } else {
                list.replaceRange(streamPriority, streamPriority + 1, [event]);
              }
              controller.add(list);
            } else {
              if (!streamYetSubscribed) {
                unsubscribe();
              }
            }
          });
        }
      }
    }

    controller = StreamController(
      onListen: mixSubscriptionAndListen,
      onPause: subscriptions.pauseAll,
      onResume: subscriptions.resumeAll,
      onCancel: subscriptions.cancelAll,
    );
    return controller.stream;
  }
}


