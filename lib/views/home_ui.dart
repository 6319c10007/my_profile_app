import 'package:flutter/material.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
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
                  Container(
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
                  ),
                  IconButton(
                    onPressed: (){},
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
                        );
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
                        );
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
                        );
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
                        );
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