import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String getLogoCliente(String imagePath) {
  const path = "http://agilizee.com.br/adm/";
  return path + imagePath;
}

String getFotoProduto(String imagePath) {
  const path = "http://agilizee.com.br/cliente/";
  return path + imagePath;
}

int retornaNumero(String numero) {
  return int.parse(numero);
}

double retornaTotalItem(
  double unitario,
  int quantidade,
) {
  return quantidade * unitario;
}

String formatTotalFloat(
  int quantidade,
  double preco,
) {
  double total = (preco * quantidade);
  return ("R\$ " + total.toStringAsFixed(2));
}

int strToInt(String strVar) {
  if (strVar != '[]') {
    return int.parse(strVar);
  }
  return 0;
}

String formatFloaToStr(double total) {
  return ("R\$ " + total.toStringAsFixed(2));
}
