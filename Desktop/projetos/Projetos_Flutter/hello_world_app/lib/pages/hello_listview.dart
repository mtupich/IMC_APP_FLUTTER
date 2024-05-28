import 'package:flutter/material.dart';
import 'package:hello_world_app/pages/dog_page.dart';
import 'package:hello_world_app/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListview extends StatefulWidget {
  const HelloListview({super.key});

  @override
  State<HelloListview> createState() => _HelloListviewState();
}

class _HelloListviewState extends State<HelloListview> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
        actions: [
          IconButton(onPressed: onPressed, icon: Icon(Icons.list)),
          IconButton(onPressed: onPressed2, icon: Icon(Icons.grid_on))
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    final List<Dog> dogs = [
      Dog("marley", "assets/images/dog1.png"),
      Dog("pipoca", "assets/images/dog2.png"),
      Dog("leo", "assets/images/dog3.png"),
      Dog("leo", "assets/images/dog4.png"),
      Dog("leo", "assets/images/dog5.png")
    ];

    if (_gridView) {
      return GridView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      );
    } else {
      return ListView.builder(
          itemExtent: 350,
          itemCount: dogs.length,
          itemBuilder: (BuildContext context, int index) {
            return _itemView(dogs, index);
          });
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: (){
        push(context, DogPage(dog));
      },
      child: Stack(
        children: <Widget>[
          _img(dog.foto),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  dog.nome,
                  style: const TextStyle(fontSize: 26, color: Colors.red),
                ),
              ))
        ],
      ),
    );
  }

  _img(String imgName) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgName),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  onPressed() {
    print("passei aqui");
    setState(() {
      _gridView = false;
    });
  }

  onPressed2() {
    _gridView = true;
    print("passei aqui");
    setState(() {
      _gridView = true;
    });
  }
}
