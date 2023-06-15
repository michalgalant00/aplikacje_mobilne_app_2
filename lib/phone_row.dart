import 'package:flutter/material.dart';
import 'phone_model.dart';


class PhoneWidget extends StatelessWidget {
  final Phone phone;
  final VoidCallback deleteClick;
  final VoidCallback editClick;

  const PhoneWidget({Key? key,
    required this.phone,
    required this.deleteClick,
    required this.editClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: editClick,
      onDoubleTap: deleteClick,
      child: Card(
        color: const Color.fromARGB(255, 167, 224, 255),
        margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ListTile(
          title: Text(phone.producer),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(phone.model),
              Text(phone.softVersion),
            ],
          ),
          trailing: Row(
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
          ),
        ),
      ),
    );
  }
}