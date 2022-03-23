import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../lista_itens_categoria/lista_itens_categoria_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaItensWidget extends StatefulWidget {
  const ListaItensWidget({
    Key key,
    this.varIdParceiro,
    this.varFantasia,
    this.varIdCliente,
  }) : super(key: key);

  final int varIdParceiro;
  final String varFantasia;
  final int varIdCliente;

  @override
  _ListaItensWidgetState createState() => _ListaItensWidgetState();
}

class _ListaItensWidgetState extends State<ListaItensWidget> {
  ApiCallResponse response;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0138CE),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.varFantasia,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 16,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xF1F4F4F4),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FutureBuilder<ApiCallResponse>(
                  future: ListaCategoriasProdutoCall.call(
                    idParceiro: widget.varIdParceiro,
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
                    final listViewListaCategoriasProdutoResponse =
                        snapshot.data;
                    return Builder(
                      builder: (context) {
                        final categoriasProduto = getJsonField(
                              (listViewListaCategoriasProdutoResponse
                                      ?.jsonBody ??
                                  ''),
                              r'''$''',
                            )?.toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: categoriasProduto.length,
                          itemBuilder: (context, categoriasProdutoIndex) {
                            final categoriasProdutoItem =
                                categoriasProduto[categoriasProdutoIndex];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 305,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: InkWell(
                                            onTap: () async {
                                              // ChamaListaItensCategoria
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child:
                                                      ListaItensCategoriaWidget(
                                                    varIdCategoria:
                                                        getJsonField(
                                                      categoriasProdutoItem,
                                                      r'''$.id''',
                                                    ),
                                                    varIdParceiro:
                                                        widget.varIdParceiro,
                                                    varDescCategoria:
                                                        getJsonField(
                                                      categoriasProdutoItem,
                                                      r'''$.descricao''',
                                                    ).toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF2F2F2),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3,
                                                                        7,
                                                                        0,
                                                                        3),
                                                            child: Text(
                                                              getJsonField(
                                                                categoriasProdutoItem,
                                                                r'''$.descricao''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 5, 0),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_sharp,
                                                            color: Color(
                                                                0xFF030D31),
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FutureBuilder<ApiCallResponse>(
                                            future:
                                                ListaProdutosParceiroPorCategoriaCall
                                                    .call(
                                              idParceiro: widget.varIdParceiro,
                                              idCategoria: getJsonField(
                                                categoriasProdutoItem,
                                                r'''$.id''',
                                              ),
                                              limitar: 1,
                                              idCliente: 5,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final linhaProdutoListaProdutosParceiroPorCategoriaResponse =
                                                  snapshot.data;
                                              return Builder(
                                                builder: (context) {
                                                  final produtos = getJsonField(
                                                        (linhaProdutoListaProdutosParceiroPorCategoriaResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$''',
                                                      )?.toList() ??
                                                      [];
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                          produtos.length,
                                                          (produtosIndex) {
                                                        final produtosItem =
                                                            produtos[
                                                                produtosIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      5, 5, 5),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Container(
                                                              width: 180,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  1.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 0,
                                                                ),
                                                              ),
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
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              5,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                functions.getFotoProduto(getJsonField(
                                                                              produtosItem,
                                                                              r'''$.foto''',
                                                                            ).toString()),
                                                                            width:
                                                                                110,
                                                                            height:
                                                                                80,
                                                                            fit:
                                                                                BoxFit.contain,
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
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 160,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: MediaQuery.of(context).size.width,
                                                                                              height: 20,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                              child: AutoSizeText(
                                                                                                'R\$ ${getJsonField(
                                                                                                  produtosItem,
                                                                                                  r'''$.valor''',
                                                                                                ).toString()}',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: 100,
                                                                                              height: 20,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                  produtosItem,
                                                                                                  r'''$.unidade''',
                                                                                                ).toString(),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: 100,
                                                                                              height: 75,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                  produtosItem,
                                                                                                  r'''$.descricao''',
                                                                                                ).toString(),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 12,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      if ((functions.strToInt(getJsonField(
                                                                                            produtosItem,
                                                                                            r'''$.quantidade''',
                                                                                          ).toString())) ==
                                                                                          (functions.retornaNumero('0')))
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: 100,
                                                                                                  height: 40,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      response = await IncluirItemCarrinhoCall.call(
                                                                                                        idCliente: 5,
                                                                                                        idParceiro: widget.varIdParceiro,
                                                                                                        idProduto: getJsonField(
                                                                                                          produtosItem,
                                                                                                          r'''$.id''',
                                                                                                        ),
                                                                                                        quantidade: 1.0,
                                                                                                        unitario: 6.0,
                                                                                                        total: 6.0,
                                                                                                        entrega: 'S',
                                                                                                      );
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        MaterialPageRoute(
                                                                                                          builder: (context) => ListaItensWidget(
                                                                                                            varIdParceiro: widget.varIdParceiro,
                                                                                                            varFantasia: widget.varFantasia,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );

                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    text: 'Adicionar',
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 130,
                                                                                                      height: 40,
                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: Colors.white,
                                                                                                          ),
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Colors.transparent,
                                                                                                        width: 1,
                                                                                                      ),
                                                                                                      borderRadius: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if ((functions.strToInt(getJsonField(
                                                                                            produtosItem,
                                                                                            r'''$.quantidade''',
                                                                                          ).toString())) >
                                                                                          (functions.retornaNumero('0')))
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  width: MediaQuery.of(context).size.width,
                                                                                                  height: 50,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                                                                idParceiro: widget.varIdParceiro,
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
                                                                                                                idParceiro: widget.varIdParceiro,
                                                                                                                idCliente: widget.varIdCliente,
                                                                                                              );
                                                                                                            }
                                                                                                          },
                                                                                                        ),
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
                                                                                                              idParceiro: widget.varIdParceiro,
                                                                                                              idCliente: widget.varIdCliente,
                                                                                                              idProduto: getJsonField(
                                                                                                                produtosItem,
                                                                                                                r'''$.id''',
                                                                                                              ),
                                                                                                              quantidade: 1,
                                                                                                              tipo: '\'A\'',
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
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
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
