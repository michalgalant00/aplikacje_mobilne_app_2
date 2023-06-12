import 'package:flutter/material.dart';

import 'phone_model.dart';
import 'phone_database.dart';
import 'phone_row.dart';
import 'phone_form_screen.dart';

class PhonesScreen extends StatefulWidget {
  const PhonesScreen({Key? key}) : super(key: key);

  @override
  State<PhonesScreen> createState() => _PhonesScreenState();
}

class _PhonesScreenState extends State<PhonesScreen> {
  void _deletePhone(Phone phone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Potwierdź usuwanie'),
        content: const Text('Czy na pewno chcesz usunać telefon?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        actions: [
          TextButton(
            child: const Text('Anuluj'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Usuń',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              await PhoneDatabase.deletePhone(phone);
              setState(() {});
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  void _editPhone(Phone phone) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneScreen(phone: phone),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Telefony'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PhoneScreen()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Phone>?>(
        future: PhoneDatabase.getPhones(),
        builder: (context, AsyncSnapshot<List<Phone>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (context, index) => PhoneWidget(
                  phone: snapshot.data![index],
                  deleteClick: () {
                    _deletePhone(snapshot.data![index]);
                  },
                  editClick: () {
                    _editPhone(snapshot.data![index]);
                  },
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return const Center(
              child: Text('Brak telefonów w bazie'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
