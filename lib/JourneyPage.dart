import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JourneyPage extends StatefulWidget {
  @override
  _JourneyPageState createState() => _JourneyPageState();
}


class _JourneyPageState extends State {
  TextEditingController textController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime _date = DateTime.now();

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(right: 105, top: 15),
            child: Text('Tell Goosy about your journey', style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18
          ),),
         ),
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 1, top: 20),
            child:TextField(
              controller: textController,
                 keyboardType: TextInputType.text,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(20),
                   prefixIcon: Icon(Icons.location_on_outlined),
                   hintText: 'Destination: City, Country',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10), ),
                   )
               ),
               autofocus: false,
          ),
         ),
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 1, top: 20),
            child:TextField(
              controller: dateController,
              keyboardType: TextInputType.datetime,

              decoration: InputDecoration(

                contentPadding: EdgeInsets.all(20),
                prefixIcon: IconButton(onPressed: _selectDate, icon: Icon(Icons.date_range_outlined)),

                  hintText: ' ${DateFormat("dd, MMM").format(_date)}',
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.all(Radius.circular(10), ),
                )

            ),
            autofocus: false,
          )
         ),
         // ElevatedButton(
          //  onPressed: _selectDate,
         //   child: Text('SELECT DATE'),
         // ),
         // SizedBox(height: 8),
         // Text(
         //   'Selected date: $_date',
         // ),
          Padding(padding: EdgeInsets.only(right: 185, top: 20),
            child:Text('weather of the month', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500
            ),),),
          Padding(padding: EdgeInsets.only(top: 20),
              child:Center(
                child:Text('Maybe', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700,
          ),),)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('地區:'+textController.text +'日期:${DateFormat("dd, MMM").format(_date)}'),

              );
            },
          );

        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),

    );
  }
}
