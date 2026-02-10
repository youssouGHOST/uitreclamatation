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


/** This is an auto generated class representing the Anomalies type in your schema. */
class Anomalies extends amplify_core.Model {
  static const classType = const _AnomaliesModelType();
  final String id;
  final Etudiant? _etudiant;
  final Anomalie? _anomalie;
  final String? _description;
  final Status? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AnomaliesModelIdentifier get modelIdentifier {
      return AnomaliesModelIdentifier(
        id: id
      );
  }
  
  Etudiant? get etudiant {
    return _etudiant;
  }
  
  Anomalie get anomalie {
    try {
      return _anomalie!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Anomalies._internal({required this.id, etudiant, required anomalie, description, required status, createdAt, updatedAt}): _etudiant = etudiant, _anomalie = anomalie, _description = description, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Anomalies({String? id, Etudiant? etudiant, required Anomalie anomalie, String? description, required Status status}) {
    return Anomalies._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      etudiant: etudiant,
      anomalie: anomalie,
      description: description,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Anomalies &&
      id == other.id &&
      _etudiant == other._etudiant &&
      _anomalie == other._anomalie &&
      _description == other._description &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Anomalies {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("etudiant=" + (_etudiant != null ? _etudiant!.toString() : "null") + ", ");
    buffer.write("anomalie=" + (_anomalie != null ? amplify_core.enumToString(_anomalie)! : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Anomalies copyWith({Etudiant? etudiant, Anomalie? anomalie, String? description, Status? status}) {
    return Anomalies._internal(
      id: id,
      etudiant: etudiant ?? this.etudiant,
      anomalie: anomalie ?? this.anomalie,
      description: description ?? this.description,
      status: status ?? this.status);
  }
  
  Anomalies copyWithModelFieldValues({
    ModelFieldValue<Etudiant?>? etudiant,
    ModelFieldValue<Anomalie>? anomalie,
    ModelFieldValue<String?>? description,
    ModelFieldValue<Status>? status
  }) {
    return Anomalies._internal(
      id: id,
      etudiant: etudiant == null ? this.etudiant : etudiant.value,
      anomalie: anomalie == null ? this.anomalie : anomalie.value,
      description: description == null ? this.description : description.value,
      status: status == null ? this.status : status.value
    );
  }
  
  Anomalies.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _etudiant = json['etudiant'] != null
        ? json['etudiant']['serializedData'] != null
          ? Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']['serializedData']))
          : Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']))
        : null,
      _anomalie = amplify_core.enumFromString<Anomalie>(json['anomalie'], Anomalie.values),
      _description = json['description'],
      _status = amplify_core.enumFromString<Status>(json['status'], Status.values),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'etudiant': _etudiant?.toJson(), 'anomalie': amplify_core.enumToString(_anomalie), 'description': _description, 'status': amplify_core.enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'etudiant': _etudiant,
    'anomalie': _anomalie,
    'description': _description,
    'status': _status,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AnomaliesModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AnomaliesModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ETUDIANT = amplify_core.QueryField(
    fieldName: "etudiant",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Etudiant'));
  static final ANOMALIE = amplify_core.QueryField(fieldName: "anomalie");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Anomalies";
    modelSchemaDefinition.pluralName = "Anomalies";
    
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
      amplify_core.ModelIndex(fields: const ["etudiantId"], name: "byEtudiant")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Anomalies.ETUDIANT,
      isRequired: false,
      targetNames: ['etudiantId'],
      ofModelName: 'Etudiant'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Anomalies.ANOMALIE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Anomalies.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Anomalies.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _AnomaliesModelType extends amplify_core.ModelType<Anomalies> {
  const _AnomaliesModelType();
  
  @override
  Anomalies fromJson(Map<String, dynamic> jsonData) {
    return Anomalies.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Anomalies';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Anomalies] in your schema.
 */
class AnomaliesModelIdentifier implements amplify_core.ModelIdentifier<Anomalies> {
  final String id;

  /** Create an instance of AnomaliesModelIdentifier using [id] the primary key. */
  const AnomaliesModelIdentifier({
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
  String toString() => 'AnomaliesModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AnomaliesModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}