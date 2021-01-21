class Pessoa {
  
  String professorResponsavel;
  String nome;
  String email;
  int cpf;
  var dataAndHora = new DateTime.now();


  Pessoa(this.professorResponsavel, this.nome, this.email, this.cpf,
      this.dataAndHora);



  // _listaPessoas(){
  //   var list = new List<Pessoas>();
  //   list.add(Pessoas('Antonio', 'Carlos', 'carlos@gmail.com,', 78963214587, new DateTime(2020, 12, 5, 18, 56)));
  //   list.add(Pessoas('João', 'Pedro', 'pedro@gmail.com,', 78963214587, new DateTime(2020, 12, 5, 18, 56)));
  //   list.add(Pessoas('Matheus', 'Mayra', 'mayra@gmail.com,', 78963214587, new DateTime(2020, 12, 5, 18, 56)));
  //   list.add(Pessoas('Alberto', 'Eduardo', 'eduardo@gmail.com,', 78963214587, new DateTime(2020, 12, 5, 18, 56)));
  //   list.add(Pessoas('André', 'Luana', 'luana@gmail.com,', 78963214587, new DateTime(2020, 12, 5, 18, 56)));
  //   list.add(Pessoas('Luan', 'Marcos', 'marcos@gmail.com,', 78963214587, new DateTime(2020, 12, 5, 18, 56)));
  // }

}