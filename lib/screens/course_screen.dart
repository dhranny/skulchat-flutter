import 'package:chat_rept/screens/chat_page.dart';
import 'package:flutter/material.dart';
import '../blocs/chatBloc.dart';
import '../utils/httpRester.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key, required this.title});

  final String title;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  int _selectedIndex = 0;
  ScrollController _controller = ScrollController();

  Widget getWid(BuildContext context, int index){
    if(index == 0)
      return coursesBody(context);
    return addCoursesBody(context);
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget coursesBody(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF9F9F9)

      ),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    var course = courses!.elementAt(index);
                    return Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1/10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 2/3,
                        alignment: Alignment.centerRight,
                        constraints: BoxConstraints(
                            maxWidth: 700
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3
                              ),
                              spreadRadius: 1.2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                            leading: Icon(Icons.ac_unit_rounded),
                            title: Text(course.courseCode),
                            titleTextStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 20),
                            subtitleTextStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 16),
                            subtitle: Text(course.name),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(title: "Magic")));
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: courses!.length
              ),
            )
          ]
      ),
    );
  }


  Widget addCoursesBody(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF9F9F9)

      ),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    var course = courses!.elementAt(index);
                    return Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1/10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 2/3,
                        alignment: Alignment.centerRight,
                        constraints: BoxConstraints(
                            maxWidth: 700
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3
                              ),
                              spreadRadius: 1.2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                            leading: Icon(Icons.ac_unit_rounded),
                            title: Text(course.courseCode),
                            titleTextStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 20),
                            subtitleTextStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 16),
                            subtitle: Text(course.name),
                          trailing: Icon(Icons.add),
                        ),
                      ),
                    );
                  },
                  itemCount: courses!.length
              ),
            )
          ]
      ),
    );
  }
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit_rounded),
              label: 'Courses'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add),
              label: 'Add Courses'
            )
          ],
        ),
        body: getWid(context, _selectedIndex)
    );
  }
}
