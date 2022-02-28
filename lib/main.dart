import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(AppLC());
      
}
class AppLC extends StatefulWidget {
  const AppLC({Key? key}) : super(key: key);

  @override
  _AppLCState createState() => _AppLCState();
}

class _AppLCState extends State<AppLC> {
  int num = 0;
  int? num2;

  void entrou() {
    setState(() {
      num++;
    });
  }
  void saiu() {
    setState(() {
      num--;
    });
  }
  void refresco() {
    setState(() {
      num = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          // centerTitle: true,
          backgroundColor: Colors.pink,
          actions: [
            IconButton(
                onPressed: refresco,
                padding: const EdgeInsets.only(right: 30),
                icon: const Icon(Icons.refresh, size:30,),
                tooltip: 'Limpar',
                )
          ],
          title: const Text('Controle de Convidados'),
        ),


        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/wallpaper/nekuz.jpg'),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(num == 20 ? 'Bloqueado': 'Liberado', style: TextStyle(fontSize: 35),),
                Text(num == 20 ? 'Limite Maximo atingido': 'Vagas em aberto', style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('$num', style: const TextStyle(fontSize: 50)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(100, 40),
                          backgroundColor: num != 20 ?  Colors.black: Colors.grey,
                          elevation: 10,
                          primary: Colors.white,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      onPressed: num != 20 ?entrou: null,
                      child: Text('+',
                      style: TextStyle(
                          color: num != 0 ? Colors.white: Colors.white.withOpacity(0.8)),
                      )),

                  const SizedBox(width: 20,),

                  TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size(100, 40),
                        backgroundColor: num != 0 ? Colors.black: Colors.grey,
                        elevation: 10,
                        primary: Colors.white,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      onPressed: num != 0 ?saiu: null,
                      child: Text('-',
                        style: TextStyle(
                            color: num != 0 ? Colors.white: Colors.white.withOpacity(0.8)),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
