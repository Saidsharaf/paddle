import 'package:defi/models/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

class ZegoCall extends StatelessWidget {
  const ZegoCall({super.key});

  @override
  Widget build(BuildContext context) {
    String localUserId = math.Random().nextInt(10000).toString();
    return Scaffold(
      body: SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appID: Util.appId, // your AppID,
          appSign: Util.appSignIn,
          userID: localUserId,
          userName: 'so3da $localUserId',
          callID: '129',
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
        ),
      ),
    );
  }
}
