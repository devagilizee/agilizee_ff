import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class ListCategoriasParceirosCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ListCategoriasParceiros',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/categorias_parceiro',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class ListaParceirosPorCategoriaCall {
  static Future<ApiCallResponse> call({
    String categoria = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaParceirosPorCategoria',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/parceiros/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'categoria': categoria,
      },
      returnBody: true,
    );
  }
}

class ListaCategoriasProdutoCall {
  static Future<ApiCallResponse> call({
    int idParceiro,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaCategoriasProduto',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/categorias_produto/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idParceiro': idParceiro,
      },
      returnBody: true,
    );
  }
}

class ListaProdutosParceiroPorCategoriaCall {
  static Future<ApiCallResponse> call({
    int idParceiro,
    int idCategoria,
    int limitar = 1,
    int idCliente,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaProdutosParceiroPorCategoria',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/produtos/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idParceiro': idParceiro,
        'idCategoria': idCategoria,
        'limitar': limitar,
        'idCliente': idCliente,
      },
      returnBody: true,
    );
  }
}

class ListaItemCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idCliente,
    int idParceiro,
    int idProduto,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaItemCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idCliente': idCliente,
        'idParceiro': idParceiro,
        'idProduto': idProduto,
      },
      returnBody: true,
    );
  }
}

class ListaParceirosCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idCliente,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaParceirosCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/parceiros/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idCliente': idCliente,
      },
      returnBody: true,
    );
  }
}

class ListaProdutosCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idCliente,
    int idParceiro,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaProdutosCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/produtos/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idCliente': idCliente,
        'idParceiro': idParceiro,
      },
      returnBody: true,
    );
  }

  static dynamic foto(dynamic response) => getJsonField(
        response,
        r'''$.foto''',
      );
}

class VerificaProdutoAdicionadoCall {
  static Future<ApiCallResponse> call({
    int idCliente,
    int idParceiro,
    int idProduto,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verificaProdutoAdicionado',
      apiUrl:
          'https://agilizee-api-node.herokuapp.com/carrinho/produto_existe/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idCliente': idCliente,
        'idParceiro': idParceiro,
        'idProduto': idProduto,
      },
      returnBody: true,
    );
  }
}

class EditarItemCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idParceiro,
    int idCliente,
    int idProduto,
    int quantidade,
    String tipo = '',
  }) {
    final body = '''
{
  "idParceiro": ${idParceiro},
  "idCliente": ${idCliente},
  "idProduto": ${idProduto},
  "quantidade": ${quantidade},
  "tipo": "${tipo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditarItemCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/IncDec',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'idParceiro': idParceiro,
        'idCliente': idCliente,
        'idProduto': idProduto,
        'quantidade': quantidade,
        'tipo': tipo,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class IncluirItemCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idCliente,
    int idParceiro,
    int idProduto,
    double quantidade,
    double unitario,
    double total,
    String entrega = '',
  }) {
    final body = '''
{
  "idCliente": ${idCliente},
  "idParceiro": ${idParceiro},
  "entrega": "${entrega}",
  "idProduto": ${idProduto},
  "quantidade": ${quantidade},
  "unitario": ${unitario},
  "total": ${total}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'IncluirItemCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'idCliente': idCliente,
        'idParceiro': idParceiro,
        'idProduto': idProduto,
        'quantidade': quantidade,
        'unitario': unitario,
        'total': total,
        'entrega': entrega,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ExcluiItemCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idProduto,
    int idParceiro,
    int idCliente,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ExcluiItemCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'idProduto': idProduto,
        'idParceiro': idParceiro,
        'idCliente': idCliente,
      },
      returnBody: true,
    );
  }
}

class ListaTotalParceiroCall {
  static Future<ApiCallResponse> call({
    int idCliente,
    int idParceiro,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'listaTotalParceiro',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/totalParceiro/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idCliente': idCliente,
        'idParceiro': idParceiro,
      },
      returnBody: true,
    );
  }

  static dynamic lista(dynamic response) => getJsonField(
        response,
        r'''$[0].total''',
      );
}

class ListaTotalCarrinhoCall {
  static Future<ApiCallResponse> call({
    int idCliente,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListaTotalCarrinho',
      apiUrl: 'https://agilizee-api-node.herokuapp.com/carrinho/totalCarrinho/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'idCliente': idCliente,
      },
      returnBody: true,
    );
  }

  static dynamic subtotal(dynamic response) => getJsonField(
        response,
        r'''$[0].subtotal''',
      );
  static dynamic taxaEntrega(dynamic response) => getJsonField(
        response,
        r'''$[0].taxa_entrega''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$[0].total''',
      );
}
