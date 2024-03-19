

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/text_editor.dart';
String git='reclp';
class lll extends StatefulWidget {
  const lll({super.key});

  @override
  State<lll> createState() => _lllState();
}

class _lllState extends State<lll> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ThemeGo extends ChangeNotifier{
  ThemeData _themeData=ThemeData.light();
  
  ThemeData get themeData=>_themeData;
void setTheme(ThemeData _data){
  data=_data;
  notifyListeners();


}
}

ThemeData data=ThemeData.light();
void main() {

  runApp(Materialh());
}
class Materialh extends StatefulWidget {
  const Materialh({super.key});

  @override
  State<Materialh> createState() => _MaterialhState();
}

class _MaterialhState extends State<Materialh> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (con){return ThemeGo();},
    child:   Consumer<ThemeGo>(builder: (con,i,c)=> MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: data,
    ),));
  }
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
String dat='';
class _MyAppState extends State<MyApp> {
  List<Widget> widgt=[];
  bool pressed=false;
  bool dark=false;
  List<String> listtext=[];

  Color colormode=Colors.white;


 late SharedPreferences preferences;
@override
void initState(){
  super.initState();

initPreference();
}
void initPreference()async{
  preferences=await SharedPreferences.getInstance();
  listtext =preferences.getStringList('key')!;
  dark=preferences.getBool('theme')!;
  if(dark){
    Provider.of<ThemeGo>(context,listen: false).setTheme(ThemeData.dark());
    colormode=Colors.black;
  }else {
      Provider.of<ThemeGo>(context, listen: false).setTheme(ThemeData.light());
      colormode=Colors.white;
    }
  }
int count=0;
  @override
  Widget build(BuildContext context) {
    count=listtext.length;

    return
    Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:IconButton(onPressed: (){

                 setState(() {
                   if(dark) {
                  Provider.of<ThemeGo>(context,listen: false).setTheme(ThemeData.light());

                            setState(() {
                              preferences.setBool('theme', false);
                              dark=preferences.getBool('theme')!;
                              colormode=Colors.white;
                              data=ThemeData.light();
                            });
                          } else {

                     Provider.of<ThemeGo>(context,listen: false).setTheme(ThemeData.dark());
                    setState(() {
                      preferences.setBool('theme', true);
                      dark=preferences.getBool('theme')!;
                      colormode=Colors.black;
                      data=ThemeData.dark();
                    });

                          }
                        });

                }, icon: Icon(dark?Icons.dark_mode:Icons.light_mode)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:IconButton(onPressed: (){


                  setState(() {
                    listtext.add("");
                    widgt.add(
                     Center(
                       child: Text("data"),
                     ));



                  });
                }, icon: Icon(Icons.add)),
              ),
              IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>TextEditor()));}, icon: Icon(Icons.gamepad_outlined))
            ],

            title: Text('Notes',),
          ),
          body:  Container(
              height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
              child:ListView.builder(itemBuilder: (itemBuilder,index){
                String? preftext=preferences.getString("key$index");
                count=listtext.length;

                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(child:
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>TextEditor())).then((value) {setState(() {
                            listtext[index]=value;
                            preferences.setString("key$index", value);
                            preferences.setStringList('key', listtext);

                          });});
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:colormode,
                            boxShadow: [BoxShadow(
                                color: Color.lerp(Colors.grey, Colors.black, 0.5)!,
                                offset: Offset(5,5))],

                            borderRadius: BorderRadius.circular(20)
                        ),
                        width: MediaQuery.of(context).size.width-40,height: 90,child:Center(child:preftext!=null? Text(preftext):Text("Enter a text"),),),
                    )),
                  );
              
              },itemCount: listtext.length,))


    );
  }
}

class IconCo extends StatefulWidget {
  const IconCo({super.key});

  @override
  State<IconCo> createState() => _IconCoState();
}

class _IconCoState extends State<IconCo> {
  @override
  Widget build(BuildContext context) {
    return  Column(children:[] ,);
  }
}
