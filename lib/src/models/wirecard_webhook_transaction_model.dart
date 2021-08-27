import 'dart:convert';

import '../enums/status_pagamento_enum.dart';
import '../enums/tipo_pagamento_enum.dart';

export '../enums/status_pagamento_enum.dart';
export '../enums/tipo_pagamento_enum.dart';

class WirecardWebhookTransactionModel {
  ///### Identificador da transação informado por você para controle em seu site
  final String? idTransacao;

  ///### Valor do pagamento, sem vírgulas, com casas decimais
  ///
  ///Exemplo: R$20,00 = 2000
  final int? valor;

  ///### Codigo informando o status atual da transação _(veja Anexo A)_
  ///
  ///![image](https://user-images.githubusercontent.com/16373553/130837534-ddcbb17f-ee8d-41e8-8582-e8beb34336f4.png)
  final int? statusPagamento;

  ///### Código da transação no ambiente MoIP. Valor único gerado pelo MoIP.
  final int? codMoip;

  ///### Codigo informando a forma de pagamento escolhida pelo pagador
  ///**Atenção:** recomendamos que você utilize o campo `tipoPagamento` para tratar o tipo de pagamento escolhido pelo pagador, pois novas formas de pagamentos podem ser constante adicionadas ao MoIP.
  ///
  ///Caso você tenha a necessidade de saber especificamente qual cartão de crédito foi utilizado no pagamento (Visa ou Amex, por exemplo), envie um e-mail para suporte@moip.com.br, pedindo os dados desse anexo.
  final int? formaPagamento;

  ///### Tipo de pagamento utilizado, descritivo, em formato de texto _(veja Anexo C)_
  ///![image](https://user-images.githubusercontent.com/16373553/130840129-6994fbb8-6df2-42fa-9a17-39c173e26c1e.png)
  final String? tipoPagamento;

  ///### E-mail informado pelo pagador, no MoIP
  final String? emailConsumidor;

  StatusPagamentoEnum? get statusPagamentoEnum => StatusPagamentoEnumType.fromMap(statusPagamento);
  TipoPagamentoEnum? get tipoPagamentoEnum => TipoPagamentoEnumType.fromMap(tipoPagamento);

  ///### Modelo recebido no webhook de atualização de transações
  /// - Manual: https://www.moip.com.br/AdmTransactionManual.do
  ///---
  ///### idTransacao
  ///Identificador da transação informado por você para controle em seu site
  ///
  ///---
  ///
  ///### valor
  ///Valor do pagamento, sem vírgulas, com casas decimais
  ///
  ///Exemplo: R$20,00 = 2000
  ///
  ///---
  ///
  ///### statusPagamento
  ///Codigo informando o status atual da transação _(veja Anexo A)_
  ///
  ///---
  ///
  ///### codMoip
  ///Código da transação no ambiente MoIP. Valor único gerado pelo MoIP.
  ///
  ///---
  ///
  ///### formaPagamento
  ///Codigo informando a forma de pagamento escolhida pelo pagador
  ///
  ///**Atenção:** recomendamos que você utilize o campo `tipoPagamento` para tratar o tipo de pagamento escolhido pelo pagador, pois novas formas de pagamentos podem ser constante adicionadas ao MoIP.
  ///
  ///Caso você tenha a necessidade de saber especificamente qual cartão de crédito foi utilizado no pagamento (Visa ou Amex, por exemplo), envie um e-mail para suporte@moip.com.br, pedindo os dados desse anexo.
  ///
  ///---
  ///
  ///### tipoPagamento
  ///Tipo de pagamento utilizado, descritivo, em formato de texto _(veja Anexo C)_
  ///
  ///---
  ///
  ///### Anexos
  ///![image](https://user-images.githubusercontent.com/16373553/130837534-ddcbb17f-ee8d-41e8-8582-e8beb34336f4.png)
  ///![image](https://user-images.githubusercontent.com/16373553/130840129-6994fbb8-6df2-42fa-9a17-39c173e26c1e.png)
  WirecardWebhookTransactionModel({
    required this.idTransacao,
    required this.valor,
    required this.statusPagamento,
    required this.codMoip,
    required this.formaPagamento,
    required this.tipoPagamento,
    required this.emailConsumidor,
  });

  WirecardWebhookTransactionModel copyWith({
    String? idTransacao,
    int? valor,
    int? statusPagamento,
    int? codMoip,
    int? formaPagamento,
    String? tipoPagamento,
    String? emailConsumidor,
  }) {
    return WirecardWebhookTransactionModel(
      idTransacao: idTransacao ?? this.idTransacao,
      valor: valor ?? this.valor,
      statusPagamento: statusPagamento ?? this.statusPagamento,
      codMoip: codMoip ?? this.codMoip,
      formaPagamento: formaPagamento ?? this.formaPagamento,
      tipoPagamento: tipoPagamento ?? this.tipoPagamento,
      emailConsumidor: emailConsumidor ?? this.emailConsumidor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_transacao': idTransacao,
      'valor': valor,
      'status_pagamento': statusPagamento,
      'cod_moip': codMoip,
      'forma_pagamento': formaPagamento,
      'tipo_pagamento': tipoPagamento,
      'email_consumidor': emailConsumidor,
    };
  }

  factory WirecardWebhookTransactionModel.fromMap(Map<String, dynamic> map) {
    return WirecardWebhookTransactionModel(
      idTransacao: map['id_transacao'],
      valor: map['valor'],
      statusPagamento: map['status_pagamento'],
      codMoip: map['cod_moip'],
      formaPagamento: map['forma_pagamento'],
      tipoPagamento: map['tipo_pagamento'],
      emailConsumidor: map['email_consumidor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WirecardWebhookTransactionModel.fromJson(String source) => WirecardWebhookTransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WirecardTransactionModel(idTransacao: $idTransacao, valor: $valor, statusPagamento: $statusPagamento, codMoip: $codMoip, formaPagamento: $formaPagamento, tipoPagamento: $tipoPagamento, emailConsumidor: $emailConsumidor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WirecardWebhookTransactionModel &&
        other.idTransacao == idTransacao &&
        other.valor == valor &&
        other.statusPagamento == statusPagamento &&
        other.codMoip == codMoip &&
        other.formaPagamento == formaPagamento &&
        other.tipoPagamento == tipoPagamento &&
        other.emailConsumidor == emailConsumidor;
  }

  @override
  int get hashCode {
    return idTransacao.hashCode ^
        valor.hashCode ^
        statusPagamento.hashCode ^
        codMoip.hashCode ^
        formaPagamento.hashCode ^
        tipoPagamento.hashCode ^
        emailConsumidor.hashCode;
  }
}
