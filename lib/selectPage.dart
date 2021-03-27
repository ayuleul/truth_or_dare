import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:truth_or_dare/questionPage.dart';

class SelectPage extends StatefulWidget {
  //variables to accepet data
  final String p1name;
  final String p2name;
  final String cpname;
  SelectPage({Key key, this.p1name, this.p2name, this.cpname})
      : super(key: key);

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    String p1name = widget.p1name;
    String p2name = widget.p2name;
    String cpname = widget.cpname;
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
              _selectButton('TRUTH'),
              Divider(
                color: Colors.pink,
                height: 20,
                thickness: 3,
                indent: 50,
                endIndent: 50,
              ),
              _selectButton('DARE'),
            ],
          ),
        ),
      ),
    );
  }

//creating button for both 'truth' and 'dare' buttons and
//navigate to the question page with which button
//is pressed and the name of players

  _selectButton(String name) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionPage(
                      type: name,
                      p1name: widget.p1name,
                      p2name: widget.p2name,
                      cpname: widget.cpname,
                    )));
      },
      child: Text(
        name,
        style: GoogleFonts.oswald(
          fontSize: 50,
        ),
      ),
    );
  }
}
