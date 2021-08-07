import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_testing/pages/MapHome.dart';
import 'package:sizer/sizer.dart';
 void main(){
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
   .then((_) => {
     runApp(MyApp())
   });
  
 }

 class MyApp extends StatelessWidget {
   const MyApp({ Key? key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Sizer(builder: (context,orientation,deviceType){
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Map Testing',
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
        home: MapHome(),
       );
     });
   }
 }