import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:truth_or_dare/questionList.dart';
import 'package:truth_or_dare/selectPage.dart';

class QuestionPage extends StatelessWidget {
  final String type;
  final String p1name;
  final String p2name;
  final String cpname;
  QuestionPage({Key key, this.type, this.p1name, this.p2name, this.cpname})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(p1name),
            Text('  Vs  '),
            Text(p2name),
          ],
        ),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  cpname,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
              _horizontalDivider(),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  _selectQ(),
                  style: GoogleFonts.oswald(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              _horizontalDivider(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(
          Icons.skip_next,
          size: 50,
        ),
        backgroundColor: Colors.pink,
        label: Text('NEXT',
            style: TextStyle(
              fontSize: 20,
            )),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectPage(
                        p1name: p1name,
                        p2name: p2name,
                        cpname: cpname == p1name ? p2name : p1name,
                      )));
        },
      ),
    );
  }

// it is just a horizontal line
  _horizontalDivider() {
    return Divider(
      color: Colors.pink,
      height: 20,
      thickness: 2,
      indent: 70,
      endIndent: 70,
    );
  }

//depending on the selected type of
//question this function return a random
//question from question lists
  _selectQ() {
    if (type == 'TRUTH') {
      Random random = new Random();
      int randomNumber = random.nextInt(10);
      return truthQuestions[randomNumber];
    } else if (type == 'DARE') {
      Random random = new Random();
      int randomNumber = random.nextInt(10);
      return truthQuestions[randomNumber];
    }
  }
}
