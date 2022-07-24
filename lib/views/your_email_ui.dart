import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourEmailUi extends StatefulWidget {
  const YourEmailUi({Key? key}) : super(key: key);

  @override
  State<YourEmailUi> createState() => _YourEmailUiState();
}

class _YourEmailUiState extends State<YourEmailUi> {
  TextEditingController emailCtrl = TextEditingController(text: '');

  //สร้าง Method ที่ใช้บันทึกข้อมูลที่ป้อนลง SharedPreference
  //Return เป็น Future เพื่อที่เมื่อบันทึกเสร็จเราจะให้ทำงานต่อโดยการย้อนกลับไปหน้าแรก
  Future addYourEmailToSF() async{
    //เริ่มจากสร้าง Object ของ SharedPreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    //บันทึกข้อมูลผู้ใช้ลง SharePreference
    prefer.setString('youremail', emailCtrl.text);
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Add/Edit Email',
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
              'ป้อนอีเมล',
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
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนอีเมล',
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
                if (emailCtrl.text.trim().length == 0) {
                  //แสดง alert เตือนผู้ใช้ให้ป้อน
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                    title: Text(
                      'คำเตือน',
                    ),
                    content: Text(
                      'ป้อนอีเมลของคุณด้วย',
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
                  addYourEmailToSF().then((value) {
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