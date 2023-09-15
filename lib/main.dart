import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen() ,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _key= GlobalKey<FormState>();
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        
        child: Scaffold(
      
  body: Container(
  height: MediaQuery.sizeOf(context).height,
  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/black2.jpg"), fit: BoxFit.cover)),

    child: SingleChildScrollView(
      child: Container(
      margin: EdgeInsets.all(40),
          
      child: Form(
        key: _key,
          
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
        RichText(
        text: TextSpan(
          text: 'FACI',
          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,),
          children: const <TextSpan>[
            TextSpan(text: 'O', style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.greenAccent)),
          
          ],
        ),
      ),
       SizedBox(height: 30,),
        
        TextFormField(
        validator: (value){
        if(value!.isEmpty || value ==null){
          
          return "Email can not be empty";
        }
        else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)){
          return "Email not match email formate ";
        }
          
        },
        
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
      filled: true,
      fillColor:Color.fromARGB(61, 255, 255, 255),
      hintText: "Email Address",
      prefixIcon: Icon(Icons.email, color: Colors.white),            
      hintStyle: TextStyle(
      color: Colors.greenAccent,
      ),
    
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.greenAccent),
            
          ), 
      
          ), ),
    
    SizedBox(height: 10,),
    TextFormField(
    validator: (value){
      if(value!.isEmpty || value ==null){
      
      return "Password can not be empty";
      }
      //Minimum eight characters, at least one uppercase letter, one lowercase letter and one number
      else if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(value)){
      return "Password does not match password formate ";
      }
      
      },
                  
        style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
          fillColor:Color.fromARGB(61, 255, 255, 255),
        hintText: "Password",
        
        prefixIcon: Icon(Icons.lock, color: Colors.white,),            
        hintStyle: TextStyle(
        color: Colors.greenAccent),                   
            
          
        focusedBorder:OutlineInputBorder(
        borderSide: BorderSide( color: Colors.greenAccent),), 
               
        ), ),
        SizedBox( height: 20,),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
  
      SizedBox(
      width: MediaQuery.sizeOf(context).width*.06,
        child: CheckboxListTile(
        side: const BorderSide(color: Colors.white ,width: 1),
          checkboxShape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(100),
          ),
          
          value: isChecked,
          activeColor: Colors.greenAccent,
          checkColor: Colors.white,
          
          onChanged: (value) {
            setState(() {
            isChecked = value ?? false;
            });
          },
        ),

        
      ),
      SizedBox(width: MediaQuery.sizeOf(context).width*.03,),
    Text("Keep me logged in", style: TextStyle(color: Colors.white,),)
  
        ],
        ),
  
  
      Container(
        margin: EdgeInsets.only(top: 20),
        width: 300,
        child: ElevatedButton(onPressed: (){
          _key.currentState!.validate();
        }, child: Text("LOGIN",
  
      style: TextStyle(color: Colors.white),),
      style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
      )),
      ),
      SizedBox(  height: MediaQuery.sizeOf(context).height*.05),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text("Forget password?", style: TextStyle(color: Colors.white,)),
      Text("Recover here", style: TextStyle(color: Colors.greenAccent,),)
      ],
      ),
         
         
      
      SizedBox( height: MediaQuery.sizeOf(context).height*.3,),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text("Dont have an account?", style: TextStyle(color: Colors.white,)),
        Text("Signup here", style: TextStyle(color: Colors.greenAccent,),)
        ],
        ),
      
             
             
             
               ],
             
               ),
             ),
              
             ),
           ),
         ),
      
      
      
      
      
        ),
    );
  }
}