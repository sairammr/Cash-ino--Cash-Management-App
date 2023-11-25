// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, avoid_print, unnecessary_null_comparison

import 'package:cashino/components/imagedialouge.dart';
import 'package:flutter/material.dart';
import 'package:cashino/utils/cropper.dart';
import 'package:cashino/utils/picker.dart';
import 'package:cashino/utils/sendtxt.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class AddAndActivityPage extends StatefulWidget {
  @override
  _AddAndActivityPageState createState() => _AddAndActivityPageState();
}

class _AddAndActivityPageState extends State<AddAndActivityPage> {
  TextEditingController _searchController = TextEditingController();
  List<BoxData> _allBoxes = [];
  List<BoxData> _filteredBoxes = [];
  FilterType _selectedFilter = FilterType.all;

  @override
  void initState() {
    super.initState();
    _updateDataList();
  }

  void _updateDataList() {
    // Retrieve data from DataHandling and convert it to BoxData
    setState(() {
      
    _allBoxes = DataHandling.dataList.map((data) {
      return BoxData(
        
        color: Color.fromARGB(255, 244, 244, 244),
        leftText: data['receiver'] ?? '',
        rightText: data['amount'] ?? '',
      );
    }).toList().reversed.toList();   });
    // Apply filters
    _filterBoxes(_searchController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    toolbarHeight:40,
    
    backgroundColor:  Color.fromARGB(143, 37, 37, 37),
    title: Text("T R A N S A C T I O N S",
    style: TextStyle(

        fontSize: 18,
        fontWeight:FontWeight.w300,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
  ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top:6.0,),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Color.fromARGB(255, 192, 192, 192),fontSize: 16,),
              onChanged: _filterBoxes,
              decoration: InputDecoration(
                hintText: "Search Transaction",hintStyle: TextStyle(fontWeight: FontWeight.w200 ,color: Color.fromARGB(255, 172, 172, 172)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(181, 192, 192, 192),
          width: 0.5)
        )
        ,focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(174, 192, 192, 192),
          width:0.5 )
        ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterButton(FilterType.all),
              _buildFilterButton(FilterType.credits),
              _buildFilterButton(FilterType.debits),
            ],
          ),
          SizedBox(height: 0),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBoxes.length,
              itemBuilder: (context, index) {
                return _buildBox(_filteredBoxes[index]);
              },
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

  Widget _buildBox(BoxData box) {
    return Container(
      width: 400.0,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border
        (bottom: BorderSide(color: Color.fromARGB(150, 142, 140, 140), width: 0.5 ),
          ),
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              box.leftText.toUpperCase(),
              style: TextStyle(    fontSize: 17,fontWeight:FontWeight.w300,color: Color.fromARGB(255, 225, 225, 225)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              box.rightText,
              style: TextStyle(fontSize: 17,fontWeight:FontWeight.w300, color: const Color.fromARGB(255, 101, 255, 77)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(FilterType filterType) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedFilter = filterType;
            _filterBoxes(_searchController.text);
          });
        },
        style: ElevatedButton.styleFrom(
          
          backgroundColor: _selectedFilter == filterType ? Color.fromARGB(255, 101, 255, 77)
          :Color.fromARGB(206, 219, 216, 216)
        ),
        child: Text(filterType == FilterType.credits ? 'Credits' : filterType == FilterType.debits ? 'Debits' : 'All',
        style: TextStyle(color:Color.fromARGB(255, 23, 23, 23) ),),
      ),
    );
  }

  void _filterBoxes(String searchText) {
    setState(() {
      _filteredBoxes = _allBoxes
          .where((box) =>
              box.leftText.toLowerCase().contains(searchText.toLowerCase()) &&
              (_selectedFilter == FilterType.all ||
                  (_selectedFilter == FilterType.credits && box.rightText.startsWith('+')) ||
                  (_selectedFilter == FilterType.debits && box.rightText.startsWith('-'))))
          .toList();
    });
  }
}

enum FilterType {
  all,
  credits,
  debits,
}

class BoxData {
  final Color color;
  final String leftText;
  final String rightText;
  BoxData({required this.color, required this.leftText, required this.rightText});
}
class DataHandling {
  static double totalexp = 0;
  static double totalcredit = 0;
  static double tempamount = 0 ;
  static List<Map<String, String>> dataList = [];
  static void handleData(String receiver, String amount) {
    // Create a map with the submitted data
    Map<String, String> dataMap = {
      'receiver': receiver,
      'amount': amount,
    };
     tempamount= double.tryParse(amount.toString()) ?? 0;
     if(tempamount<=0){
      totalexp += (tempamount*-1);
     }
     else{
      totalcredit += tempamount;
     }
    dataList.add(dataMap);
    print('Updated data list: $dataList');

  }
}
