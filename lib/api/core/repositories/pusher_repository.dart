import 'dart:developer';

import 'package:link_me_up_secondary/services/local_storage.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/base_view_model.dart';
import 'package:pusher_client/pusher_client.dart';

class PusherRepository extends BaseNotifier {
  PusherClient? pusher;
  Channel? channel;
  String? userId;

  initPusher() {
    getUserId();
    pusher = PusherClient(
      'a5c3997acee88f7d8488',
      PusherOptions(
        host: "https://thoughtful-lamb-bracelet.cyclic.app",
        encrypted: false,
        cluster: 'eu',
      ),
      enableLogging: true,
    );
    pusher!.connect();
    channel = pusher?.subscribe(userId!);
    log("joined with................... $userId ");

    pusher?.onConnectionStateChange((state) {
      log("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
      // pusher!.connect();
    });

    pusher?.onConnectionError((error) {
      log("error: ${error?.message}");
    });

    channel?.bind('authorize-user', (event) async {
      log("authorize-user ............... ${event?.data}");
    });
  }

  getUserId() async {
    userId = await localStorage.getString("userId");
  }

  disconnectPusher() {
    pusher!.disconnect();
  }
}
