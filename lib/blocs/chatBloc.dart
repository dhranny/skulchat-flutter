import 'package:flutter/material.dart';
import '../models/messageModel.dart';

class MessageManager extends ChangeNotifier{
  static final messMngr = MessageManager._internal();
  MessageManager._internal();

  factory MessageManager(){
    return messMngr;
  }
  var messageList = <MessModel>[];

  int get messageCount => messageList.length;

  void addMessage(String message){
    messageList.add(new MessModel(message, false));
  }
}