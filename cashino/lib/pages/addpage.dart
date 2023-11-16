// ignore_for_file: prefer_const_constructors, camel_case_types




import 'package:cashino/utils/sendtxt.dart';
import 'package:cashino/utils/cropper.dart';
import 'package:cashino/utils/picker.dart';
import 'package:flutter/material.dart';
import 'package:cashino/components/imagedialouge.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
class addpage extends StatefulWidget {
  final InputImage inputImage = InputImage.fromFilePath("");
  

   addpage({super.key});

  @override
  State<addpage> createState() => __addpageState();
}

class __addpageState extends State<addpage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
  
      body:
        
           Column(
          // ignore: prefer_const_literals_to_create_immutables
          children:[  
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 55, 55)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                  Text("Add Transaction  ",style: TextStyle(color: Color.fromARGB(255, 192, 192, 192),fontSize: 20)),
                     Icon(Icons.add_circle_outline,color: Color.fromARGB(255, 192, 192, 192),size: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      
       floatingActionButton: FloatingActionButton.extended(onPressed: (){
         imagePickerModal(context ,
         onCameratap: (){
          pickImage(source: ImageSource.camera).then((value) {
            if(value!=""){
              imageCropperPage(value, context).then((value) async {
                  InputImage inputImage = InputImage.fromFilePath(value); 
                    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

        RecognizedText recognizedText= await textRecognizer.processImage(inputImage);
        print(recognizedText.text);
        });
             

            
          }});
         },
         onGallerytap: (){  pickImage(source: ImageSource.gallery).then((value) {
            if(value!="" && value != null){  
              imageCropperPage(value, context).then((value) async {
                if (value != null) {
                  InputImage inputImage = InputImage.fromFilePath(value); 
                    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
        try{
          RecognizedText recognizedText= await textRecognizer.processImage(inputImage);
          print(recognizedText.text);
          snedtxt(recognizedText.text);

        }
        catch(e){
           print(e);
}

              }});
            }
          });}
);
       },
       backgroundColor: Color.fromARGB(255, 101, 255, 77),
     label:Text("Add New",style: TextStyle(color: Color.fromARGB(255, 49, 49, 49) ,),),)
       //Icon(Icons.add,color:Color.fromARGB(255, 17, 37, 12) ,),),
    );
  
  }
}
