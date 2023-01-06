import 'dart:io';

import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  DataController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  var _userImageFile;
  void _pickedImage(File image) {
    _userImageFile = image;
  }

  addImage() {
    if (_userImageFile == null) {
      Get.snackbar('Image Required', 'Place Image ',
          snackPosition: SnackPosition.TOP);
      return;
    }
    _formKey.currentState!.save();
    controller.addProfileImage(_userImageFile);
    Get.snackbar('Success', 'Image Changed', snackPosition: SnackPosition.TOP);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              UserImagePicker(_pickedImage),
              DefaultButton(
                text: 'Update Image',
                press: addImage,
                color: ColorManager.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) getImageValue;
  const UserImagePicker(this.getImageValue);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  var pickedImage;
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pick Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.kPrimaryColor),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("Camera"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.kPrimaryColor),
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("Gallery"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    final ImagePicker picker = ImagePicker();
    try {
      final photo = await picker.pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
        widget.getImageValue(pickedImage);
      });
      widget.getImageValue(pickedImage!);
      Get.back();
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: imagePickerOption,
          child: SizedBox(
            width: 100,
            height: 100,
            child: pickedImage != null
                ? DecoratedBox(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Image.file(
                      pickedImage!,
                      fit: BoxFit.contain,
                    ),
                  )
                : Image.network(
                    'https://static.thenounproject.com/png/2413564-200.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
