import 'package:chat_rept/blocs/chatBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import '../models/userModel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

String? token;
Iterable<Course>? courses;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}



Future<bool> register(User user) async {
  final response = await http
      .post(Uri.parse('https://82bd-102-89-47-26.ngrok-free.app/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson())
      );

  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed to login');
  }
}

Future<bool> login(User user) async {
  final response = await http
      .post(Uri.parse('https://82bd-102-89-47-26.ngrok-free.app/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson())
  );

  if (response.statusCode == 200) {
    token = response.body;
    print("fsf" + token!);
    return true;
  } else {
    throw Exception('Failed to login');
  }
}

Future<bool> getCourses() async {
  final response = await http
      .get(Uri.parse('https://82bd-102-89-47-26.ngrok-free.app/course'),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer " + token!},
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    courses = body.map((value) => Course.fromJson(value));
    return true;
  } else {
    throw Exception('Failed to login');
  }
}

WebSocketChannel? channel;

void connect(){
  channel = IOWebSocketChannel.connect(
      'https://82bd-102-89-47-26.ngrok-free.app/course',
       headers: {"Content-Type": "application/json", "Authorization": "Bearer " + token!}
  );
  channel!.stream.listen((event) {
    MessageManager.messMngr.addMessage(event);
  });
}

void send(){
  channel!.sink.add('The shit fan');
  debugPrint('fanner');
}