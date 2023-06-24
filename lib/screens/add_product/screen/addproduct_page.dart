import 'dart:developer';
import 'dart:io';
import 'package:dress_shop/screens/details/components/product_title_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/constants.dart';
import '../controller/addproduct_ctrl.dart';

class AddProductPage extends ConsumerStatefulWidget {
  const AddProductPage({super.key, this.id});

  final int? id;

  @override
  ConsumerState<AddProductPage> createState() => _AddproductState();
}

class _AddproductState extends ConsumerState<AddProductPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController size = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  File? _imageFile;
  String? selectedValue;
  bool isUploading = false;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    // final pickedFile = await picker.getImage(source: source);
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    name.dispose();
    price.dispose();
    super.dispose();
  }

  void _clearSelection() {
    setState(() {
      _imageFile = null;
      selectedValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var uploaStatus = ref.watch(uploadStatusProvider);
    log('uploadStatus: $uploaStatus');

    bool isLoding = false;

    ref.listen(uploadStatusProvider, (previous, status) {
      if (status.isLoading) isLoding = true;
    });

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imageFile != null
                      ? Image.file(_imageFile!,
                          height: 200, width: 400, fit: BoxFit.cover)
                      : Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: _imageFile == null
                              ? const Center(
                                  child: Text('No image selected.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black)),
                                )
                              : Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                        height: 20,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              side: const BorderSide(
                                  color: primaryColor, width: 2),
                            ),
                            onPressed: () => _getImage(ImageSource.gallery),
                            child: const Text('Select image',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)))),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: name,
                    style: const TextStyle(color: Colors.white),
                    minLines: 1,
                    maxLines: 15,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'title',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: description,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write description',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: price,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter price',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: size,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter size',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: quantity,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter quantity',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // DropdownWidget(onValueChanged: handleValueChanged),
                  dropdown(),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        // onPressed: _uploadImage,
                        onPressed: () async {
                          isUploading = true;
                          var scaffoldMessenger = ScaffoldMessenger.of(context);
                          var status = await ref
                              .read(uploadInfoProvider.notifier)
                              .uploadImage(
                                context,
                                name.text,
                                price.text,
                                _imageFile,
                                description.text,
                                size.text,
                                selectedValue!,
                                quantity.text,
                              );

                          if (status) {
                            isUploading = false;
                            _clearSelection;
                            name.clear();
                            price.clear();
                            description.clear();
                            size.clear();
                            quantity.clear();

                            scaffoldMessenger.showSnackBar(const SnackBar(
                                content: Text(
                              'Uploaded Successfully',
                              style: TextStyle(color: Colors.green),
                            )));
                          } else {
                            CircularProgressIndicator();
                            scaffoldMessenger.showSnackBar(const SnackBar(
                                content: Text(
                              'Opps... Something went wrong. Please try again',
                              style: TextStyle(color: Colors.red),
                            )));
                          }
                        },
                        child: isUploading
                            ? CircularProgressIndicator()
                            : const Text('Add product'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoding)
            const CircularProgressIndicator(
              color: Colors.amber,
            ),
        ],
      ),
    );
  }

// drop down
  Row dropdown() {
    return Row(
      children: [
        const Text(
          'choose category',
          style: TextStyle(fontSize: 20, color: Colors.white60),
        ),
        const SizedBox(width: kDefaultPaddin),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 'dress',
                  child: Text('Dress'),
                ),
                DropdownMenuItem(
                  value: 'handbag',
                  child: Text('hand bag'),
                ),
                DropdownMenuItem(
                  value: 'shoes',
                  child: Text('shoes'),
                ),
              ],
              underline: SizedBox(),
              style: const TextStyle(fontSize: 16.0, color: Colors.white60),
              hint: Text('Select category'),
            ),
          ),
        ),
      ],
    );
  }
}
