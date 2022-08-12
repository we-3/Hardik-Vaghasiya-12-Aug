import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbkei/api/notification_refresh.dart';
import 'package:rbkei/api/notification_refresh.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  TextEditingController _datecontroller = new TextEditingController();
  DateTime date = new DateTime.now();

  var myFormat = DateFormat('d-MM-yyyy');
  Future<void> _SelectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1940),
      lastDate: DateTime(2200),
      builder: (BuildContext context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: ColorScheme.dark(
              primary: Color.fromARGB(255, 255, 204, 0),
              onPrimary: Colors.white,
              surface: Color.fromARGB(255, 255, 204, 0),
              onPrimaryContainer: Color.fromARGB(255, 255, 204, 0),
              onSurface: Colors.white),
          dialogBackgroundColor: Color.fromARGB(153, 0, 0, 0),
        ),
        child: Center(child: child),
      ),
    );
    if (picked != null) ;
    setState(() {
      date = picked ?? date;
    });
  }

  @override
  Widget build(BuildContext context) {
    var notification_refresh;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Color.fromARGB(255, 255, 204, 0),
        elevation: 1,
        foregroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          height: 50,
          width: 330,
          child: Center(
            child: TextField(
              cursorColor: Color.fromARGB(255, 255, 204, 0),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 255, 204, 0),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => _SelectTimePicker(context),
            child: IgnorePointer(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('${date.day}-${date.month}-${date.year}'),
                      Padding(
                          padding: EdgeInsets.only(
                        right: 15,
                      )),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            size: 30,
                          ),
                          onPressed: () async {
                            _SelectTimePicker(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: IconButton(
            icon: new Icon(
              FontAwesomeIcons.rotate,
              color: Color.fromARGB(255, 255, 204, 0),
              size: 30,
            ),
            onPressed: notification_refresh,
            
          ),
        ),
        alignment: Alignment.bottomRight,
      ),
    );
  }
}

DateFormat(String s) {}
