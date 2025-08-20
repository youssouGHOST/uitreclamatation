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


/** This is an auto generated class representing the Operateur type in your schema. */
class Operateur extends amplify_core.Model {
  static const classType = const _OperateurModelType();
  final String id;
  final String? _nom;
  final String? _prenom;
  final String? _email;
  final Filiere? _filiere;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OperateurModelIdentifier get modelIdentifier {
      return OperateurModelIdentifier(
        id: id
      );
  }
  
  String get nom {
    try {
      return _nom!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get prenom {
    try {
      return _prenom!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Filiere? get filiere {
    return _filiere;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Operateur._internal({required this.id, required nom, required prenom, required email, filiere, createdAt, updatedAt}): _nom = nom, _prenom = prenom, _email = email, _filiere = filiere, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Operateur({String? id, required String nom, required String prenom, required String email, Filiere? filiere}) {
    return Operateur._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nom: nom,
      prenom: prenom,
      email: email,
      filiere: filiere);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Operateur &&
      id == other.id &&
      _nom == other._nom &&
      _prenom == other._prenom &&
      _email == other._email &&
      _filiere == other._filiere;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Operateur {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nom=" + "$_nom" + ", ");
    buffer.write("prenom=" + "$_prenom" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("filiere=" + (_filiere != null ? _filiere!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Operateur copyWith({String? nom, String? prenom, String? email, Filiere? filiere}) {
    return Operateur._internal(
      id: id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      filiere: filiere ?? this.filiere);
  }
  
  Operateur copyWithModelFieldValues({
    ModelFieldValue<String>? nom,
    ModelFieldValue<String>? prenom,
    ModelFieldValue<String>? email,
    ModelFieldValue<Filiere?>? filiere
  }) {
    return Operateur._internal(
      id: id,
      nom: nom == null ? this.nom : nom.value,
      prenom: prenom == null ? this.prenom : prenom.value,
      email: email == null ? this.email : email.value,
      filiere: filiere == null ? this.filiere : filiere.value
    );
  }
  
  Operateur.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nom = json['nom'],
      _prenom = json['prenom'],
      _email = json['email'],
      _filiere = json['filiere'] != null
        ? json['filiere']['serializedData'] != null
          ? Filiere.fromJson(new Map<String, dynamic>.from(json['filiere']['serializedData']))
          : Filiere.fromJson(new Map<String, dynamic>.from(json['filiere']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nom': _nom, 'prenom': _prenom, 'email': _email, 'filiere': _filiere?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nom': _nom,
    'prenom': _prenom,
    'email': _email,
    'filiere': _filiere,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<OperateurModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<OperateurModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOM = amplify_core.QueryField(fieldName: "nom");
  static final PRENOM = amplify_core.QueryField(fieldName: "prenom");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final FILIERE = amplify_core.QueryField(
    fieldName: "filiere",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Filiere'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Operateur";
    modelSchemaDefinition.pluralName = "Operateurs";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Operateurs" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["email"], name: "byEmail"),
      amplify_core.ModelIndex(fields: const ["filiereId"], name: "byFiliereOperateur")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Operateur.NOM,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Operateur.PRENOM,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Operateur.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Operateur.FILIERE,
      isRequired: false,
      targetNames: ['filiereId'],
      ofModelName: 'Filiere'
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

class _OperateurModelType extends amplify_core.ModelType<Operateur> {
  const _OperateurModelType();
  
  @override
  Operateur fromJson(Map<String, dynamic> jsonData) {
    return Operateur.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Operateur';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Operateur] in your schema.
 */
class OperateurModelIdentifier implements amplify_core.ModelIdentifier<Operateur> {
  final String id;

  /** Create an instance of OperateurModelIdentifier using [id] the primary key. */
  const OperateurModelIdentifier({
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
  String toString() => 'OperateurModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OperateurModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}