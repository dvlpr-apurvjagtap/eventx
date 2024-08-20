import 'package:eventx/controllers/add_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AddScreenController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  controller.pickImage();
                },
                child: const Text("Add Photo"),
              ),
              Consumer<AddScreenController>(
                builder: (context, controller, vvv) {
                  return controller.image != null
                      ? Container(
                          height: 100,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image(
                              image: MemoryImage(controller.image!),
                            ),
                          ),
                        )
                      : SizedBox();
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter the Name of the Event";
                  }
                  return null;
                },
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Event Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Event Location'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter the Location";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Event Price'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a Price";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (controller.image != null) {
                      controller.addEvent(
                          name: _nameController.text,
                          location: _locationController.text,
                          price: _priceController.text,
                          file: controller.image);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No image selected"),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Add Event"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
