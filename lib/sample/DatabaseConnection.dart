import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'Phone.dart';

class DatabaseConnection {
  static const dbFileName = 'phones.db';
  static const dbVersion = 1;
  static const createDbSql = 'CREATE TABLE phones'
      '(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'manufacturer VARCHAR(40) NOT NULL,'
      'model VARCHAR(40) NOT NULL,'
      'osVersion VARCHAR(10) NOT NULL,'
      'avatarFileName VARCHAR(60) NOT NULL)';

  static Future<Database> openPhonesDatabase() async {
    //openDatabase zwraca Future<DataBase>
    return openDatabase(
      // "join" z pakietu "path" zapewnia prawidłowe ścieżki dla każdej platformy
      Path.join(await getDatabasesPath(), dbFileName),
      onCreate: (db, version) {
        return db.execute(createDbSql);
      },
      // wersje umożliwiają upgrade/downgrade bazy
      version: dbVersion,
    );
  }

  // zwraca listę zawierającą wszystkie telefony
  static Future<List<Phone>> getPhones() async {
    final phoneDatabase = await openPhonesDatabase();

    final List<Map<String, dynamic>> allPhones =
        await phoneDatabase.query('phones');
    // konwertuje List<Map<String, dynamic> z bazy na List<Word>.
    if (allPhones != null) {
      return List.generate(allPhones.length, (i) {
        return Phone(
            id: allPhones[i]['id'],
            manufacturer: allPhones[i]['manufacturer'],
            model: allPhones[i]['mdoel'],
            osVersion: allPhones[i]['osVersion'],
            avatarFileName: allPhones[i]['avatarFileName']);
      });
    }
    return [];
  }

  // dodaje telefon do bazy
  static Future<int> insertPhone (Phone phone) async {
    final phoneDatabase = await openPhonesDatabase();
    final newItemId = await phoneDatabase.insert(
      'phones',
      phone.toMapNoId(),
      //rekord = mapa gdzie klucz to nazwa kolumny, a wartość to...
      //wartość
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return newItemId;
  }

  static Future<int> updatePhone (Phone phone) async {
    final phoneDatabase = await openPhonesDatabase();
    final updatedCount = await phoneDatabase.update(
      'phones',
      phone.toMap(),
      where: 'id = ?',
      //użycie whereArgs zabezpiecza przed SQLIncjection
      whereArgs: [phone.id],
    );
    return updatedCount;
  }
  // usuwanie słowa z bazy
  static Future<int> deletePhone (int id) async {
    final phoneDatabase = await openPhonesDatabase();
    final deletedCount = await phoneDatabase.delete(
      'phones',
      where: 'id = ?',
      //użycie whereArgs zabezpiecza przed SQLIncjection
      whereArgs: [id],
    );
    return deletedCount;
  }
}

/*
  Napisz klasę zawierającą metody do obsługi bazy danych bazującej na klasie z zadania 3.1.
  Muszą istnieć metody do:
   dodawania nowego telefonu do bazy,
   modyfikacji istniejącego telefonu w bazie,
   usuwania telefonu z bazy,
   usuwania wszystkich telefonów z bazy,
   odczytania danych pojedynczego telefonu z bazy,
   odczytania listy wszystkich telefonów z bazy.
*/
