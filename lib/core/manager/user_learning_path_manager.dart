import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserLearningPathHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'learning_path.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE learning_path (
          id INTEGER PRIMARY KEY,
          levelNumber INTEGER,
          progressStatus INTEGER,
          trackResourceId INTEGER,
          url TEXT,
          title TEXT,
          level TEXT,
          language TEXT,
          typeOfContent TEXT,
          estimatedDuration INTEGER
        )
      ''');

        await db.execute('''
        CREATE TABLE lesson (
          id INTEGER PRIMARY KEY,
          lessonNumber INTEGER,
          title TEXT,
          url TEXT,
          estimatedDuration INTEGER,
          pathId INTEGER,
          FOREIGN KEY(pathId) REFERENCES learning_path(id)
        )
      ''');

        await db.execute('''
        CREATE TABLE quiz (
          id INTEGER PRIMARY KEY,
          title TEXT,
          createdAt TEXT,
          isCompleted INTEGER,
          pathId INTEGER,
          FOREIGN KEY(pathId) REFERENCES learning_path(id)
        )
      ''');

        await db.execute('''
        CREATE TABLE question (
          id INTEGER PRIMARY KEY,
          text TEXT,
          quizId INTEGER,
          FOREIGN KEY(quizId) REFERENCES quiz(id)
        )
      ''');

        await db.execute('''
        CREATE TABLE answer (
          id INTEGER PRIMARY KEY,
          text TEXT,
          isCorrect INTEGER,
          questionId INTEGER,
          FOREIGN KEY(questionId) REFERENCES question(id)
        )
      ''');
      },
    );
  }

  // Insert Learning Path
  static Future<void> insertLearningPath(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      'learning_path',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert Lesson
  static Future<void> insertLesson(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      'lesson',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert Quiz
  static Future<void> insertQuiz(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('quiz', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Insert Question
  static Future<void> insertQuestion(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      'question',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert Answer
  static Future<void> insertAnswer(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      'answer',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get All Learning Paths
  static Future<List<Map<String, dynamic>>> getAllLearningPaths() async {
    final db = await database;
    return await db.query('learning_path');
  }

  // Get Lessons by Path ID
  static Future<List<Map<String, dynamic>>> getLessonsByPathId(
    int pathId,
  ) async {
    final db = await database;
    return await db.query('lesson', where: 'pathId = ?', whereArgs: [pathId]);
  }

  // Get Quiz by Path ID
  static Future<List<Map<String, dynamic>>> getQuizByPathId(int pathId) async {
    final db = await database;
    return await db.query('quiz', where: 'pathId = ?', whereArgs: [pathId]);
  }

  // Get Questions by Quiz ID
  static Future<List<Map<String, dynamic>>> getQuestionsByQuizId(
    int quizId,
  ) async {
    final db = await database;
    return await db.query('question', where: 'quizId = ?', whereArgs: [quizId]);
  }

  // Get Answers by Question ID
  static Future<List<Map<String, dynamic>>> getAnswersByQuestionId(
    int questionId,
  ) async {
    final db = await database;
    return await db.query(
      'answer',
      where: 'questionId = ?',
      whereArgs: [questionId],
    );
  }

  // Delete all data (for development or reset)
  static Future<void> clearAllTables() async {
    final db = await database;
    await db.delete('answer');
    await db.delete('question');
    await db.delete('quiz');
    await db.delete('lesson');
    await db.delete('learning_path');
  }
}
