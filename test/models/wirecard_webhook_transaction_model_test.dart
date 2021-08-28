import 'package:test/test.dart';
import 'package:wirecard/wirecard.dart';

void main() {
  late WirecardWebhookTransactionModel model;
  setUp(() {
    final mockRequest =
        'id_transacao=d4a10e402f2348fa8a353e576269be66&valor=1000&status_pagamento=2&status_data=2021%2F08%2F27-22%3A14%3A09&cod_moip=293474623&forma_pagamento=73&tipo_pagamento=BoletoBancario&parcelas=1&recebedor_login=deivao.dev%40outlook.com&email_consumidor=davidsdearaujo%40gmail.com';
    model = WirecardWebhookTransactionModel.fromQuery(mockRequest);
  });
  test('idTransacao', () => expect(model.idTransacao?.value, 'd4a10e40-2f23-48fa-8a35-3e576269be66'));
  test('statusPagamento', () => expect(model.statusPagamento, 2));
  test('statusPagamentoEnum', () => expect(model.statusPagamentoEnum, StatusPagamentoEnum.iniciado));
  test('codMoip', () => expect(model.codMoip, 293474623));
  test('formaPagamento', () => expect(model.formaPagamento, 73));
  test('tipoPagamento', () => expect(model.tipoPagamento, 'BoletoBancario'));
  test('tipoPagamentoEnum', () => expect(model.tipoPagamentoEnum, TipoPagamentoEnum.BoletoBancario));
}
