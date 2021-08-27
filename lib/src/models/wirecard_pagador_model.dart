import 'dart:convert';

import '../enums/pagador_sexo_enum.dart';

class WirecardPagadorModel {
  ///Nome de quem está realizando o pagamento
  final String? nome;

  ///O endereço de e-mail de quem está realizando o pagamento
  final String? email;

  ///Número do telefone de quem está realizando o pagamento, sem separadores e com DDD
  final int? telefone;

  ///Logradouro de quem está realizando o pagamento
  final String? logradouro;

  ///Número do endereço de quem está realizando o pagamento
  final int? numero;

  ///Complemento do endereço de quem está realizando o pagamento
  final String? complemento;

  ///Bairro de quem está realizando o pagamento
  final String? bairro;

  ///CEP de quem está realizando o pagamento
  final int? cep;

  ///Cidade de quem está realizando o pagamento. Ex: São Paulo
  final String? cidade;

  ///Estado de quem está realizando o pagamento. Ex: SP
  final String? estado;

  ///País de quem está realizando o pagamento. Ex: Brasil
  final String? pais;

  ///CPF de quem está realizando o pagamento
  final int? cpf;

  ///Telefone celular de quem está realizando o pagamento
  final int? celular;

  ///Sexo de quem está realizando o pagamento
  final PagadorSexoEnum? sexo;

  ///Data de nascimento de quem está realizando o pagamento DDMMAAAA
  final int? dataNascimento;
  WirecardPagadorModel({
    this.nome,
    this.email,
    this.telefone,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cep,
    this.cidade,
    this.estado,
    this.pais,
    this.cpf,
    this.celular,
    this.sexo,
    this.dataNascimento,
  });

  WirecardPagadorModel copyWith({
    String? nome,
    String? email,
    int? telefone,
    String? logradouro,
    int? numero,
    String? complemento,
    String? bairro,
    int? cep,
    String? cidade,
    String? estado,
    String? pais,
    int? cpf,
    int? celular,
    PagadorSexoEnum? sexo,
    int? dataNascimento,
  }) {
    return WirecardPagadorModel(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cep: cep ?? this.cep,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      pais: pais ?? this.pais,
      cpf: cpf ?? this.cpf,
      celular: celular ?? this.celular,
      sexo: sexo ?? this.sexo,
      dataNascimento: dataNascimento ?? this.dataNascimento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pagador_nome': nome,
      'pagador_email': email,
      'pagador_telefone': telefone,
      'pagador_logradouro': logradouro,
      'pagador_numero': numero,
      'pagador_complemento': complemento,
      'pagador_bairro': bairro,
      'pagador_cep': cep,
      'pagador_cidade': cidade,
      'pagador_estado': estado,
      'pagador_pais': pais,
      'pagador_cpf': cpf,
      'pagador_celular': celular,
      'pagador_sexo': sexo?.toMap(),
      'pagador_data_nascimento': dataNascimento,
    };
  }

  factory WirecardPagadorModel.fromMap(Map<String, dynamic> map) {
    return WirecardPagadorModel(
      nome: map['pagador_nome'],
      email: map['pagador_email'],
      telefone: map['pagador_telefone'],
      logradouro: map['pagador_logradouro'],
      numero: map['pagador_numero'],
      complemento: map['pagador_complemento'],
      bairro: map['pagador_bairro'],
      cep: map['pagador_cep'],
      cidade: map['pagador_cidade'],
      estado: map['pagador_estado'],
      pais: map['pagador_pais'],
      cpf: map['pagador_cpf'],
      celular: map['pagador_celular'],
      sexo: PagadorSexoEnumType.fromMap(map['pagador_sexo']),
      dataNascimento: map['pagador_data_nascimento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WirecardPagadorModel.fromJson(String source) => WirecardPagadorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WirecardPagadorModel(nome: $nome, email: $email, telefone: $telefone, logradouro: $logradouro, numero: $numero, complemento: $complemento, bairro: $bairro, cep: $cep, cidade: $cidade, estado: $estado, pais: $pais, cpf: $cpf, celular: $celular, sexo: $sexo, dataNascimento: $dataNascimento)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WirecardPagadorModel &&
      other.nome == nome &&
      other.email == email &&
      other.telefone == telefone &&
      other.logradouro == logradouro &&
      other.numero == numero &&
      other.complemento == complemento &&
      other.bairro == bairro &&
      other.cep == cep &&
      other.cidade == cidade &&
      other.estado == estado &&
      other.pais == pais &&
      other.cpf == cpf &&
      other.celular == celular &&
      other.sexo == sexo &&
      other.dataNascimento == dataNascimento;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
      email.hashCode ^
      telefone.hashCode ^
      logradouro.hashCode ^
      numero.hashCode ^
      complemento.hashCode ^
      bairro.hashCode ^
      cep.hashCode ^
      cidade.hashCode ^
      estado.hashCode ^
      pais.hashCode ^
      cpf.hashCode ^
      celular.hashCode ^
      sexo.hashCode ^
      dataNascimento.hashCode;
  }
}
