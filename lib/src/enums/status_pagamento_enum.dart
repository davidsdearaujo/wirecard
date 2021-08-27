///Status das transações no MoIP
enum StatusPagamentoEnum {
  ///Pagamento já foi realizado porém ainda não foi creditado na Carteira MoIP recebedora (devido ao floating da forma de pagamento)
  autorizado,

  ///Pagamento está sendo realizado ou janela do navegador foi fechada (pagamento abandonado)
  iniciado,

  ///Boleto foi impresso e ainda não foi pago
  boleto_impresso,

  ///Pagamento já foi realizado e dinheiro já foi creditado na Carteira MoIP recebedora
  concluido,

  ///Pagamento foi cancelado pelo pagador, instituição de pagamento, MoIP ou recebedor antes de ser concluído
  cancelado,

  ///Pagamento foi realizado com cartão de crédito e autorizado, porém está em análise pela Equipe MoIP. Não existe garantia de que será concluído
  em_analise,

  ///Pagamento foi estornado pelo pagador, recebedor, instituição de pagamento ou MoIP
  estornado,
}

extension StatusPagamentoEnumType on StatusPagamentoEnum {
  static const _values = <StatusPagamentoEnum, int>{
    StatusPagamentoEnum.autorizado: 1,
    StatusPagamentoEnum.iniciado: 2,
    StatusPagamentoEnum.boleto_impresso: 3,
    StatusPagamentoEnum.concluido: 4,
    StatusPagamentoEnum.cancelado: 5,
    StatusPagamentoEnum.em_analise: 6,
    StatusPagamentoEnum.estornado: 7,
  };
  static StatusPagamentoEnum? fromMap(int? val) {
    if (val == null) return null;
    return _values.entries
        .cast<MapEntry<StatusPagamentoEnum?, int?>>()
        .firstWhere((e) => e.value == val, orElse: () => MapEntry(null, null))
        .key;
  }

  int? toMap() => _values[this];
}
