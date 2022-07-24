

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourNameUi extends StatefulWidget {
  const YourNameUi({Key? key}) : super(key: key);

  @override
  State<YourNameUi> createState() => _YourNameUiState();
}

class _YourNameUiState extends State<YourNameUi> {
  //สร้าง object Controller ของ Textfield
  TextEditingController nameCtrl = TextEditingController(text: '');

  //สร้าง Method ที่ใช้บันทึกข้อมูลที่ป้อนลง SharedPreference
  //Return เป็น Future เพื่อที่เมื่อบันทึกเสร็จเราจะให้ทำงานต่อโดยการย้อนกลับไปหน้าแรก
  Future addYourNameToSF() async{
    //เริ่มจากสร้าง Object ของ SharedPreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    //บันทึกข้อมูลผู้ใช้ลง SharePreference
    prefer.setString('yourname', nameCtrl.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Add/Edit Name',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
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
              'ป้อนชื่อของคุณ',
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
                controller: nameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนชื่อ',
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
              onPressed: () {
                //เขียนโค้ดตรวจสอบว่าได้ป้อนหรือยัง
                if (nameCtrl.text.trim().length == 0) {
                  //แสดง alert เตือนผู้ใช้ให้ป้อน
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                    title: Text(
                      'คำเตือน',
                    ),
                    content: Text(
                      'ป้อนชื่อของคุณด้วย',
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
                  addYourNameToSF().then((value) {
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
                  MediaQuery.of(context).size.width * 0.7,
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
