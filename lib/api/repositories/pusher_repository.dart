import 'dart:developer';

import 'package:get/get.dart';
import 'package:link_me_up_secondary/services/local_storage.dart';
import 'package:link_me_up_secondary/ui/responsive_state/base_view_model.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/profile/user_profile_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/entry/entry_screen.dart';
import 'package:pusher_client/pusher_client.dart';

import '../models/pusher_get_entry_model.dart';

class PusherRepository extends BaseNotifier {
  PusherClient? pusher;
  Channel? channel;
  String? userId;

  PusherGetEntryModel pusherGetEntryModel = PusherGetEntryModel();

  initPusher() async {
    userId = await localStorage.getString("userId");

    pusher = PusherClient(
      'a5c3997acee88f7d8488',
      PusherOptions(
        host: "https://thoughtful-lamb-bracelet.cyclic.app",
        encrypted: false,
        cluster: 'us2',
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
      pusherGetEntryModel = pusherGetEntryModelFromJson(event!.data!);
      Get.to(EntryScreen());
      notifyListeners();
    });
  }

  disconnectPusher() {
    pusher!.disconnect();
  }
}
