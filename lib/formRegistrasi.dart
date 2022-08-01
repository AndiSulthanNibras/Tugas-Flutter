import 'package:flutter/material.dart';
import 'package:flutter_application_1/SecondRoute.dart';

class formRegistrasi extends StatefulWidget {
  const formRegistrasi({Key? key}) : super(key: key);

  @override
  State<formRegistrasi> createState() => _formRegistrasiState();
}

class _formRegistrasiState extends State<formRegistrasi> {
  TextEditingController ctrUsername = new TextEditingController();
  TextEditingController ctrPassword = new TextEditingController();
  int id = 1;
  String myPhone = "-";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("formRegistrasi"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Pendaftaraan Kominfo",
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: ctrUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
                hintText: "Nama kau siapa?",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: ctrPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Password kau apa?",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pilih jenis kelamin anda",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (value) {
                    setState(() {
                      id = 1;
                    });
                  },
                ),
                Text("Laki-Laki"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (value) {
                    setState(() {
                      id = 2;
                    });
                  },
                ),
                Text("Perempuan"),
              ],
            ),
            Text("phone :" + myPhone),
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondRoute()),
                  );

                  print("hasil input phone number :" + result.toString());
                  setState(() {
                    myPhone = result.toString();
                  });
                },
                child: Text('isi nomer telepon')),
            Center(
              child: Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Masukan Data")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
