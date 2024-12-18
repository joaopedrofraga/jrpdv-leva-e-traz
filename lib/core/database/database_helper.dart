import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _singleton = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _singleton;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'database.db');

    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `codigo` varchar(16) NOT NULL DEFAULT '',
  `nome` varchar(60) NOT NULL DEFAULT '',
  `fantasia` varchar(60) NOT NULL DEFAULT '',
  `endereco` varchar(50) NOT NULL DEFAULT '', 
  `bairro` varchar(30) NOT NULL DEFAULT '', 
  `cidade` varchar(35) NOT NULL DEFAULT '', 
  `cep` varchar(9) NOT NULL DEFAULT '', 
  `cnpj_cpf` varchar(18) NOT NULL DEFAULT '', 
  `fone` varchar(26) NOT NULL DEFAULT '',
  `celular` varchar(18) NOT NULL DEFAULT '', 
  `numender` varchar(15) NOT NULL DEFAULT '0',
  `complemento` varchar(255) NOT NULL DEFAULT '', 
  PRIMARY KEY (`id`),
  KEY `Codigo` (`codigo`),
  KEY `Nome` (`nome`),
  KEY `CNPJ_CPF` (`cnpj_cpf`)
);

CREATE TABLE IF NOT EXISTS `produtos` (
  `codigoint` int(11) NOT NULL AUTO_INCREMENT,
  `codfabr` varchar(15) NOT NULL DEFAULT '',
  `descricao` varchar(150) NOT NULL DEFAULT '', 
  `venda` decimal(10,3) NOT NULL DEFAULT '0.000',
  `quantidade` decimal(12,3) NOT NULL DEFAULT '0.000', 
  PRIMARY KEY (`codigoint`),
  KEY `codfabr` (`codfabr`),
  KEY `Descricao` (`descricao`)
);

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` char(15) NOT NULL DEFAULT '',
  `senha` char(15) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS `visitas` (
  `codcliente` varchar(16) NOT NULL DEFAULT '',
  `diasemana` tinyint(1) NOT NULL DEFAULT '0'
);

    ''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
