

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../models/auth/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(String email, String password, String name, int age, String phoneNumber);
  Future<UserModel> login(String email, String password);
}
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.auth, this.firestore);

  @override
  Future<UserModel> register(String email, String password, String name, int age, String phoneNumber) async {
    final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = UserModel(
      uid: userCredential.user!.uid,
      email: email,
      name: name,
      age: age,
      phoneNumber: phoneNumber,
    );

    await firestore.collection('users').doc(user.uid).set(user.toJson());

    return user;
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final doc = await firestore.collection('users').doc(userCredential.user!.uid).get();
    return UserModel.fromJson(doc.data()!);
  }
}
