import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefrencelogin/student.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.phone,

              decoration: const InputDecoration(
                  hintText: 'Password'
              ),
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  hintText: 'Age'
              ),
            ),
            const SizedBox(height: 10,),



            InkWell(
              onTap: () async{

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());

                //admin , student , teacher
                sp.setString('userType', 'teacher');


                sp.setBool('isLogin', true);
                if(sp.getString('userType') == 'teacher'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const StudentScreen()));

                }
                else if (sp.getString('userType') == 'student'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const StudentScreen()));

                }]
                else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const StudentScreen()));


                  }

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StudentScreen()));

                //mudasirAhmad();

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: const Center(
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

/* Future<void> mudasirAhmad() async{

    Future.delayed(Duration(seconds: 3));

    print('delayed');


} */

/* void add (){
    int x =10;
    int y =20;
    print(x+y);
  } */
}
