// import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:pusher/pusher.dart';

Future<void> mmain(Map data) async {
  Pusher pu = new Pusher('1028730', 'e2b086b799d195c9cf48',
      'bff0d130e00935b3d2bd', PusherOptions(cluster: 'ap1'));
  // Map data = {'"$ind"': tf};
  await pu.trigger(['channelTa'], 'tombol', data);
}
