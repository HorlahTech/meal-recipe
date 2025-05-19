import 'package:flutter/material.dart';

class PassPage extends StatefulWidget {
  const PassPage({super.key});

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Forgot password', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text('Email Verification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown)),
            SizedBox(height: 10),
            Center(
              child: Text('Verify Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 10),
            Center(child: Text('Enter the 4 digit code that was sent to', style: TextStyle(color: Colors.black54))),
            Center(child: Text('@ayodeleblessing@mail.com', style: TextStyle(color: Colors.brown),)),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _otpBox(otp1),
                _otpBox(otp2),
                _otpBox(otp3),
                _otpBox(otp4),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    'Enter the 4 digit code that was sent to',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '@ayodeleblessing@mail.com',
                    style: TextStyle(color: Colors.brown),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () { },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Verify', style: TextStyle(color: Colors.white)),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _otpBox(TextEditingController controller) {
    return Container(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
