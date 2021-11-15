import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';





Future<String> getJson() {
  return rootBundle.loadString('scenic_spot_C_f.json');
}


class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}


class _NotifyState extends State {
 // @override
  //return Scaffold(
  //body: Container(
  //alignment: Alignment.center,
  //child: Text('通知', style: TextStyle(
  //color: Colors.pinkAccent,
  //fontWeight: FontWeight.w700,
  //fontSize: 100,
  //),),
  //)
  //);
  @override
  Widget build(BuildContext context) {


    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),

              background: new Image.network(
                "https://th.bing.com/th/id/R.7ce0f1948a41bcad9c5ca4c2e1630bec?rik=LlKxVm9kFpNxhQ&pid=ImgRaw",fit: BoxFit.fill,
              ),

            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget

                  return new   Container(

                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                        begin: Alignment.topCenter,

                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black12,
                          Colors.black45,

                        ],
                      ),
                    ),
                    child: new ListTile(
                      leading: new InkWell(
                        onTap: () {
                          print('Card tapped.');
                        },

                        child: const SizedBox(

                          child: Text('nothing here'),
                        ),
                      ),
// title: new Text("129"),
                      subtitle: new Image.network(

                        "https://th.bing.com/th/id/R.a0e5533878e10891cefe3d5702066d24?rik=oAJ0rqrS35fnnQ&riu=http%3a%2f%2fden.gr.jp%2fden%2f_src%2f6825%2f73.jpg%3fv%3d1576059211340&ehk=3%2b6or0RSxkU%2fheAfigx2F6vsENrVcfjSf87wODGNajw%3d&risl=&pid=ImgRaw",
                        fit: BoxFit.fill,

                      ),onTap: () {
                      print('Card tapped.');
                    },
                      trailing: new IconButton(
                        onPressed: ()=>{},
                        iconSize: 36,
                        icon: new Icon(Icons.add),
                      ),
                    ),




                  );

                },

                childCount: 20,
              ),

            ),

          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 200.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项

                      return new Container(
                        height: 50,
                        margin:EdgeInsets.only(top: 20),
                        child: new ListTile(
                          leading: new InkWell(
                            onTap: () {
                              print('Card tapped.');
                            },

                            child: const SizedBox(

                              child: Text('nothing here'),
                            ),
                          ),
// title: new Text("129"),
                          trailing: new IconButton(
                            onPressed: ()=>{},
                            iconSize: 36,
                            icon: new Icon(Icons.add),
                          ),
                          subtitle: new Image.network(

                            "https://th.bing.com/th/id/R.a0e5533878e10891cefe3d5702066d24?rik=oAJ0rqrS35fnnQ&riu=http%3a%2f%2fden.gr.jp%2fden%2f_src%2f6825%2f73.jpg%3fv%3d1576059211340&ehk=3%2b6or0RSxkU%2fheAfigx2F6vsENrVcfjSf87wODGNajw%3d&risl=&pid=ImgRaw",
                            fit: BoxFit.fill,

                          ),onTap: () {
                          print('Card tapped.');
                        },

                        ),
                      );
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 5 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {


  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('Icon/scenic_spot_C_f.json');
  }


  Future loadStudent() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    Student student = new Student.fromJson(jsonResponse);
    print(student.studentId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>Notify(  ) ),
            );
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


class Student{
  String? studentId;
  String? studentName;
  int? studentScores;
  Student({
    this.studentId,
    this.studentName,
    this.studentScores });

  factory Student.fromJson(Map<String, dynamic> parsedJson){ return Student(
      studentId: parsedJson['id'],
      studentName : parsedJson['name'],
      studentScores : parsedJson ['score']
  );
  }
}




//記錄檔名稱:         Application
//來源:            MSSQLSERVER
//日期:            2021/8/27 下午 01:27:31
//事件識別碼:         17300
//工作類別:          伺服器


//層級:            錯誤
//關鍵字:           傳統
//使用者:           不適用
//電腦:            DESKTOP-SJ9985O
//描述:
//由於記憶體不足或設定的工作階段數目超過伺服器的容許最大值，使 SQL Server 無法執行新的系統工作。請確認伺服器是否有足夠的記憶體。請使用 sp_configure 搭配 'user connections' 選項，檢查允許的最大使用者連接數目。請使用 sys.dm_exec_sessions，檢查目前的工作階段數目，包括使用者處理序。
//事件 Xml:
//<Event xmlns="http://schemas.microsoft.com/win/2004/08/events/event">
//<System>
//<Provider Name="MSSQLSERVER" />
//<EventID Qualifiers="49152">17300</EventID>
//<Version>0</Version>
//<Level>2</Level>
//<Task>2</Task>
//<Opcode>0</Opcode>
//<Keywords>0x80000000000000</Keywords>
//<TimeCreated SystemTime="2021-08-27T05:27:31.9637932Z" />
//<EventRecordID>1087315</EventRecordID>
//<Correlation />
//<Execution ProcessID="0" ThreadID="0" />
//<Channel>Application</Channel>
//<Computer>DESKTOP-SJ9985O</Computer>
//<Security />
//</System>
//<EventData>
//<Binary>9443000010000000100000004400450053004B0054004F0050002D0053004A0039003900380035004F00000000000000</Binary>
//</EventData>
//</Event>