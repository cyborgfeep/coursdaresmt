import 'package:coursdaresmt/utils/constants.dart';
import 'package:flutter/material.dart';

import 'navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtController=TextEditingController();
  bool isEnable=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.keyboard_backspace),
                ),
              ),
              Image.asset(
                "${imgUri}sim.jpeg",
                width: 120,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: const Text(
                  "Numéro de téléphone",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: const Text(
                  "Veuillez saisir votre numéro de téléphone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextField(
                  controller: txtController,
                  cursorColor: defaultColor,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      if(value.length==9&&(value.startsWith("77")||value.startsWith("78"))){
                        isEnable=true;
                      }else{
                        isEnable=false;
                      }
                    });
                  },
                  style: const TextStyle(
                    color: defaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  decoration: InputDecoration(
                      labelText: "Numéro de téléphone",

                      labelStyle: const TextStyle(
                          color: defaultColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: defaultColor, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.black12, width: 1)),
                      suffix: InkWell(
                        onTap: () {
                          txtController.clear();
                        },
                        child: const Text(
                          "Rafraîchir",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                child: ElevatedButton(
                    onPressed: () {
                      if(isEnable){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                          return const NavigationScreen();
                        },),(route) =>  false,);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: isEnable?defaultColor:Colors.grey,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: const Text("Suivant")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
