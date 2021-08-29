import 'package:flutter/material.dart';

class Usuario {
  final String id;
  final String name;
  final String cpf;
  final String email;

  Usuario({@required this.id, this.name, this.cpf, this.email});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        name: json['name'],
        cpf: json['cpf'],
        email: json['email']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'cpf': cpf, 'email': email};
  }
}
