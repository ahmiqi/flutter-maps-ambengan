import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LocationInfo {
  String name;
  String description;
  String type;
  String statusarea;
  String owner;
  File? imageFile;

  LocationInfo({
    required this.name,
    required this.description,
    required this.type,
    required this.statusarea,
    required this.owner,
    this.imageFile,
  });
}

class LocationList extends StatefulWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<LocationInfo> locations = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController statusareaController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  late int selectedIndex;
  bool isEditing = false;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Lokasi Wisata'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nama Lokasi'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Deskripsi Lokasi'),
                ),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: 'Type'),
                ),
                TextField(
                  controller: statusareaController,
                  decoration: InputDecoration(labelText: 'Status Area'),
                ),
                TextField(
                  controller: ownerController,
                  decoration: InputDecoration(labelText: 'OwnerShip'),
                ),
                ElevatedButton(
                  onPressed: () => pickImage(),
                  child: Text('Pilih Gambar'),
                ),
                if (locations.isNotEmpty && locations[0].imageFile != null)
                  Image.file(
                    locations[0].imageFile!,
                    width: 100,
                    height: 100,
                  ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: isEditing ? saveLocation : addLocation,
                child: Text(isEditing ? 'Simpan' : 'Tambah'),
              ),
              if (isEditing)
                ElevatedButton(
                  onPressed: cancelEdit,
                  child: Text('Batal'),
                ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(locations[index].name),
                  subtitle: Text(locations[index].description),
                  leading: locations[index].imageFile != null
                      ? Image.file(
                          locations[index].imageFile!,
                          width: 60,
                          height: 60,
                        )
                      : Container(),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => editLocation(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteLocation(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        locations[0].imageFile = File(pickedFile.path);
      });
    }
  }

  void addLocation() {
    setState(() {
      final name = nameController.text;
      final description = descriptionController.text;
      final type = typeController.text;
      final statusarea = statusareaController.text;
      final ownership = ownerController.text;
      locations.add(LocationInfo(name: name, description: description, type: type, statusarea: statusarea, owner: ownership));
      nameController.clear();
      descriptionController.clear();
      locations[0].imageFile = null;
    });
  }

  void editLocation(int index) {
    setState(() {
      selectedIndex = index;
      nameController.text = locations[index].name;
      descriptionController.text = locations[index].description;
      isEditing = true;
    });
  }

  void saveLocation() {
    setState(() {
      locations[selectedIndex].name = nameController.text;
      locations[selectedIndex].description = descriptionController.text;
      nameController.clear();
      descriptionController.clear();
      selectedIndex = 0;
      isEditing = false;
      locations[0].imageFile = null;
    });
  }

  void cancelEdit() {
    setState(() {
      selectedIndex = 0;
      nameController.clear();
      descriptionController.clear();
      isEditing = false;
      locations[0].imageFile = null;
    });
  }

  void deleteLocation(int index) {
    setState(() {
      locations.removeAt(index);
      if (selectedIndex == index) {
        selectedIndex = 0;
        nameController.clear();
        descriptionController.clear();
        isEditing = false;
        locations[0].imageFile = null;
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: LocationList(),
  ));
}
