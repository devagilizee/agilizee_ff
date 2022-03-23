import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({Key key}) : super(key: key);

  @override
  _CarrinhoWidgetState createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0138CE),
        automaticallyImplyLeading: false,
        title: Text(
          'Carrinho',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<ApiCallResponse>(
            future: ListaParceirosCarrinhoCall.call(
              idCliente: 5,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final listViewListaParceirosCarrinhoResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final parceiros = getJsonField(
                        (listViewListaParceirosCarrinhoResponse?.jsonBody ??
                            ''),
                        r'''$''',
                      )?.toList() ??
                      [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: parceiros.length,
                    itemBuilder: (context, parceirosIndex) {
                      final parceirosItem = parceiros[parceirosIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF4F4F4),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        parceirosItem,
                                        r'''$.fantasia''',
                                      ).toString(),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF202538),
                                            fontSize: 15,
                                            lineHeight: 2.8,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FutureBuilder<ApiCallResponse>(
                                  future: ListaProdutosCarrinhoCall.call(
                                    idCliente: 5,
                                    idParceiro: getJsonField(
                                      parceirosItem,
                                      r'''$.id''',
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnListaProdutosCarrinhoResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final produtos = getJsonField(
                                              (columnListaProdutosCarrinhoResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$''',
                                            )?.toList() ??
                                            [];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              produtos.length, (produtosIndex) {
                                            final produtosItem =
                                                produtos[produtosIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2,
                                                                        2,
                                                                        2,
                                                                        2),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  Image.network(
                                                                functions
                                                                    .getFotoProduto(
                                                                        getJsonField(
                                                                  produtosItem,
                                                                  r'''$.foto''',
                                                                ).toString()),
                                                                width: 100,
                                                                height: 100,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2,
                                                                        2,
                                                                        2,
                                                                        2),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.68,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              60,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              produtosItem,
                                                                              r'''$.descricao''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            'Embalagem:${getJsonField(
                                                                              produtosItem,
                                                                              r'''$.embalagem''',
                                                                            ).toString()}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30,
                                                                              buttonSize: 46,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.minus,
                                                                                color: Color(0xFF95A1AC),
                                                                                size: 16,
                                                                              ),
                                                                              onPressed: () async {
                                                                                if ((functions.strToInt(getJsonField(
                                                                                      produtosItem,
                                                                                      r'''$.quantidade''',
                                                                                    ).toString())) >
                                                                                    (functions.retornaNumero('1'))) {
                                                                                  await EditarItemCarrinhoCall.call(
                                                                                    idParceiro: getJsonField(
                                                                                      parceirosItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    idCliente: 5,
                                                                                    idProduto: getJsonField(
                                                                                      produtosItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    quantidade: 1,
                                                                                    tipo: 'D',
                                                                                  );
                                                                                } else {
                                                                                  await ExcluiItemCarrinhoCall.call(
                                                                                    idProduto: getJsonField(
                                                                                      produtosItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    idParceiro: getJsonField(
                                                                                      parceirosItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    idCliente: 5,
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                                                              child: Container(
                                                                                width: 34,
                                                                                height: 34,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFDBE2E7),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      produtosItem,
                                                                                      r'''$.quantidade''',
                                                                                    ).toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Color(0xFF111417),
                                                                                          fontSize: 18,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30,
                                                                              buttonSize: 46,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.plus,
                                                                                color: Color(0xFF090F13),
                                                                                size: 16,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await EditarItemCarrinhoCall.call(
                                                                                  idParceiro: getJsonField(
                                                                                    parceirosItem,
                                                                                    r'''$.id''',
                                                                                  ),
                                                                                  idCliente: 5,
                                                                                  idProduto: getJsonField(
                                                                                    produtosItem,
                                                                                    r'''$.id''',
                                                                                  ),
                                                                                  quantidade: 1,
                                                                                  tipo: 'A',
                                                                                );
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) => NavBarPage(initialPage: 'Carrinho'),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                  child: Text(
                                                                                    '[Price]',
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Color(0xFF37649A),
                                                                                          fontSize: 18,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
