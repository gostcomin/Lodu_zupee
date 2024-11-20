import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ReferAndEarnPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.black,
        title: Text("Refer & Earn", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        height: Get.height * 1,
        width: Get.width * 1,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Invite your",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Freinds",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Image.asset("lib/App/Assets/share_and_earn_icon.png", width: Get.width * .4,)
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                  width: double.infinity,
                  child: Text("  REFERRAL CODE:", style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 1), textAlign: TextAlign.left,)),
              InkWell(
                onTap: (){
                  Get.snackbar("Copied", "Referral Code Copied!");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade800.withOpacity(0.1),
                    border: Border.all(color: Colors.red.shade800, width: 2.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ZU678954",
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade800,
                        ),
                      ),
                      Text(
                        "TAP TO COPY",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "TOTAL EARNED",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "50",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey[300],
                  ),
                  Column(
                    children: [
                      Text(
                        "TOTAL REFER",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "50",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6),
              Divider(thickness: 1),
              SizedBox(height: 6),
              Text(
                "HOW DOES THIS WORKS?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Image.asset('lib/App/Assets/refer_and_earn_proccess.png', width: Get.width * .5), // Replace with your workflow image
              SizedBox(height: 20),
              Text(
                "Invite your friends to play our app, and you'll earn 1% of their entry fee every time they join a paid contest that costs more than TK100. This amount will be added to your bonus balance, which you can use to enter any contest.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 12),
              Text(
                "আপনার বন্ধুদের আমাদের অ্যাপটি খেলতে আমন্ত্রণ জানান এবং তারা যাহই ১০০ টাকার উপরে কোনো পেইড কনটেস্টে যোগ দেয়, আপনি তাদের এন্ট্রি ফি-র ১% পাবেন। এই টাকা আপনার বোনাস ব্যালেন্সে যোগ হবে, যা আপনি যেকোনো কনটেস্টে অংশগ্রহণ করতে ব্যবহার করতে পারবেন।",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Define your message and link
                  String message = "Check out our amazing demo app: https://www.example.com";

                  // Use the share functionality
                  Share.share(message);
                },
                icon: Icon(Icons.share),
                label: Text("SHARE NOW"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
