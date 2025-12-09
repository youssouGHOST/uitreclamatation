/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Absence type in your schema. */
class Absence extends amplify_core.Model {
  static const classType = const _AbsenceModelType();
  final String id;
  final Etudiant? _etudiant;
  final Status? _status;
  final amplify_core.TemporalDateTime? _dateAbsence;
  final String? _justificationUrl;
  final String? _module;
  final String? _commentaire;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AbsenceModelIdentifier get modelIdentifier {
      return AbsenceModelIdentifier(
        id: id
      );
  }
  
  Etudiant? get etudiant {
    return _etudiant;
  }
  
  Status get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get dateAbsence {
    return _dateAbsence;
  }
  
  String? get justificationUrl {
    return _justificationUrl;
  }
  
  String? get module {
    return _module;
  }
  
  String? get commentaire {
    return _commentaire;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Absence._internal({required this.id, etudiant, required status, dateAbsence, justificationUrl, module, commentaire, createdAt, updatedAt}): _etudiant = etudiant, _status = status, _dateAbsence = dateAbsence, _justificationUrl = justificationUrl, _module = module, _commentaire = commentaire, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Absence({String? id, Etudiant? etudiant, required Status status, amplify_core.TemporalDateTime? dateAbsence, String? justificationUrl, String? module, String? commentaire, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return Absence._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      etudiant: etudiant,
      status: status,
      dateAbsence: dateAbsence,
      justificationUrl: justificationUrl,
      module: module,
      commentaire: commentaire,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Absence &&
      id == other.id &&
      _etudiant == other._etudiant &&
      _status == other._status &&
      _dateAbsence == other._dateAbsence &&
      _justificationUrl == other._justificationUrl &&
      _module == other._module &&
      _commentaire == other._commentaire &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Absence {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("etudiant=" + (_etudiant != null ? _etudiant!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("dateAbsence=" + (_dateAbsence != null ? _dateAbsence!.format() : "null") + ", ");
    buffer.write("justificationUrl=" + "$_justificationUrl" + ", ");
    buffer.write("module=" + "$_module" + ", ");
    buffer.write("commentaire=" + "$_commentaire" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Absence copyWith({Etudiant? etudiant, Status? status, amplify_core.TemporalDateTime? dateAbsence, String? justificationUrl, String? module, String? commentaire, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return Absence._internal(
      id: id,
      etudiant: etudiant ?? this.etudiant,
      status: status ?? this.status,
      dateAbsence: dateAbsence ?? this.dateAbsence,
      justificationUrl: justificationUrl ?? this.justificationUrl,
      module: module ?? this.module,
      commentaire: commentaire ?? this.commentaire,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Absence copyWithModelFieldValues({
    ModelFieldValue<Etudiant?>? etudiant,
    ModelFieldValue<Status>? status,
    ModelFieldValue<amplify_core.TemporalDateTime?>? dateAbsence,
    ModelFieldValue<String?>? justificationUrl,
    ModelFieldValue<String?>? module,
    ModelFieldValue<String?>? commentaire,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt
  }) {
    return Absence._internal(
      id: id,
      etudiant: etudiant == null ? this.etudiant : etudiant.value,
      status: status == null ? this.status : status.value,
      dateAbsence: dateAbsence == null ? this.dateAbsence : dateAbsence.value,
      justificationUrl: justificationUrl == null ? this.justificationUrl : justificationUrl.value,
      module: module == null ? this.module : module.value,
      commentaire: commentaire == null ? this.commentaire : commentaire.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  Absence.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _etudiant = json['etudiant'] != null
        ? json['etudiant']['serializedData'] != null
          ? Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']['serializedData']))
          : Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']))
        : null,
      _status = amplify_core.enumFromString<Status>(json['status'], Status.values),
      _dateAbsence = json['dateAbsence'] != null ? amplify_core.TemporalDateTime.fromString(json['dateAbsence']) : null,
      _justificationUrl = json['justificationUrl'],
      _module = json['module'],
      _commentaire = json['commentaire'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'etudiant': _etudiant?.toJson(), 'status': amplify_core.enumToString(_status), 'dateAbsence': _dateAbsence?.format(), 'justificationUrl': _justificationUrl, 'module': _module, 'commentaire': _commentaire, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'etudiant': _etudiant,
    'status': _status,
    'dateAbsence': _dateAbsence,
    'justificationUrl': _justificationUrl,
    'module': _module,
    'commentaire': _commentaire,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AbsenceModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AbsenceModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ETUDIANT = amplify_core.QueryField(
    fieldName: "etudiant",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Etudiant'));
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final DATEABSENCE = amplify_core.QueryField(fieldName: "dateAbsence");
  static final JUSTIFICATIONURL = amplify_core.QueryField(fieldName: "justificationUrl");
  static final MODULE = amplify_core.QueryField(fieldName: "module");
  static final COMMENTAIRE = amplify_core.QueryField(fieldName: "commentaire");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Absence";
    modelSchemaDefinition.pluralName = "Absences";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Operateurs" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["etudiantId"], name: "byEtudiantAbsence")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Absence.ETUDIANT,
      isRequired: false,
      targetNames: ['etudiantId'],
      ofModelName: 'Etudiant'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.DATEABSENCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.JUSTIFICATIONURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.MODULE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.COMMENTAIRE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Absence.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _AbsenceModelType extends amplify_core.ModelType<Absence> {
  const _AbsenceModelType();
  
  @override
  Absence fromJson(Map<String, dynamic> jsonData) {
    return Absence.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Absence';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Absence] in your schema.
 */
class AbsenceModelIdentifier implements amplify_core.ModelIdentifier<Absence> {
  final String id;

  /** Create an instance of AbsenceModelIdentifier using [id] the primary key. */
  const AbsenceModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'AbsenceModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AbsenceModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}