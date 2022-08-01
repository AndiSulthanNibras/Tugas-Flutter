import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PerhitunganBangunDatar extends StatefulWidget {
  const PerhitunganBangunDatar({Key? key}) : super(key: key);

  @override
  State<PerhitunganBangunDatar> createState() => _kalkulatorState();
}

class _kalkulatorState extends State<PerhitunganBangunDatar> {
  TextEditingController ctrPanjang = new TextEditingController();
  TextEditingController ctrLebar = new TextEditingController();
  TextEditingController ctrHasil = new TextEditingController();
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perhitungan Bangun Datar"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Luas Persegi Panjang",
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrPanjang,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukan Panjang',
                  hintText: 'Masukan Panjang(cm)'),
            ),
            Container(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrLebar,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukan Lebar',
                  hintText: 'Masukan Lebar(cm)'),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (ctrPanjang.text.isNotEmpty &&
                          ctrLebar.text.isNotEmpty) {
                        ctrHasil.text = (double.parse(ctrPanjang.text) *
                                double.parse(ctrLebar.text))
                            .toString();
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Masukan Angka ke Kolom yang kosong",
                          //desc: "Selamat anda berhasil login",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Selanjutnya",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ).show();
                        return;
                      }
                    });
                  },
                  child: Text("Hitung")),
            )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Hasil : ${ctrHasil.text}cm",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
