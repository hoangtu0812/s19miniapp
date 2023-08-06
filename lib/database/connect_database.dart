import 'dart:developer';
import 'package:mysql_client/mysql_client.dart';

class Database {
  Future<MySQLConnection> openConnection() async {
    log("Connecting database...");
    final connection = await MySQLConnection.createConnection(
      host: "db4free.net",
      port: 3306,
      userName: "s19miniapp",
      password: "Ptu0812@",
      databaseName: "s19miniapp", // optional
    );
    await connection.connect();
    return connection;
  }

  Future<void> closeConnection(MySQLConnection connection) async {
    connection.close();
    log("Connection detroyesd");
  }
}
