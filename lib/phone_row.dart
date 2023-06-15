import 'dart:io';

import 'package:flutter/material.dart';
import 'phone_model.dart';

class PhoneWidget extends StatelessWidget {
  final Phone phone;
  final VoidCallback deleteClick;
  final VoidCallback editClick;

  const PhoneWidget({
    Key? key,
    required this.phone,
    required this.deleteClick,
    required this.editClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: editClick,
      onDoubleTap: deleteClick,
      child: Card(
        color: const Color.fromARGB(255, 167, 224, 255),
        margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildThumbnailImage(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(phone.producer),
                      Text(phone.model),
                      Text(phone.softVersion),
                    ],
                  ),
                ),
              ),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailImage() {
    final imageWidget = phone.picture.isNotEmpty
        ? Image.file(
      File(phone.picture),
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    )
        : Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: imageWidget,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: editClick,
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: deleteClick,
        ),
      ],
    );
  }
}
