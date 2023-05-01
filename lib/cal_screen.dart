import 'package:calculator/btnStyle.dart';
import 'package:flutter/material.dart';

class CalScreen extends StatefulWidget {
  static const String routename = "cal";

  @override
  State<CalScreen> createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {
  String restxt = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(color: Colors.brown))
                  ),
              alignment: Alignment.centerLeft,
              child: Text(
                restxt,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BTN("9", btnclick,color: Colors.black,),
                  BTN("8", btnclick,color: Colors.black),
                  BTN("7", btnclick,color: Colors.black),
                  BTN(
                    "C",
                    Clear,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BTN("6", btnclick,color: Colors.black),
                  BTN("5", btnclick,color: Colors.black),
                  BTN("4", btnclick,color: Colors.black),
                  BTN(
                    "*",
                    btnoperator,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BTN("3", btnclick,color: Colors.black),
                  BTN("2", btnclick,color: Colors.black),
                  BTN("1", btnclick,color: Colors.black),
                  BTN(
                    "-",
                    btnoperator,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BTN("0", btnclick,color: Colors.black),
                  BTN("/", btnoperator,color: Colors.brown),
                  BTN("=", equalbtn,color: Colors.brown,),
                  BTN(
                    "+",
                    btnoperator,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void btnclick(txt)
  {
    setState(() {
      if(op!="=")
        {
          restxt+=txt;
        }
      else
        {
          restxt=txt;
          op="";
        }

    });


  }
  String lhs="";
  String op="";
  //5+5=
  void equalbtn(eq)
  {
    setState(() {
      restxt=Calculate(lhs, restxt, op);
      print(op);
      op=eq;
      print(op);
    });
  }
  String Calculate(String lhs,String  rhs,String op)
  {
    int LHS=int.parse(lhs);
    int RHS=int.parse(rhs);
    if(op=="+")
      {
        return (LHS+RHS).toString();
      }
    else if(op=="-")
      {
        return (LHS-RHS).toString();
      }
    else if(op=="*")
    {
      return (LHS*RHS).toString();
    }
    else if(op=="/")
    {
      return (LHS/RHS).toString();
    }
    return "";


  }
  // 5+6
  void btnoperator(operator){
    if(op.isEmpty)
      {
        lhs=restxt;
      }
    else
      {
        lhs=Calculate(lhs,restxt,op);
      }
    op=operator;
    restxt="";
    print(lhs);
    setState(() {

    });
  }
  void Clear(txt)
  {
    restxt="";
    op="";
    lhs="";
  }
}
