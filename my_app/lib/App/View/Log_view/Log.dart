import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/App/Assets/pngegg.png'),
                  maxRadius: 40,
                ),
                SizedBox(height: 10),

                // Title Text
                Text(
                  'Get Started',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 0.5),
                Text(
                  'Login/Signup',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  height: 35,
                ),

                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: const Color.fromARGB(255, 83, 82, 82)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Flag Image
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Container(
                          width: 30,
                          height: 20,
                          child: Image.asset(
                            'lib/App/Assets/bdflag.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Country Code
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          '+88',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                      // Phone number input field
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 8),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/otp');
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'By continuing, I hereby confirm that I am 18 years of age or',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Container(
                  width: Get.width * .9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'above and I agree to the',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Terms and Conditions ',
                          style: TextStyle(
                            fontSize: 11,
                            color: const Color.fromARGB(255, 8, 243, 243),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'and',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 11,
                            color: const Color.fromARGB(255, 8, 243, 243),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 170),

                Container(
                    width: Get.width * .1,
                    height: Get.height * .05,
                    child: Image.asset('lib/App/Assets/messenger.png')),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need help?', style: TextStyle(color: Colors.white),),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' Contact Us',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, color: const Color.fromARGB(255, 8, 243, 243)),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('প্রবাসী?', style: TextStyle(color: Colors.white)),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' Click here',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 8, 243, 243),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
