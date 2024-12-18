import 'dart:async';

import 'package:logging/logging.dart';
import 'package:obsidian_clipper/routes/home_screen.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sharing_intent.g.dart';

@riverpod
class SharingIntent extends _$SharingIntent {
  final logger = Logger('Sharing Intent Provider');
  late StreamSubscription _sharingIntentSub;

  @override
  String build() {
    ReceiveSharingIntent.instance.getInitialMedia().then(backgroundShareIntentCallback);

    _sharingIntentSub = ReceiveSharingIntent.instance.getMediaStream().listen(backgroundShareIntentCallback);

    ref.onDispose(() {
      _sharingIntentSub.cancel();
    });

    return "";
  }

  void backgroundShareIntentCallback(List<SharedMediaFile> value) async {
    var sharedObjects = value;

    if (sharedObjects.isEmpty) {
      return;
    }

    var [textObject] = value;

    var url = textObject.path;

    logger.fine(url);

    await ref.read(linkNotifierProvider.notifier).createLink(url);

    logger.fine(sharedObjects.toString());

    ReceiveSharingIntent.instance.reset();

    state = sharedObjects;
  }
}
