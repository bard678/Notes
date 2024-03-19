import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  TextEditingController controller=TextEditingController();
DateTime? time;
int clicks=1;
  BuildContext? con;
  @override
  Widget build(con) {
    return Scaffold(
appBar: AppBar(
  leading: IconButton(onPressed: (){

    if(time!=null&&DateTime.now().difference(time!)<Duration(seconds: 2))
      {

     ++clicks;
     if(clicks>=2){  showDialog(context: context, builder: (builder)=>AlertDialog(
         content: Text("data"),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(con); Navigator.pop(con);
           }, child: Text("Exit",style: TextStyle(color: Colors.black),)),
           TextButton(onPressed: (){
             Navigator.pop(context);
             Navigator.pop(context,controller.text);
           }, child: Text("Save",style: TextStyle(color: Colors.black),),)


         ],
       ));
     }
      }
    else {
      clicks=1;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("press again to save"),
                  duration: Duration(seconds: 2),
                ));
                time=DateTime.now();
              }
            }, icon: Icon(Icons.arrow_back)),
),
      body: TextField(
        controller: controller,
        maxLines: 20,
      ),
    );
  }
}
