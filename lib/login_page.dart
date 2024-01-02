import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton= false;
  final _formKey= GlobalKey<FormState>();

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
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/login_icon.png",
                fit: BoxFit.cover, height: 300),
            const SizedBox(height: 20),
            Text(
              "Welcome $name",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "fontFamily"),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 8,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "password cannot be empty";
                      }else if(value.length<8){
                        return "password length should be atleast 8";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration:  const Duration(seconds: 1),
                      height: 50,
                      width: changeButton? 50: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton? 50:8),
                        // shape: changeButton? BoxShape.circle: BoxShape.rectangle,
                      ),
                      child: changeButton? const Icon(Icons.done): const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
