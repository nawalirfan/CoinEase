// import 'package:coin_ease/LogIn.dart';
// import 'package:coin_ease/OTP/otp_Screen1.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:pinput/pinput.dart';


// class OTP1 extends StatelessWidget {
//   OTP1({super.key});
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) 
//   {
//     final defaultPinTheme = PinTheme
//     (
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color:const  Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith
//       (
//         color:const  Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//     var Code = "";
//     return Scaffold
//     (
//       //app bar
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const OTP()),
//             );
//           },
//         ),
//         backgroundColor: const Color.fromARGB(255, 201, 200, 200),
//         elevation: 0,
//       ),

//       body: Container
//       (
//         color: const Color.fromARGB(255, 201, 200, 200),
//         child: SafeArea
//         (
//           child: Column
//           (
//             children: 
//             [
//               const SizedBox(height: 200.0),
//               const Padding
//               (
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 //phone verification text
//                 child: Text
//                 (
//                   'Phone Verification',
//                   style: TextStyle
//                   (
//                     fontSize: 35,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               //text
//               const Padding
//               (
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Text
//                 (
//                   'Enter the code sent to your number',
//                   style: TextStyle
//                   (
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               Pinput
//               (
//                 length: 6, 
//                 defaultPinTheme: defaultPinTheme,
//                 focusedPinTheme: focusedPinTheme,
//                 submittedPinTheme: submittedPinTheme,
//                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                 showCursor: 
//                 true,
//                 onCompleted: (pin) => print(pin),
//                 onChanged: (value){
//                   Code = value;

//                 },
//               ),
//               const SizedBox(height: 30.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal:.0),
//                 child: ElevatedButton
//                 (
//                   onPressed: ()
//                   async {
//                     try
//                     {
//                       PhoneAuthCredential credential = PhoneAuthProvider. credential(verificationId: OTP.verify, smsCode: Code);
//                       await auth.signInWithCredential(credential);
//                     }catch(e)
//                     {}
                   
                
//                   },
//                   child: Text('Verify phone number', style: TextStyle(color: Colors.black),),
//                   style: ElevatedButton.styleFrom
//                   (
//                       primary: const Color.fromARGB(255, 157, 128, 164),
//                       shape: RoundedRectangleBorder
//                     (
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                 ),
//               ),
              

//               const Text
//               (
//                 'Didn\'t receive code?',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 10.0),
//               Padding
//               (
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: TextButton
//                 (
//                   onPressed: () 
//                   {
//                     // Navigator.push
//                     // (
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const OTP()
//                     //   ),
//                     // );
//                   },
//                   child: const Text
//                   (
//                     'Resend',
//                     style: TextStyle(fontSize: 17),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox
//               (
//                 width: 420,
//                 height: 60,
//                 child: Padding
//                 (
//                   padding:  EdgeInsets.symmetric(horizontal: 20.0),
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
    
//   }
// }

import 'package:coin_ease/Home.dart';
import 'package:coin_ease/OTP/otp_Screen1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTP1 extends StatefulWidget 
{
  OTP1({super.key});

  @override
  _OTP1State createState() => _OTP1State();
}

class _OTP1State extends State<OTP1> 
{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _pinEditingController = TextEditingController();
  bool wrongOTP = false;

  @override
  Widget build(BuildContext context) 
  {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold
    (
      //app bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OTP()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 201, 200, 200),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 200.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                //phone verification text
                child: Text(
                  'Phone Verification',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10.0),
              //text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Enter the code sent to your number',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20.0),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                controller: _pinEditingController,
                onChanged: (value) {
                  // Reset the wrongOTP flag when the user starts typing again
                  if (wrongOTP) {
                    setState(() {
                      wrongOTP = false;
                    });
                  }
                },
              ),
              // Display the wrong OTP message
              if (wrongOTP)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Wrong OTP entered. Please try again.',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: .0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      String code = _pinEditingController.text;
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: OTP.verify,
                        smsCode: code,
                      );
                      await auth.signInWithCredential(credential);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                        (route) => false,
                      );
                    } catch (e) {
                      print('wrong otp');
                      // Set the wrongOTP flag when an incorrect OTP is detected
                      setState(() {
                        wrongOTP = true;
                      });
                    }
                  },
                  child: Text(
                    'Verify phone number',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 157, 128, 164),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const Text(
                'Didn\'t receive code?',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextButton(
                  onPressed: () {
                    // Implement your logic to resend OTP here
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                width: 420,
                height: 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
