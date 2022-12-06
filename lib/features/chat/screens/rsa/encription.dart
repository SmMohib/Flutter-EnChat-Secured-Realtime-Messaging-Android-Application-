import 'package:clipboard/clipboard.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:myrsaapp/common/utils/textStyle.dart';
import 'package:myrsaapp/features/chat/screens/rsa/decription.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;
  String pasteValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryption Text"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tec,
                style: text20(),
              ),
            ),
            Column(
              children: [
                Text(
                  "PLAIN TEXT",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    plainText == null ? "" : plainText,
                    style: text20(),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SelectableText(
                  "ENCRYPTED TEXT",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600,
                  ),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  SelectableText(
                      encryptedText == null
                          ? ""
                          : encryptedText is encrypt.Encrypted
                              ? encryptedText.base64
                              : encryptedText,
                      style: text20(),
                    
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Encrypted
                TextButton(
                  onPressed: () {
                    plainText = tec.text;
                    setState(() {
                      encryptedText =
                          MyEncryptionDecryption.encryptFernet(plainText);
                    });
                    tec.clear();
                  },
                  child: Text("Encrypt"),
                ),
                SizedBox(
                  width: 15,
                ),

                //Dectrypted
                TextButton(
                  onPressed: () {
                    setState(() {
                      _copyText(tec.text);
                      encryptedText =
                          MyEncryptionDecryption.decryptFernet(encryptedText);
                      print("Type: " + encryptedText.runtimeType.toString());
                    });
                  },
                  child: Text("Decrypt"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: const Icon(Icons.copy, color: Colors.orange, size: 32),
                  onTap: () {
                    if (tec.text.trim() == "") {
                      print('enter text');
                    } else {
                      _copyText(tec.text);
                    }
                  },
                ),
                GestureDetector(
                  child: const Icon(Icons.content_paste,
                      color: Colors.orange, size: 32),
                  onTap: () {
                    _pastText();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            const Divider(),
            Text(
              'Clipboard Text: $pasteValue',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }

  void _copyText(String text) {
    FlutterClipboard.copy(tec.text).then((value) {
      _showSnackBar();
    });
  } 
  void _copyText2(String text) {
    FlutterClipboard.copy(tec.text).then((value) {
      _showSnackBar();
    });
  }

  void _pastText() {
    FlutterClipboard.paste().then((value) {
      setState(() {
        tec.text = value;
        pasteValue = value;
      });
    });
  }

  void _showSnackBar() {
    const snack =
        SnackBar(content: Text("Text copied"), duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
