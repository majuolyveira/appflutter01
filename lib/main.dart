import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 229, 211, 8)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: ({
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(
              title: 'home',
              onLogout: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.onLogout})
      : super(key: key);

  final String title;
  final VoidCallback onLogout;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restartCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _logout() {
    widget.onLogout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.add_box),
            const Text(
              'Quantity:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: _decrementCounter,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Text('Decrement'),
                ),
                TextButton(
                  onPressed: _incrementCounter,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  ),
                  child: const Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _restartCounter,
            tooltip: 'Restart',
            backgroundColor: Color.fromARGB(255, 203, 183, 4),
            child: const Icon(Icons.restart_alt),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _logout,
            tooltip: 'Logout',
            backgroundColor: Colors.red,
            child: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
