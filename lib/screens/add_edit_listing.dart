import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEditListingPage extends StatefulWidget {
  const AddEditListingPage({super.key});

  @override
  State<AddEditListingPage> createState() => _AddEditListingPageState();
}

class _AddEditListingPageState extends State<AddEditListingPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _base64Image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _base64Image = 'data:image/jpeg;base64,${base64Encode(bytes)}';
      });
    }
  }

  void _saveListing() async {
    if (_formKey.currentState?.validate() ?? false) {
      final title = _titleController.text.trim();
      final price = _priceController.text.trim();
      final location = _locationController.text.trim();
      final description = _descriptionController.text.trim();

      try {
        await FirebaseFirestore.instance.collection('lands').add({
          'title': title,
          'price': price,
          'location': location,
          'description': description,
          'image': _base64Image ?? '',
          'createdAt': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Listing saved successfully!")),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error saving listing: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add/Edit Listing")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: _base64Image != null
                      ? Image.memory(
                          UriData.parse(_base64Image!).contentAsBytes(),
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text("Tap to select image")),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter title" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter price" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: "Location"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter location" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _saveListing,
                icon: const Icon(Icons.save),
                label: const Text("Save Listing"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff35573B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
