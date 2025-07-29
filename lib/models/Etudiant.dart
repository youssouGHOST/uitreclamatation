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


/** This is an auto generated class representing the Etudiant type in your schema. */
class Etudiant extends amplify_core.Model {
  static const classType = const _EtudiantModelType();
  final String id;
  final String? _nom;
  final String? _prenom;
  final String? _apogee;
  final String? _cin;
  final String? _cycle;
  final String? _email;
  final String? _owner;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EtudiantModelIdentifier get modelIdentifier {
      return EtudiantModelIdentifier(
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
  
  String get apogee {
    try {
      return _apogee!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get cin {
    try {
      return _cin!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get cycle {
    try {
      return _cycle!;
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
  
  String? get owner {
    return _owner;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Etudiant._internal({required this.id, required nom, required prenom, required apogee, required cin, required cycle, required email, owner, createdAt, updatedAt}): _nom = nom, _prenom = prenom, _apogee = apogee, _cin = cin, _cycle = cycle, _email = email, _owner = owner, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Etudiant({String? id, required String nom, required String prenom, required String apogee, required String cin, required String cycle, required String email, String? owner}) {
    return Etudiant._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nom: nom,
      prenom: prenom,
      apogee: apogee,
      cin: cin,
      cycle: cycle,
      email: email,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Etudiant &&
      id == other.id &&
      _nom == other._nom &&
      _prenom == other._prenom &&
      _apogee == other._apogee &&
      _cin == other._cin &&
      _cycle == other._cycle &&
      _email == other._email &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Etudiant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nom=" + "$_nom" + ", ");
    buffer.write("prenom=" + "$_prenom" + ", ");
    buffer.write("apogee=" + "$_apogee" + ", ");
    buffer.write("cin=" + "$_cin" + ", ");
    buffer.write("cycle=" + "$_cycle" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Etudiant copyWith({String? nom, String? prenom, String? apogee, String? cin, String? cycle, String? email, String? owner}) {
    return Etudiant._internal(
      id: id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      apogee: apogee ?? this.apogee,
      cin: cin ?? this.cin,
      cycle: cycle ?? this.cycle,
      email: email ?? this.email,
      owner: owner ?? this.owner);
  }
  
  Etudiant copyWithModelFieldValues({
    ModelFieldValue<String>? nom,
    ModelFieldValue<String>? prenom,
    ModelFieldValue<String>? apogee,
    ModelFieldValue<String>? cin,
    ModelFieldValue<String>? cycle,
    ModelFieldValue<String>? email,
    ModelFieldValue<String?>? owner
  }) {
    return Etudiant._internal(
      id: id,
      nom: nom == null ? this.nom : nom.value,
      prenom: prenom == null ? this.prenom : prenom.value,
      apogee: apogee == null ? this.apogee : apogee.value,
      cin: cin == null ? this.cin : cin.value,
      cycle: cycle == null ? this.cycle : cycle.value,
      email: email == null ? this.email : email.value,
      owner: owner == null ? this.owner : owner.value
    );
  }
  
  Etudiant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nom = json['nom'],
      _prenom = json['prenom'],
      _apogee = json['apogee'],
      _cin = json['cin'],
      _cycle = json['cycle'],
      _email = json['email'],
      _owner = json['owner'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nom': _nom, 'prenom': _prenom, 'apogee': _apogee, 'cin': _cin, 'cycle': _cycle, 'email': _email, 'owner': _owner, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nom': _nom,
    'prenom': _prenom,
    'apogee': _apogee,
    'cin': _cin,
    'cycle': _cycle,
    'email': _email,
    'owner': _owner,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EtudiantModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EtudiantModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOM = amplify_core.QueryField(fieldName: "nom");
  static final PRENOM = amplify_core.QueryField(fieldName: "prenom");
  static final APOGEE = amplify_core.QueryField(fieldName: "apogee");
  static final CIN = amplify_core.QueryField(fieldName: "cin");
  static final CYCLE = amplify_core.QueryField(fieldName: "cycle");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final OWNER = amplify_core.QueryField(fieldName: "owner");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Etudiant";
    modelSchemaDefinition.pluralName = "Etudiants";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["email"], name: "byEmail")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.NOM,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.PRENOM,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.APOGEE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.CIN,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.CYCLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Etudiant.OWNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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

class _EtudiantModelType extends amplify_core.ModelType<Etudiant> {
  const _EtudiantModelType();
  
  @override
  Etudiant fromJson(Map<String, dynamic> jsonData) {
    return Etudiant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Etudiant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Etudiant] in your schema.
 */
class EtudiantModelIdentifier implements amplify_core.ModelIdentifier<Etudiant> {
  final String id;

  /** Create an instance of EtudiantModelIdentifier using [id] the primary key. */
  const EtudiantModelIdentifier({
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
  String toString() => 'EtudiantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EtudiantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}