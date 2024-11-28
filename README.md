# Teste Técnico

Este repositório é a implementação do teste técnico do desafio Mobile BeTalent.

## Sobre o projeto

O projeto é a simples implementação do mock providenciado no desafio. 

<img src="./screenshots/home_page.png?raw=true" alt="Screenshot from home page" width="200"/>

O projeto está organizado entre 7 pastas:
- `bloc`: contém os Cubits e States criados para o gerenciamento de estados do app utilizando BLoC;
- `constants`: contém as constantes definidas para cores e tipografia do app;
- `models`: contém os models definidos no app;
- `pages`: contém as telas definidas no app;
- `repository`: contém a Interface do repositório do app, assim como sua implementação;
- `utils`: contém classes, extensões e métodos utilitários utilizadas no app;
- `widgets`: contém todos widgets implementados no app.


## Rodando o projeto

### Executando a API simulada
Para ter acesso aos dados que alimentarão o projeto, faça o seguinte:
1. caso você não tenha: para Node.js, instale o pacote json-server; para Dart, instale o pacote json_rest_server;
2. clone este repositório do GitHub: https://github.com/BeMobile/desafio-mobile;
3. execute o comando para iniciar a API simulada.

É necessário deixar a API simulada rodando no terminal para que os dados sejam visualizados no projeto.

### Configurando a URL da API
A url da API simulada (ou real) pode variar. Quando estiver rodando em localhost e utilizar um emulador android, o endereço deve ser igual a `http://10.0.2.2:3000/`.

Para configurar a url corretamente, basta alterar o valor definido em `lib/utils/api_utils.dart`:
```dart
abstract class ApiUtils {
  static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  static const baseUrl = 'http://10.0.2.2:3000/'; // alterar aqui
}
```

### Executando o app
Para rodar o aplicativo, basta instalar as dependências necessárias e executar o app.
```
flutter pub get
flutter run
```

### Rodando os testes
O projeto possui testes unitários para os métodos do repistório. Para executá-los, basta rodar:
```
flutter test
```