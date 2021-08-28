import 'dart:convert';

import 'uuid_model.dart';
import 'wirecard_pagador_model.dart';

///### Para integrar o Wirecard com seu site, tudo o que você deve fazer é enviar esses dados ao MoIP, através de um POST HTML, para o endereço
///## https://www.moip.com.br/PagamentoMoIP.do
class WirecardRequestTransactionModel {
  ///Sua identificação no MoIP. Pode ser seu e-mail principal, celular verificado ou login.
  final String idCarteira;

  ///O valor da transação, sem vírgulas e identificador da moeda. R$41,00 = 4100
  final int valor;

  ///Razão do pagamento a ser mostrado na página do MoIP, durante o processo de confirmação (nome do produto/serviço)
  final String nome;

  ///Descrição do pagamento a ser mostrada na página MoIP, durante o processo de confirmação
  final String descricao;

  ///Identificador único da transação gerado pelo seu site
  final UuidModel idTransacao;

  ///Se o pagamento deve ter um frete adicionado ao valor total a ser pago
  ///
  ///1 -> adiciona frete ao pagamento
  final int? frete;

  ///Peso da soma dos produtos vendidos, em gramas (utilizado para calcular o frete pelos Correios)
  final int? pesoCompra;

  ///Dados do pagador (não obrigatório)
  final WirecardPagadorModel? pagador;
  WirecardRequestTransactionModel({
    required this.idCarteira,
    required this.valor,
    required this.nome,
    required this.descricao,
    required this.idTransacao,
    this.frete,
    this.pesoCompra,
    this.pagador,
  });

  WirecardRequestTransactionModel copyWith({
    String? idCarteira,
    int? valor,
    String? nome,
    String? descricao,
    UuidModel? idTransacao,
    int? frete,
    int? pesoCompra,
    WirecardPagadorModel? pagador,
  }) {
    return WirecardRequestTransactionModel(
      idCarteira: idCarteira ?? this.idCarteira,
      valor: valor ?? this.valor,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      idTransacao: idTransacao ?? this.idTransacao,
      frete: frete ?? this.frete,
      pesoCompra: pesoCompra ?? this.pesoCompra,
      pagador: pagador ?? this.pagador,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_carteira': idCarteira,
      'valor': valor,
      'nome': nome,
      'descricao': descricao,
      'id_transacao': idTransacao.toMap(),
      'frete': frete,
      'peso_compra': pesoCompra,
      if (pagador != null) ...pagador!.toMap(),
    };
  }

  factory WirecardRequestTransactionModel.fromMap(Map<String, dynamic> map) {
    return WirecardRequestTransactionModel(
      idCarteira: map['id_carteira'],
      valor: map['valor'] is String ? int.parse(map['valor']) : map['valor'],
      nome: map['nome'],
      descricao: map['descricao'],
      idTransacao: UuidModel.fromMap(map['id_transacao']),
      frete: map['frete'] is String ? int.parse(map['frete']) : map['frete'],
      pesoCompra: map['peso_compra'] is String ? int.parse(map['peso_compra']) : map['peso_compra'],
      pagador: WirecardPagadorModel.fromMap(map),
    );
  }

  String toJson() => json.encode(toMap());
  factory WirecardRequestTransactionModel.fromJson(String source) => WirecardRequestTransactionModel.fromMap(json.decode(source));

  String toQuery() => toMap().entries.where((e) => e.value != null).map((e) => '${e.key}=${e.value}').join('&');
  factory WirecardRequestTransactionModel.fromQuery(String source) {
    final entries = source.split('&').map((value) {
      final splittedValues = value.split('=');
      return MapEntry<String, dynamic>(splittedValues.first, splittedValues.last);
    });
    return WirecardRequestTransactionModel.fromMap(Map.fromEntries(entries));
  }

  @override
  String toString() {
    return 'WirecardRequestTransactionModel(idCarteira: $idCarteira, valor: $valor, nome: $nome, descricao: $descricao, idTransacao: $idTransacao, frete: $frete, pesoCompra: $pesoCompra, pagador: $pagador)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WirecardRequestTransactionModel &&
        other.idCarteira == idCarteira &&
        other.valor == valor &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.idTransacao == idTransacao &&
        other.frete == frete &&
        other.pesoCompra == pesoCompra &&
        other.pagador == pagador;
  }

  @override
  int get hashCode {
    return idCarteira.hashCode ^
        valor.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        idTransacao.hashCode ^
        frete.hashCode ^
        pesoCompra.hashCode ^
        pagador.hashCode;
  }
}
