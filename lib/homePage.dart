import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:truth_or_dare/selectPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class User {
  String p1n;
  String p2n;

  User({this.p1n, this.p2n});
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _p1n = TextEditingController();
  final _p2n = TextEditingController();
  User player = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Center(
          child: Text(
            'Players:',
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),

      // i use listview beacous when the phone
      // rotates (to landscape mode) it keaps the app from crash with RenderFlex overflowed.
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          _nameInput(),
          SizedBox(height: 30),
          _gameStarter(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          _showHint(context);
        },
        child: const Icon(
          Icons.info_outlined,
          size: 50,
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }

// game starter button
// it checkes if the required names are entered or not.
// if not it will notify you
  _gameStarter() {
    return FloatingActionButton.extended(
      heroTag: null,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectPage(
                        p1name: player.p1n,
                        p2name: player.p2n,
                        cpname: player.p1n,
                      )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('please add name of both players'),
              duration: const Duration(milliseconds: 1500),
              backgroundColor: Colors.red[900],
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      },
      label: const Text('Start Playing',
          style: TextStyle(
            fontSize: 20,
          )),
      icon: const Icon(Icons.play_arrow),
      backgroundColor: Colors.pink,
    );
  }

// button that shows hint about the game by using popup
  _showHint(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink[100],
          title: Text('The rules are simple! '),
          content: SingleChildScrollView(
            child: Text(
                'One player the name on screen choose: “Truth or dare?” If the player picks “truth,” they are asked a question that they must answer honestly. If they choose “dare,” they are given a command or some kind of action they need to perform.'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'I know it!',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//decoration of input of the form
  _inputDecoration() {
    return InputDecoration(
      hintText: 'Name',
      hintStyle: GoogleFonts.notoSans(
        fontSize: 30.0,
        color: Colors.pink[700],
      ),
      border: InputBorder.none,
      fillColor: Colors.white,
      errorStyle: TextStyle(height: 0),
    );
  }

// form that accept two names of the players
  _nameInput() {
    return Container(
      padding: EdgeInsets.only(left: 30),
      color: Colors.blueGrey[900],
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Player 1',
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  width: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                  ),
                  child: TextFormField(
                    controller: _p1n,
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    showCursor: false,
                    style: GoogleFonts.notoSans(
                      fontSize: 30.0,
                      color: Colors.pink[700],
                    ),
                    onSaved: (newValue) => player.p1n = newValue,
                    decoration: _inputDecoration(),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.pink,
              height: 20,
              thickness: 7,
              endIndent: 25,
            ),
            Row(
              children: [
                Text(
                  'Player 1',
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  width: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                  ),
                  child: TextFormField(
                    controller: _p2n,
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    showCursor: false,
                    style: GoogleFonts.notoSans(
                      fontSize: 30.0,
                      color: Colors.pink[700],
                    ),
                    onSaved: (newValue) => player.p2n = newValue,
                    decoration: _inputDecoration(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
