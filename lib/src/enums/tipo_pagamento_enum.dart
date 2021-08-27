///Status das transações no MoIP
enum TipoPagamentoEnum {
  ///Débito em conta no domicilio bancário do pagador
  DebitoBancario,

  ///Financiamento obtido junto ao domicílio bancário do pagador e o montante total debitado diretamente da conta e creditado na Carteira MoIP do recebedor
  FinanciamentoBancario,

  ///Boleto bancário impresso pelo pagador
  BoletoBancario,

  ///Boleto bancário impresso pelo pagador
  CartaoDeCredito,

  ///Cartão de débito Visa Electron (apenas para correntistas do Bradesco)
  CartaoDeDebito,

  ///Diretamente da Carteira MoIP do pagador
  CarteiraMoIP,

  ///Ainda não definida pelo pagador
  NaoDefinida,
}

extension TipoPagamentoEnumType on TipoPagamentoEnum {
  static const _values = <TipoPagamentoEnum, String>{
    TipoPagamentoEnum.DebitoBancario: 'DebitoBancario',
    TipoPagamentoEnum.FinanciamentoBancario: 'FinanciamentoBancario',
    TipoPagamentoEnum.BoletoBancario: 'BoletoBancario',
    TipoPagamentoEnum.CartaoDeCredito: 'CartaoDeCredito',
    TipoPagamentoEnum.CartaoDeDebito: 'CartaoDeDebito',
    TipoPagamentoEnum.CarteiraMoIP: 'CarteiraMoIP',
    TipoPagamentoEnum.NaoDefinida: 'NaoDefinida',
  };
  static TipoPagamentoEnum? fromMap(String? val) {
    if (val == null) return null;
    return _values.entries
        .cast<MapEntry<TipoPagamentoEnum?, String?>>()
        .firstWhere((e) => e.value == val, orElse: () => MapEntry(null, null))
        .key;
  }

  String? toMap() => _values[this];
}
