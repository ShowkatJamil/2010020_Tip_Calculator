import 'package:flutter/material.dart';
import 'package:tip_calculator/Widgets/simpleInputField.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

final formKey = GlobalKey<FormState>();
final totalBillController=TextEditingController();
final totalTipController=TextEditingController();
final totalPeopleController=TextEditingController();

class _TipCalculatorState extends State<TipCalculator> {
  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);


double tipAmountCalculate(){
  return (double.parse(totalBillController.text.isEmpty?"0.00": totalBillController.text)*double.parse(totalTipController.text.isEmpty?"0.00" : totalTipController.text))/100;
}

double totalBillCalculator(){
  return double.parse(totalBillController.text.isEmpty ? "0.00" : totalBillController.text)+(double.parse(totalBillController.text.isEmpty ? "0.00" : totalBillController.text)*double.parse(totalTipController.text.isEmpty?"0.00":totalTipController.text))/100;
}


  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tip Calculator",style: TextStyle(color: Colors.black87 , fontWeight:FontWeight.w700)),
        centerTitle: true,
        elevation: 3,
shadowColor: Colors.black54,
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height-130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Top Section
                  Container(
                    width: double.infinity,
                   decoration: BoxDecoration(
                     color: containerColor,
                     borderRadius: BorderRadius.circular(5)
                     ),
                    padding:const EdgeInsets.all(15),
                    child: Column(
                    children:[
                      const Text("Total Bill",style: TextStyle(color: textLightBlack)),
                      Text("\$ ${totalBillCalculator()}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700,color: textBlack)),


                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Persons",style: TextStyle(color: textLightBlack)),
                          Text("Tip Amount",style: TextStyle(color: textLightBlack))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(totalPeopleController.text.isEmpty?"0":totalPeopleController.text,style: TextStyle(fontSize:16, fontWeight:FontWeight.w700,color: textBlack)),
                          Text("\$ ${tipAmountCalculate()}",style: TextStyle(fontSize:16, fontWeight:FontWeight.w700,color: textBlack))
                        ],
                      )

                    ],
                ),

                      ),
                  ///Gap
                  const SizedBox(
                    height: 10,
                  ),
                  ///Per Person Amount
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding:const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount Per Person",style: TextStyle(color: textLightBlack)),
                        Text("\$ ${totalBillCalculator()/double.parse(totalPeopleController.text.isEmpty?"0.00":totalPeopleController.text)}",style: TextStyle(fontSize:16, fontWeight:FontWeight.w700,color: textBlack))
                      ],
                    ),
                  ),
                   const Spacer(),
                  //  SizedBox(
                  //   height: size.height*0.2,
                  // ),

                  SimpleInputField(
                      controller: totalBillController ,
                      title: "Total Bill",
                      iconData: Icons.attach_money,
                      hintText: "Please Enter Total bill"),
                  SimpleInputField(
                      controller: totalTipController ,
                      title: "Tip Percentage",
                      iconData: Icons.percent,
                      hintText: "Please Enter tip percentage"),
                  SimpleInputField(
                      controller: totalPeopleController ,
                      title: "Number of People",
                      hintText: "Please Enter total number of people"),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              formKey.currentState!.save();
                              print(formKey.currentState!.validate());
                              if(formKey.currentState!.validate()){
                                print("Inputs are Valid");
                              }
                              else
                                {
                                  print("Invalid");
                                }
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10)
                            ),

                            alignment: Alignment.center,

                            child: const Text("Calculate",style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10,) ,

                      GestureDetector(
                        onTap: (){

                          setState(() {
                            totalTipController.text ="0.00";
                            totalPeopleController.text ="0.00";
                            totalBillController.text ="0.00";
                          });

                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                          decoration: BoxDecoration(
                              color: clearButtonColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Text("Clear",style: TextStyle(color:Colors.white)),
                        ),
                      )
                    ],
                  )


                  ],

          ),
              ),
            )
      ),


    )
    );
  }
}






















//const Text("Total Bill",style: TextStyle(fontSize:18, fontWeight:FontWeight.w700,color: textBlack)),
//               // const SizedBox(height: 5),
//               // TextFormField(
//               //   controller: totalBillController,
//               //   keyboardType: TextInputType.number,
//               //   decoration: InputDecoration(
//               //     hintText: "Please Enter total Bill Amount",
//               //     hintStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: textLightBlack),
//               //     suffixIcon: const Icon(Icons.attach_money, color: textLightBlack),
//               //     filled: true,
//               //     fillColor: containerColor,
//               //
//               //
//               //     border: OutlineInputBorder(
//               //       borderSide: const BorderSide(width: 0,color: Colors.transparent),
//               //       borderRadius: BorderRadius.circular(5),
//               //     ),
//               //       enabledBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(width: 0,color: Colors.transparent),
//               //         borderRadius: BorderRadius.circular(5),
//               //   ),
//               //       focusedBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(width: 0,color: Colors.transparent),
//               //         borderRadius: BorderRadius.circular(5),
//               //   ),
//               //
//               //
//               // ),
//               //   onFieldSubmitted: (value){
//               //     if( value.isEmpty){
//               //       totalBillController.text= "0.00";
//               //     }
//               //     totalBillController.text= value.toString();
//               //     formKey.currentState!.save();
//               //     setState(() {
//               //
//               //     });
//               //   },
//               //
//               // ),