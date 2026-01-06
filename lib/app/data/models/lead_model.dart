import 'package:uuid/uuid.dart';

enum LeadStatus {
  newLead,
  contacted,
  interested,
  notInterested,
  converted,
}

class LeadModel {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? source;
  final LeadStatus status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  LeadModel({
    String? id,
    required this.name,
    required this.phone,
    this.email,
    this.source,
    this.status = LeadStatus.newLead,
    this.notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  LeadModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? source,
    LeadStatus? status,
    String? notes,
    DateTime? updatedAt,
  }) {
    return LeadModel(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      source: source ?? this.source,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'source': source,
      'status': status.index,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return LeadModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      source: json['source'],
      status: LeadStatus.values[json['status'] ?? 0],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  String get statusText {
    switch (status) {
      case LeadStatus.newLead:
        return 'status_new';
      case LeadStatus.contacted:
        return 'status_contacted';
      case LeadStatus.interested:
        return 'status_interested';
      case LeadStatus.notInterested:
        return 'status_not_interested';
      case LeadStatus.converted:
        return 'status_converted';
    }
  }
}
