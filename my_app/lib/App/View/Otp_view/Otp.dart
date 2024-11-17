import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
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
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 0.5),
                  Text(
                    'Enter your OTP Code',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(
                    height: 35,
                  ),

                  Container(
                    width: 300,
                    child: PinCodeTextField(
                      autoFocus: true,
                      appContext: context,
                      length: 6,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        fieldHeight: 50,
                        fieldWidth: 47,
                        // Inactive color is grey
                        inactiveColor: const Color.fromARGB(255, 70, 70, 70),
                        selectedColor: const Color.fromARGB(255, 85, 85,
                            85), // Make it transparent when selected
                        disabledColor: Colors.red,
                        activeColor: Colors.white,
                        inactiveFillColor: const Color.fromARGB(
                            255, 58, 58, 58), // Lighter grey fill for inactive
                        selectedFillColor:
                            Colors.white, // White fill when selected
                        activeFillColor: Colors.white, // White fill when active
                      ),
                      onCompleted: (v) {
                        print("Entered OTP: $v");
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      textStyle:
                          TextStyle(color: Colors.white), // White text color
                      keyboardType:
                          TextInputType.number, // Numeric keyboard for OTP
                      // Remove this line to avoid blocking keyboard interaction
                      // enableInteractiveSelection: false,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade700), // Dark grey hint color
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      onTap: () async {
                        await controller.verifyOtp();
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
                                fontWeight: FontWeight.bold),
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
                  // SizedBox(height: 170),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //       width: 30,
                  //       height: 30,
                  //       child: Image.asset('lib/App/Assets/messenger.png')),
                  // ),
                  //
                  // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   Text(
                  //     'Need help?',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   InkWell(
                  //     onTap: () {},
                  //     child: Text(
                  //       ' Contact Us',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 17,
                  //           color: Colors.white),
                  //     ),
                  //   )
                  // ])
                ],
              ),
            ),
          )),
        ));
  }
}
