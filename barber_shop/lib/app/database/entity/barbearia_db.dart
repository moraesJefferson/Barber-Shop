import 'package:flutter/widgets.dart';

class BarbeariaEntity {
  final String id;
  final String name;
  final String contato;
  final String cnpj;
  final String email;
  final String cep;
  final String logradouro;
  final String num;
  final String bairro;
  final String cidade;
  final String uf;
  final double posLat;
  final double posLong;

  BarbeariaEntity({
    @required this.id,
    this.name,
    this.contato,
    this.cnpj,
    this.email,
    this.cep,
    this.logradouro,
    this.num,
    this.bairro,
    this.cidade,
    this.uf,
    this.posLat,
    this.posLong,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contato': contato,
      'cnpj': cnpj,
      'email': email,
      'cep': cep,
      'logradouro': logradouro,
      'num': num,
      'bairro': bairro,
      'cidade': cidade,
      'uf': uf,
      'posLat': posLat,
      'posLong': posLong,
    };
  }

  factory BarbeariaEntity.fromJson(Map<String, dynamic> json) =>
      BarbeariaEntity(
        id: json['id'],
        name: json['name'],
        contato: json['contato'],
        cnpj: json['cnpj'],
        email: json['email'],
        cep: json['cep'],
        logradouro: json['logradouro'],
        num: json['num'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        uf: json['uf'],
        posLat: json['posLat'],
        posLong: json['posLong'],
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BarbeariaEntity &&
        other.id == id &&
        other.name == name &&
        other.contato == contato &&
        other.cnpj == cnpj &&
        other.email == email &&
        other.cep == cep &&
        other.logradouro == logradouro &&
        other.num == num &&
        other.bairro == bairro &&
        other.cidade == cidade &&
        other.uf == uf &&
        other.posLat == posLat &&
        other.posLong == posLong;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        contato.hashCode ^
        cnpj.hashCode ^
        email.hashCode ^
        cep.hashCode ^
        logradouro.hashCode ^
        num.hashCode ^
        bairro.hashCode ^
        cidade.hashCode ^
        uf.hashCode ^
        posLat.hashCode ^
        posLong.hashCode;
  }
}
