import 'package:chat_rept/blocs/chatBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Rept',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(title: 'Chat View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MessageManager model = MessageManager();
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
          color: Color(0xFFF9F9FF)

        ),
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
                                      color: Colors.greenAccent
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
                                      color: Colors.yellow
                                  ),
                                  child: ListTile(
                                    leading: Icon(Icons.face),
                                    title: Text('The begining of chaos'),
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
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 7/9,
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
                    height: 60,
                    width: 50,
                    child: FloatingActionButton(
                      onPressed: () => {model.addMessage()},
                      child: Icon(Icons.send),
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
