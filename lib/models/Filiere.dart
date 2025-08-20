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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Filiere type in your schema. */
class Filiere extends amplify_core.Model {
  static const classType = const _FiliereModelType();
  final String id;
  final NomFiliere? _nomFiliere;
  final Operateur? _operateur;
  final List<Etudiant>? _etudiants;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FiliereModelIdentifier get modelIdentifier {
      return FiliereModelIdentifier(
        id: id
      );
  }
  
  NomFiliere get nomFiliere {
    try {
      return _nomFiliere!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Operateur? get operateur {
    return _operateur;
  }
  
  List<Etudiant>? get etudiants {
    return _etudiants;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Filiere._internal({required this.id, required nomFiliere, operateur, etudiants, createdAt, updatedAt}): _nomFiliere = nomFiliere, _operateur = operateur, _etudiants = etudiants, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Filiere({String? id, required NomFiliere nomFiliere, Operateur? operateur, List<Etudiant>? etudiants}) {
    return Filiere._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nomFiliere: nomFiliere,
      operateur: operateur,
      etudiants: etudiants != null ? List<Etudiant>.unmodifiable(etudiants) : etudiants);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Filiere &&
      id == other.id &&
      _nomFiliere == other._nomFiliere &&
      _operateur == other._operateur &&
      DeepCollectionEquality().equals(_etudiants, other._etudiants);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Filiere {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nomFiliere=" + (_nomFiliere != null ? amplify_core.enumToString(_nomFiliere)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Filiere copyWith({NomFiliere? nomFiliere, Operateur? operateur, List<Etudiant>? etudiants}) {
    return Filiere._internal(
      id: id,
      nomFiliere: nomFiliere ?? this.nomFiliere,
      operateur: operateur ?? this.operateur,
      etudiants: etudiants ?? this.etudiants);
  }
  
  Filiere copyWithModelFieldValues({
    ModelFieldValue<NomFiliere>? nomFiliere,
    ModelFieldValue<Operateur?>? operateur,
    ModelFieldValue<List<Etudiant>?>? etudiants
  }) {
    return Filiere._internal(
      id: id,
      nomFiliere: nomFiliere == null ? this.nomFiliere : nomFiliere.value,
      operateur: operateur == null ? this.operateur : operateur.value,
      etudiants: etudiants == null ? this.etudiants : etudiants.value
    );
  }
  
  Filiere.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nomFiliere = amplify_core.enumFromString<NomFiliere>(json['nomFiliere'], NomFiliere.values),
      _operateur = json['operateur'] != null
        ? json['operateur']['serializedData'] != null
          ? Operateur.fromJson(new Map<String, dynamic>.from(json['operateur']['serializedData']))
          : Operateur.fromJson(new Map<String, dynamic>.from(json['operateur']))
        : null,
      _etudiants = json['etudiants']  is Map
        ? (json['etudiants']['items'] is List
          ? (json['etudiants']['items'] as List)
              .where((e) => e != null)
              .map((e) => Etudiant.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['etudiants'] is List
          ? (json['etudiants'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Etudiant.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nomFiliere': amplify_core.enumToString(_nomFiliere), 'operateur': _operateur?.toJson(), 'etudiants': _etudiants?.map((Etudiant? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'nomFiliere': _nomFiliere,
    'operateur': _operateur,
    'etudiants': _etudiants,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FiliereModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FiliereModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOMFILIERE = amplify_core.QueryField(fieldName: "nomFiliere");
  static final OPERATEUR = amplify_core.QueryField(
    fieldName: "operateur",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Operateur'));
  static final ETUDIANTS = amplify_core.QueryField(
    fieldName: "etudiants",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Etudiant'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Filiere";
    modelSchemaDefinition.pluralName = "Filieres";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
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
      amplify_core.ModelIndex(fields: const ["nomFiliere"], name: "byNomFiliere")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Filiere.NOMFILIERE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Filiere.OPERATEUR,
      isRequired: false,
      ofModelName: 'Operateur',
      associatedKey: Operateur.FILIERE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Filiere.ETUDIANTS,
      isRequired: false,
      ofModelName: 'Etudiant',
      associatedKey: Etudiant.FILIERE
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

class _FiliereModelType extends amplify_core.ModelType<Filiere> {
  const _FiliereModelType();
  
  @override
  Filiere fromJson(Map<String, dynamic> jsonData) {
    return Filiere.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Filiere';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Filiere] in your schema.
 */
class FiliereModelIdentifier implements amplify_core.ModelIdentifier<Filiere> {
  final String id;

  /** Create an instance of FiliereModelIdentifier using [id] the primary key. */
  const FiliereModelIdentifier({
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
  String toString() => 'FiliereModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FiliereModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}