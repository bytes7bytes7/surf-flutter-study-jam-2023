import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_id.freezed.dart';

@freezed
class TicketID with _$TicketID {
  const factory TicketID(String value) = _TicketID;

  const TicketID._();

  factory TicketID.generate() {
    return TicketID(Random().nextInt(100000).toString());
  }

  factory TicketID.fromString(String string) => TicketID(string);

  String get str => value;
}
