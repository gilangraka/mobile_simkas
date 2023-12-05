// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat dan Ketentuan'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: buildTextContent(),
      ),
    );
  }

  Widget buildTextContent() {
    return Text(
      '''
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus consequat nunc dui, at ullamcorper libero blandit nec. 
      Phasellus eget hendrerit erat, vitae consectetur quam. Suspendisse molestie ultrices lacus, id venenatis felis fermentum sed. 
      Suspendisse sollicitudin, mi non facilisis pretium, massa mi condimentum augue, at consequat nisi orci non sem. Morbi scelerisque dui non lorem pretium, sit amet tempus ligula consectetur. 
      Quisque maximus risus sollicitudin tortor tempor, a pharetra felis tincidunt. Suspendisse risus magna, eleifend nec sollicitudin quis, lacinia at massa. Aliquam erat volutpat. Nulla elementum lectus ac ultricies viverra.
      Nunc hendrerit tortor eget massa faucibus, eu eleifend lacus vulputate. Morbi tincidunt erat ut nisi aliquet rhoncus. Integer rhoncus porta ante vitae eleifend. Proin justo neque, convallis sodales massa sed, suscipit dictum enim. 
      Nam feugiat nisl felis, at feugiat eros viverra non. Quisque vitae nisi non tortor porta commodo. Fusce id condimentum lacus, sed luctus nisl. Morbi lorem sapien, sagittis eget velit quis, lobortis mollis velit. Aliquam accumsan, sem et lacinia pulvinar, nunc mi finibus augue, quis pellentesque nisl lacus vel eros. 
      Duis a massa efficitur arcu venenatis suscipit at eu nulla. Donec pharetra nisi sagittis, venenatis dui sit amet, faucibus ex. Vivamus ullamcorper fermentum felis, ut viverra nulla pretium dictum. Aenean vel odio eu sem fermentum tincidunt eget eu tellus. 
      ''',
      style: TextStyle(fontSize: 16.0),
    );
  }


  Widget buildAgreeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },

      child: Text(
        'Saya Menyetujui',
        style: TextStyle(color: Colors.white), // Warna teks tombol
      ),
    );
  }
}
