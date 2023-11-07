import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModelListScreen(),
    );
  }
}

class ModelListScreen extends StatefulWidget {
  @override
  _ModelListScreenState createState() => _ModelListScreenState();
}

class _ModelListScreenState extends State<ModelListScreen> {
  List<Model> models = [
    Model('Astronaut', 'assets/Astronaut.glb'),
    Model('Ironman', 'assets/ironman.glb'),
    Model('Anime', 'assets/anime.glb'),
    Model('Girl', 'assets/girl.glb'),
    Model('Monster', 'assets/monster.glb'),

    // Add more models as needed.
  ];

  Model? selectedModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Model')),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          if (selectedModel != null)
            Expanded(
              child: ModelViewer(
                key: UniqueKey(),
                backgroundColor: Colors.black,
                src: selectedModel!.assetPath,
                alt: 'A 3D model of ${selectedModel!.name}',
                ar: true,
                arModes: const ['scene-viewer', 'webxr', 'quick-look'],
                autoRotate: true,
                // iosSrc: selectedModel!.iosSrc,
                disableZoom: true,
              ),
            ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: models.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedModel = models[index];
                    });
                  },
                  child: Container(
                    width: 100,
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(models[index].name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Model {
  final String name;
  final String assetPath;
  // final String iosSrc;

  Model(
    this.name,
    this.assetPath,
  );
}
