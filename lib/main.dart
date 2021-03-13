import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jaybird Button - Custom Widgets'),
        centerTitle: true,
      ),
      body: Center(
        child: jaybirdButton(
          onPressed: () {
            // plays call if call is not playing
            isPlaying ? stopCall() : playCall();
            // navigates to page about jaybirds
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JaybirdInfo(),
              ),
            );
          },
        ),
      ),
    );
  }

  // plays call
  void playCall() async {
    int result = await audioPlayer.play(
        'https://www.british-birdsongs.uk/sounds/1547.mp3'); // plays sound from url
    if (result == 1) {
      setState(() {
        isPlaying = true; // sets isPlaying variable to current playing state
      });
    } else {
      print('error');
    }
  }

  // stops call
  void stopCall() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false; // sets isPlaying variable to current playing state
    });
  }
}

Widget jaybirdButton({@required VoidCallback onPressed}) {
  return ElevatedButton(
    onPressed:
        onPressed, // takes the void callback and passes to elevated button's onPressed
    child: Image.network(
      'https://th.bing.com/th/id/Rd0ee5b9161eb539b8cc87a88acc33ac8?rik=XPcWH32gfKfcQw&riu=http%3a%2f%2f4.bp.blogspot.com%2f-6Pm3iqdv3Os%2fUcAYzO1wkXI%2fAAAAAAAADRY%2fys4r2FPBYUQ%2fs1600%2fBeautiful-Blue-Jay-Bird.jpg&ehk=HeIOP5ahiW8v%2fegOsaPC7hHE4kv4HBwySOltHmA7jO0%3d&risl=&pid=ImgRaw', // image of jaybird
      height: 100,
    ),
  );
}

// Widget that displays Jaybird Information
class JaybirdInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jaybirds'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
            'Blue Jays are in reality grey however light-weight refraction leads to the actual light-weight to be able to bend in a azure wavelength. There\'re extreme all of which will raid additional birds\' nests, rob offspring, younger parrots, and even the actual nests. There\'re omnivores along with, whenever they search, they will search more than they could try to eat. Blue jays catch ants along with wash these individuals around his or her mentoring feathers within a behaviour named “anting. ” It is presumed the ant\'s formic p may behave as a great antiseptic for the azure jay\'s skin color. Blue jays can certainly imitate the actual seem connected with additional parrots such as the howl of your red-shouldered hawk. Blue jays usually are smart bird. They\'ll check out you eat, wait that you can keep, they can swoop lower along with get virtually any meal a person left behind. In fact they are known to check out a person grow vegetables within a yard along with when you finally keep proceed drill down these individuals upwards. They live along with type with combined woodlands along with natrual enviroment tips plus they can certainly live along with thrive very well with urban areas. These music parrots normally usually are monogamous along with connect for life-long.'),
      ),
    );
  }
}
