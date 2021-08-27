///Sexo de quem está realizando o pagamento
enum PagadorSexoEnum {
  male,
  female
}

extension PagadorSexoEnumType on PagadorSexoEnum {
   String toMap() => this.toString().split('.').last[0].toUpperCase();
   static PagadorSexoEnum fromMap(String data) => data.toLowerCase() == 'm' ? PagadorSexoEnum.male : PagadorSexoEnum.female;
}