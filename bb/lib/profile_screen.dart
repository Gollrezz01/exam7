import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User? _user;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _nameController = TextEditingController();
    _loadUserData();
  }

  // Загружаем данные пользователя из Firestore
  void _loadUserData() {
    if (_user != null) {
      _firestore.collection('users').doc(_user!.uid).get().then((docSnapshot) {
        if (docSnapshot.exists) {
          _nameController.text = docSnapshot.data()?['name'] ?? _user!.displayName ?? '';
        }
      });
    }
  }

  // Обновление данных пользователя
  void _updateUserData() {
    if (_user != null) {
      _firestore.collection('users').doc(_user!.uid).update({
        'name': _nameController.text,
      }).then((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      });
    }
  }

  // Выход из аккаунта
  void _signOut() async {
    await _auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');  // Переход на экран входа
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: _signOut,
          ),
        ],
      ),
      body: _user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Welcome, ${_user!.displayName ?? 'User'}'),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateUserData,
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
    );
  }
}
