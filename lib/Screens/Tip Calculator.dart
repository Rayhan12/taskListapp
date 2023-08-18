import 'package:flutter/material.dart';
import 'package:task_list_application/Widgets/Simple%20Input%20Field.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {


  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);


  double tipAmountCalculate(){
    return double.parse(totalBillController.text.isEmpty? "0.00" : totalBillController.text)*(double.parse(totalTipController.text.isEmpty? "100" : totalTipController.text)/100);
  }

  double totalBillCalculate(){
    return (double.parse(totalBillController.text.isEmpty ? "0.00" :totalBillController.text )+double.parse(totalBillController.text.isEmpty? "0.00" : totalBillController.text)*(double.parse(totalTipController.text.isEmpty? "0.00":totalTipController.text)/100));
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Tip Calculator" ,
            style: TextStyle(fontSize: 18,color: Colors.black87 ,fontWeight: FontWeight.w600)),
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
              height: size.height-115,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text("Total Bill" ,style: TextStyle(color: textLightBlack)),
                        Text("\$ ${totalBillCalculate()}" ,style: TextStyle(fontSize: 26 ,fontWeight: FontWeight.w700,color: textBlack)),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Persons" ,style: TextStyle(color: textLightBlack)),
                            Text("Tip Amount" ,style: TextStyle(color: textLightBlack)),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(totalPeopleController.text.isEmpty? "0": totalPeopleController.text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: textBlack)),

                            /// 25 * (25/100)

                            Text("\$ ${tipAmountCalculate()}" ,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w700 , color: textBlack)),
                          ],
                        )

                      ],
                    ),
                  ),
                  ///Gap
                  const SizedBox(
                    height: 10,
                  ),
                  ///per Person Amount section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount per person" ,style: TextStyle(color: textLightBlack)),
                        Text("\$ ${totalBillCalculate()/double.parse(totalPeopleController.text.isEmpty ? "0.00" :totalPeopleController.text )}" ,style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w900 , color: textBlack)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // SizedBox(
                  //   height: size.height*0.25,
                  // ),
                  SimpleInputField(
                      controller: totalBillController,
                      title: "Total Bill",
                      iconData: Icons.attach_money,
                      hintText: "Please enter total bill"
                  ),
                  SimpleInputField(
                      controller: totalTipController,
                      title: "Tip percentage",
                      iconData: Icons.percent,
                      hintText: "Please enter tip percentage"
                  ),
                  SimpleInputField(
                      controller: totalPeopleController,
                      title: "Number of people",
                      hintText: "Please enter total number of people"
                  ),


                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              formKey.currentState!.save();
                              print(formKey.currentState!.validate());
                              if(formKey.currentState!.validate())
                                {
                                  print("inputs are valid");
                                }
                              else
                                {
                                  print("invalid");
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
                            child: const Text("Calculate", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),

                      GestureDetector(
                        onTap: () {

                          setState(() {
                            // totalTipController.text = "0.00";
                            // totalPeopleController.text = "0.00";
                            // totalBillController.text = "0.00";
                            totalTipController.clear();
                            totalPeopleController.clear();
                            totalBillController.clear();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                          decoration: BoxDecoration(
                              color: clearButtonColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Text("Clear", style: TextStyle(color: Colors.white)),
                        ),
                      )

                    ],
                  )



                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}


// const Text("Total Bill" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: textBlack)),
// const SizedBox(height: 5,),
// TextFormField(
//   controller: totalBillController,
//   keyboardType: TextInputType.number,
//   decoration: InputDecoration(
//     hintText: "Please enter total bill amount",
//     hintStyle: const TextStyle(fontSize: 13 ,fontWeight: FontWeight.w400 ,color: textLightBlack),
//     suffixIcon: const Icon(Icons.attach_money ,color: textBlack,),
//     filled: true,
//     fillColor: containerColor,
//     border: OutlineInputBorder(
//       borderSide: const BorderSide(width: 0 ,color: Colors.transparent),
//       borderRadius: BorderRadius.circular(5),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: const BorderSide(width: 0 ,color: Colors.transparent),
//       borderRadius: BorderRadius.circular(5),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: const BorderSide(width: 0 ,color: Colors.transparent),
//       borderRadius: BorderRadius.circular(5),
//     ),
//   ),
//
//
//   onFieldSubmitted: (value){
//     if(value.isEmpty)
//     {
//       totalBillController.text = "0.00";
//     }
//     totalBillController.text = value.toString();
//     setState(() {});
//   },
//
//
// ),