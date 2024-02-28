import 'package:flutter/material.dart';
import '../blocs/chatBloc.dart';
import '../utils/httpRester.dart' as rest;
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final MessageManager model = MessageManager();
  var p = rest.connect();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.5/10),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.title),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9)

        ),
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: ChangeNotifierProvider(
                    create: (_) => MessageManager(),
                      child: Consumer<MessageManager>(
                        builder: (context, model, child) => ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                            itemBuilder: (BuildContext context, int index) {
                              var message = model.messageList.elementAt(index);
                              if(message.isSelf){
                                return Container(
                                  width: MediaQuery.of(context).size.width * 2/3,
                                  alignment: Alignment.centerLeft,

                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: ListTile(
                                    leading: Icon(Icons.face),

                                    title: Text('The begining of chaos'),
                                  ),
                                );
                              }
                              return Padding(
                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.5/7),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 2/3,
                                  alignment: Alignment.centerRight,
                                  constraints: BoxConstraints(
                                      maxWidth: 700
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFAAAAFF),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ListTile(
                                    leading: Icon(Icons.face),
                                    title: Text(message.message),
                                  ),
                                ),
                              );
                            },
                            itemCount: model.messageCount
                        ),
                      ),
                    )
                )),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        hintText: 'Message',
                        filled: true,
                        fillColor: Colors.white
                      )
                    )
                  ),

                  SizedBox(
                    width: 10
                  ),

                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FloatingActionButton(
                      onPressed: () async {
                        rest.send();
                      },
                      child: Icon(Icons.send, color: Colors.black),
                      elevation: 0.5,
                    ),
                  )
                ]
              ),
            )
          ]
        ),
      )
    );
  }
}
