import'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslatonPage extends StatefulWidget {
  const LanguageTranslatonPage({super.key});

  @override
  State<LanguageTranslatonPage> createState() =>
      _LanguageTranslatonPageState();
}

class _LanguageTranslatonPageState extends State<LanguageTranslatonPage> {
  var languages = ['Hindi','English','Telugu','Tamil','Marathi'];
  var originLanguage = 'From';
  var destinationLanguage = 'To';
  var output = "";
  TextEditingController languageController = TextEditingController();
  
  void translate(String src,String dest, String input ) async{
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest );
    setState(() {
      output = translation.text.toString();
    });

    if (src=='__' || dest=='__'){
      setState(() {
        output = 'Fail To Translate';
      });
    }
  }

  String getLanguageCode(String language){
    if(language== "English"){
      return "en";
    }else if(language== "Hindi"){
      return "hi";
    }else if(language== "Telugu"){
      return "te";
    }else if(languages== "Tamil"){
      return "tn";
    }
    return'__';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text('Language Translator'),
      centerTitle: true,
      backgroundColor: Colors.white70,
      elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originLanguage,
                      style: TextStyle(color: Colors.white),
                     ),
                    dropdownColor: Colors.white70,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem){
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value){
                    setState(() {
                      originLanguage = value!;
                    });
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.black87,
                    size: 40,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destinationLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem){
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value){
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(8),
                child: TextFormField(
                cursorColor: Colors.white,
                  autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration:InputDecoration(
                  labelText: 'Please enter your text..',
                  labelStyle: TextStyle(fontSize: 15,color: Colors.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 1),
                  ),
                  errorStyle: TextStyle(color: Colors.red,fontSize: 15),
                ),
                controller: languageController,
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return 'Please enter text to translate';
                  }
                  return null;
                },
               ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2b3c5a)),
                onPressed: (){
                    translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text.toString());
                },
                  child: SizedBox(
                      child: Text('Translate',
                        style: TextStyle(
                            color: Colors.white),
                      ),
                  ),
              ),
              ),
              SizedBox(height: 20,),
              Text(
                  "\n $output",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
