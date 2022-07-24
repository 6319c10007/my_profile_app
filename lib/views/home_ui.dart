

// ignore_for_file: unused_local_variable, unused_field
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //สร้าง Controller ของแต่ละ Textfield เพื่อเอาค่าจาก sharepreference มาแสดง
  TextEditingController yournameCtrl = TextEditingController(text: '');
  TextEditingController yourphoneCtrl = TextEditingController(text: '');
  TextEditingController youremailCtrl = TextEditingController(text: '');
  TextEditingController youraboutCtrl = TextEditingController(text: '');

  //สร้างObject เพื่อใช้ในการเก็บรูป
  File? _image;

  //สร้าง Method เอารูปจาก Camera โดยการเปิดกล้องและถ่าย แล้วบันทึกลง sharepreference
  getImageFromCameraAndSaveToSF() async{
    XFile? pickImage = await ImagePicker().pickImage(source: ImageSource.camera); //เปิดกล้องเพื่อถ่ายรูปเก็บใน PicImage

    //เอารูปจาก picImage กำหนดให้กับตำแหน่งที่จะแสดงผล
    if(pickImage != null){
      setState(() {
        _image = File(pickImage.path);
      });
    }
    //บันทึกข้อมูลรูปเก็บในเครื่อง
    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File LocalImage = await File(pickImage.path).copy('$imagePath/$imageName');

    //บันทึกpathของรูปที่บันทึกไว้ในเครื่อง ลงsharepreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', LocalImage.path);

  }

  
  //สร้าง Method เอารูปจาก Gallery โดยการเปิดกล้องและถ่าย แล้วบันทึกลง sharepreference
  getImageFromGalleryAndSaveToSF() async{
    XFile? pickImage = await ImagePicker().pickImage(source: ImageSource.gallery); //เปิดGalleryเพื่อเลือกรูปเก็บใน PicImage

    //เอารูปจาก picImage กำหนดให้กับตำแหน่งที่จะแสดงผล
    if(pickImage != null){
      setState(() {
        _image = File(pickImage.path);
      });
    }
        //บันทึกข้อมูลรูปเก็บในเครื่อง
    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File LocalImage = await File(pickImage.path).copy('$imagePath/$imageName');

    //บันทึกpathของรูปที่บันทึกไว้ในเครื่อง ลงsharepreference
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', LocalImage.path);
  }



  //Method จะตรวจสอบว่า sharepreference มีค่าหรือไม่ ถ้ามี ให้เอามาแสดงที่ Textfield ถ้าไม่มี ไม่ต้องทำอะไร
  check_and_show_data() async{
    //เริ่มจากสร้าง object
    SharedPreferences prefer = await SharedPreferences.getInstance();
    //อ่านค่า key ต่างๆจาก sharepreference
    bool yournameKey = prefer.containsKey('yourname');
    bool yourphoneKey = prefer.containsKey('yourphone');
    bool youremailKey = prefer.containsKey('youremail');
    bool youraboutKey = prefer.containsKey('yourabout');
    bool yourimageKey = prefer.containsKey('yourimage');

    //ตรวจสอบ key แล้วก็แสดงผลที่ Textfield ผ่านตัว Controller ที่สร้างไว้
    if(yournameKey == true){
      setState(() {
        yournameCtrl.text = prefer.getString('yourname')!;
      });
    }

    if(yourphoneKey == true){
      setState(() {
        yourphoneCtrl.text = prefer.getString('yourphone')!;
      });
    }

    if(youremailKey == true){
      setState(() {
        youremailCtrl.text = prefer.getString('youremail')!;
      });
    }

    if(youraboutKey == true){
      setState(() {
        youraboutCtrl.text = prefer.getString('yourabout')!;
      });
    }
    if(yourimageKey == true){
      setState(() {
        _image = File(prefer.getString('yourimage')!);
      });
    }
  }

  //Method นี้ จะทำงานเป็นลำดับแรกทุกครั้งที่หน้าจอนี้ถูกเปิดขึ้นมา
  @override
  void initState() {
    //จะตรวจสอบว่า sharepreference มีค่าหรือไม่ ถ้ามี ให้เอามาแสดงที่ Textfield ถ้าไม่มี ไม่ต้องทำอะไร
    check_and_show_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'My Profile',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                  ? Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/myprofile2.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  : Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(
                          _image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      getImageFromCameraAndSaveToSF();
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: MediaQuery.of(context).size.width*0.07,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: TextField(
                  controller: yournameCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your name :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your name',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>YourNameUi(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: TextField(
                  controller: yourphoneCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your phone :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your phone',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>YourPhoneUi(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: TextField(
                  controller: youremailCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your email :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your email',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>YourEmailUi(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: TextField(
                  controller: youraboutCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your about :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your about',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>YourAboutUi(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );


  }
}