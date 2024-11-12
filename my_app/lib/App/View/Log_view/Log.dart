import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Log extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/App/Assets/logo.jpg'),
                  maxRadius: 40,
                ),
                SizedBox(height: 10),

                // Title Text
                Text(
                  'Get Started',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 0.5),
                Text(
                  'Login/Signup',
                  style: TextStyle(fontSize: 25),
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
                            'lib/App/Assets/bangladesh.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Country Code
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          '+88',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      // Phone number input field
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
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
                  padding: EdgeInsets.all(8.0),
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
                              color: const Color.fromARGB(255, 61, 61, 61),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'By continuing, I hereby confirm that I am 18 years of age or',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'above and I agree to the',
                        style: TextStyle(fontSize: 10),
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
                        style: TextStyle(fontSize: 10),
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
                    width: 30,
                    height: 30,
                    child: Image.asset('lib/App/Assets/messenger.png')),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need help?'),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' Contact Us',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('agsd?'),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' click',
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