import 'package:flutter/material.dart';

class LoginScreenTest extends StatefulWidget {
  const LoginScreenTest({super.key});

  @override
  State<LoginScreenTest> createState() => _LoginScreenTestState();
}

class _LoginScreenTestState extends State<LoginScreenTest> {
  String name= "";
  final _formKey= GlobalKey<FormState>();
  bool changeButton= false;


  moveToHome(BuildContext context)async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton= true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, "/homePage");
      setState(() {
        changeButton= false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/login_icon.png",fit: BoxFit.cover,height: 300,),
            const SizedBox(height: 30),
             Text("Welcome $name",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                      name= value;
                      setState(() {

                      });
                    },
                    validator: (value){
                      if(value==null && value!.isEmpty){
                        return "Please enter Username";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      label: const Text("Username"),
                      hintText: "Username",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    maxLength: 8,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be empty";
                      }else if(value.length<8){
                        return "Password length should be atleast 8";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      label: const Text("Password"),
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                      height: 50,
                      width: changeButton? 50:150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton?50:8),
                      ),
                      child: changeButton? const Icon(Icons.done):const Text("Login"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
