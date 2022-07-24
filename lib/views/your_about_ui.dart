import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourAboutUi extends StatefulWidget {
  const YourAboutUi({Key? key}) : super(key: key);

  @override
  State<YourAboutUi> createState() => _YourAboutUiState();
}

class _YourAboutUiState extends State<YourAboutUi> {
  TextEditingController aboutCtrl = TextEditingController(text: '');
    //สร้าง Method ที่ใช้บันทึกข้อมูลที่ป้อนลง SharedPreference
  //Return เป็น Future เพื่อที่เมื่อบันทึกเสร็จเราจะให้ทำงานต่อโดยการย้อนกลับไปหน้าแรก
  Future addYourAboutToSF() async{
    //เริ่มจากสร้าง Object ของ SharedPreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    //บันทึกข้อมูลผู้ใช้ลง SharePreference
    prefer.setString('yourabout', aboutCtrl.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Add/Edit About',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'ป้อนเกี่ยวกับคุณ',
              style: GoogleFonts.itim(
                fontSize: 35,
                color: Colors.green[800],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                controller: aboutCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเกี่ยวกับคุณ',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: (){
                if (aboutCtrl.text.trim().length == 0) {
                  //แสดง alert เตือนผู้ใช้ให้ป้อน
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                    title: Text(
                      'คำเตือน',
                    ),
                    content: Text(
                      'ป้อนเกี่ยวกับคุณด้วย',
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'ตกลง',
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[800],
                        ),
                      ),
                    ],
                  );
                    },
                  );

                } else {
                  //บันทึกลง SharePreference แล้วกลับไปหน้า HomeUi
                  addYourAboutToSF().then((value) {
                    Navigator.pop(context);
                  });
                }
              },
              child: Text(
                'บันทึก',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width*0.7,
                  50,
                ),
                primary: Colors.green[800],
              ),
            ),
          ],
        ),
      ),
  
    );
  }
}