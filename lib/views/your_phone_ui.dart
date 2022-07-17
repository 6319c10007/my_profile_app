import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourPhoneUi extends StatefulWidget {
  const YourPhoneUi({Key? key}) : super(key: key);

  @override
  State<YourPhoneUi> createState() => _YourPhoneUiState();
}

class _YourPhoneUiState extends State<YourPhoneUi> {
  TextEditingController phoneCtrl = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'Add/Edit Phone',
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
              'ป้อนเบอร์โทรศัพท์',
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
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเบอร์โทรศัพท์',
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
                if (phoneCtrl.text.trim().length == 0) {
                  //แสดง alert เตือนผู้ใช้ให้ป้อน
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                    title: Text(
                      'คำเตือน',
                    ),
                    content: Text(
                      'ป้อนเบอร์โทรของคุณด้วย',
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