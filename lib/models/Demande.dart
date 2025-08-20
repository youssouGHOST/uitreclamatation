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


/** This is an auto generated class representing the Demande type in your schema. */
class Demande extends amplify_core.Model {
  static const classType = const _DemandeModelType();
  final String id;
  final TypeDemande? _typeDemande;
  final Status? _status;
  final String? _commentaire;
  final Etudiant? _etudiant;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  DemandeModelIdentifier get modelIdentifier {
      return DemandeModelIdentifier(
        id: id
      );
  }
  
  TypeDemande get typeDemande {
    try {
      return _typeDemande!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String? get commentaire {
    return _commentaire;
  }
  
  Etudiant? get etudiant {
    return _etudiant;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Demande._internal({required this.id, required typeDemande, required status, commentaire, etudiant, createdAt, updatedAt}): _typeDemande = typeDemande, _status = status, _commentaire = commentaire, _etudiant = etudiant, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Demande({String? id, required TypeDemande typeDemande, required Status status, String? commentaire, Etudiant? etudiant, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return Demande._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      typeDemande: typeDemande,
      status: status,
      commentaire: commentaire,
      etudiant: etudiant,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Demande &&
      id == other.id &&
      _typeDemande == other._typeDemande &&
      _status == other._status &&
      _commentaire == other._commentaire &&
      _etudiant == other._etudiant &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Demande {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("typeDemande=" + (_typeDemande != null ? amplify_core.enumToString(_typeDemande)! : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("commentaire=" + "$_commentaire" + ", ");
    buffer.write("etudiant=" + (_etudiant != null ? _etudiant!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Demande copyWith({TypeDemande? typeDemande, Status? status, String? commentaire, Etudiant? etudiant, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return Demande._internal(
      id: id,
      typeDemande: typeDemande ?? this.typeDemande,
      status: status ?? this.status,
      commentaire: commentaire ?? this.commentaire,
      etudiant: etudiant ?? this.etudiant,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Demande copyWithModelFieldValues({
    ModelFieldValue<TypeDemande>? typeDemande,
    ModelFieldValue<Status>? status,
    ModelFieldValue<String?>? commentaire,
    ModelFieldValue<Etudiant?>? etudiant,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt
  }) {
    return Demande._internal(
      id: id,
      typeDemande: typeDemande == null ? this.typeDemande : typeDemande.value,
      status: status == null ? this.status : status.value,
      commentaire: commentaire == null ? this.commentaire : commentaire.value,
      etudiant: etudiant == null ? this.etudiant : etudiant.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  Demande.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _typeDemande = amplify_core.enumFromString<TypeDemande>(json['typeDemande'], TypeDemande.values),
      _status = amplify_core.enumFromString<Status>(json['status'], Status.values),
      _commentaire = json['commentaire'],
      _etudiant = json['etudiant'] != null
        ? json['etudiant']['serializedData'] != null
          ? Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']['serializedData']))
          : Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'typeDemande': amplify_core.enumToString(_typeDemande), 'status': amplify_core.enumToString(_status), 'commentaire': _commentaire, 'etudiant': _etudiant?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'typeDemande': _typeDemande,
    'status': _status,
    'commentaire': _commentaire,
    'etudiant': _etudiant,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DemandeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DemandeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TYPEDEMANDE = amplify_core.QueryField(fieldName: "typeDemande");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final COMMENTAIRE = amplify_core.QueryField(fieldName: "commentaire");
  static final ETUDIANT = amplify_core.QueryField(
    fieldName: "etudiant",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Etudiant'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Demande";
    modelSchemaDefinition.pluralName = "Demandes";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Demande.TYPEDEMANDE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Demande.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Demande.COMMENTAIRE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Demande.ETUDIANT,
      isRequired: false,
      targetNames: ['etudiantId'],
      ofModelName: 'Etudiant'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Demande.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Demande.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DemandeModelType extends amplify_core.ModelType<Demande> {
  const _DemandeModelType();
  
  @override
  Demande fromJson(Map<String, dynamic> jsonData) {
    return Demande.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Demande';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Demande] in your schema.
 */
class DemandeModelIdentifier implements amplify_core.ModelIdentifier<Demande> {
  final String id;

  /** Create an instance of DemandeModelIdentifier using [id] the primary key. */
  const DemandeModelIdentifier({
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
  String toString() => 'DemandeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DemandeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}