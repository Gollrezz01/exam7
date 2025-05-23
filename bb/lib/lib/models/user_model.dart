// user_model.dart

enum UserStatus { active, inactive, banned }

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthDate;
  final UserStatus status;
  final DateTime createdAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.status,
    required this.createdAt,
  });

  // Метод для обновления статуса пользователя
  User copyWith({UserStatus? status}) {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      birthDate: birthDate,
      status: status ?? this.status,
      createdAt: createdAt,
    );
  }

  // Преобразование объекта в карту для сохранения в базе данных или передачи
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'birthDate': birthDate.toIso8601String(),
      'status': status.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Преобразование карты обратно в объект User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      birthDate: DateTime.parse(map['birthDate']),
      status: UserStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
      ),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $firstName $lastName, email: $email, status: $status}';
  }
}
