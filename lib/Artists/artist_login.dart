import 'package:flutter/material.dart';

class ArtistLogin extends StatefulWidget {
  const ArtistLogin({super.key});

  @override
  State<ArtistLogin> createState() => _ArtistLoginState();
}

class _ArtistLoginState extends State<ArtistLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 164, 192, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: Image.asset('assets/A13.png'),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  )),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Re-enter Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 13,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Social Media id",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 13,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign Up"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(191, 70, 114, 1),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
