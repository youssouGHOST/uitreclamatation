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


/** This is an auto generated class representing the Etudiant type in your schema. */
class Etudiant extends amplify_core.Model {
  static const classType = const _EtudiantModelType();
  final String id;
  final String? _nom;
  final String? _prenom;
  final String? _apogee;
  final String? _cin;
  final Cycle? _cycle;
  final String? _email;
  final String? _owner;
  final Filiere? _filiere;
  final List<Absence>? _absences;
  final List<AttestationInscription>? _attestationsInscription;
  final List<AnnulationInscription>? _annulationInscription;
  final List<AjoutModule>? _ajoutModule;
  final List<Anomalies>? _anomalies;
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
  
  Cycle get cycle {
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
  
  Filiere? get filiere {
    return _filiere;
  }
  
  List<Absence>? get absences {
    return _absences;
  }
  
  List<AttestationInscription>? get attestationsInscription {
    return _attestationsInscription;
  }
  
  List<AnnulationInscription>? get annulationInscription {
    return _annulationInscription;
  }
  
  List<AjoutModule>? get ajoutModule {
    return _ajoutModule;
  }
  
  List<Anomalies>? get anomalies {
    return _anomalies;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Etudiant._internal({required this.id, required nom, required prenom, required apogee, required cin, required cycle, required email, owner, filiere, absences, attestationsInscription, annulationInscription, ajoutModule, anomalies, createdAt, updatedAt}): _nom = nom, _prenom = prenom, _apogee = apogee, _cin = cin, _cycle = cycle, _email = email, _owner = owner, _filiere = filiere, _absences = absences, _attestationsInscription = attestationsInscription, _annulationInscription = annulationInscription, _ajoutModule = ajoutModule, _anomalies = anomalies, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Etudiant({String? id, required String nom, required String prenom, required String apogee, required String cin, required Cycle cycle, required String email, String? owner, Filiere? filiere, List<Absence>? absences, List<AttestationInscription>? attestationsInscription, List<AnnulationInscription>? annulationInscription, List<AjoutModule>? ajoutModule, List<Anomalies>? anomalies}) {
    return Etudiant._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      nom: nom,
      prenom: prenom,
      apogee: apogee,
      cin: cin,
      cycle: cycle,
      email: email,
      owner: owner,
      filiere: filiere,
      absences: absences != null ? List<Absence>.unmodifiable(absences) : absences,
      attestationsInscription: attestationsInscription != null ? List<AttestationInscription>.unmodifiable(attestationsInscription) : attestationsInscription,
      annulationInscription: annulationInscription != null ? List<AnnulationInscription>.unmodifiable(annulationInscription) : annulationInscription,
      ajoutModule: ajoutModule != null ? List<AjoutModule>.unmodifiable(ajoutModule) : ajoutModule,
      anomalies: anomalies != null ? List<Anomalies>.unmodifiable(anomalies) : anomalies);
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
      _owner == other._owner &&
      _filiere == other._filiere &&
      DeepCollectionEquality().equals(_absences, other._absences) &&
      DeepCollectionEquality().equals(_attestationsInscription, other._attestationsInscription) &&
      DeepCollectionEquality().equals(_annulationInscription, other._annulationInscription) &&
      DeepCollectionEquality().equals(_ajoutModule, other._ajoutModule) &&
      DeepCollectionEquality().equals(_anomalies, other._anomalies);
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
    buffer.write("cycle=" + (_cycle != null ? amplify_core.enumToString(_cycle)! : "null") + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("filiere=" + (_filiere != null ? _filiere!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Etudiant copyWith({String? nom, String? prenom, String? apogee, String? cin, Cycle? cycle, String? email, String? owner, Filiere? filiere, List<Absence>? absences, List<AttestationInscription>? attestationsInscription, List<AnnulationInscription>? annulationInscription, List<AjoutModule>? ajoutModule, List<Anomalies>? anomalies}) {
    return Etudiant._internal(
      id: id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      apogee: apogee ?? this.apogee,
      cin: cin ?? this.cin,
      cycle: cycle ?? this.cycle,
      email: email ?? this.email,
      owner: owner ?? this.owner,
      filiere: filiere ?? this.filiere,
      absences: absences ?? this.absences,
      attestationsInscription: attestationsInscription ?? this.attestationsInscription,
      annulationInscription: annulationInscription ?? this.annulationInscription,
      ajoutModule: ajoutModule ?? this.ajoutModule,
      anomalies: anomalies ?? this.anomalies);
  }
  
  Etudiant copyWithModelFieldValues({
    ModelFieldValue<String>? nom,
    ModelFieldValue<String>? prenom,
    ModelFieldValue<String>? apogee,
    ModelFieldValue<String>? cin,
    ModelFieldValue<Cycle>? cycle,
    ModelFieldValue<String>? email,
    ModelFieldValue<String?>? owner,
    ModelFieldValue<Filiere?>? filiere,
    ModelFieldValue<List<Absence>?>? absences,
    ModelFieldValue<List<AttestationInscription>?>? attestationsInscription,
    ModelFieldValue<List<AnnulationInscription>?>? annulationInscription,
    ModelFieldValue<List<AjoutModule>?>? ajoutModule,
    ModelFieldValue<List<Anomalies>?>? anomalies
  }) {
    return Etudiant._internal(
      id: id,
      nom: nom == null ? this.nom : nom.value,
      prenom: prenom == null ? this.prenom : prenom.value,
      apogee: apogee == null ? this.apogee : apogee.value,
      cin: cin == null ? this.cin : cin.value,
      cycle: cycle == null ? this.cycle : cycle.value,
      email: email == null ? this.email : email.value,
      owner: owner == null ? this.owner : owner.value,
      filiere: filiere == null ? this.filiere : filiere.value,
      absences: absences == null ? this.absences : absences.value,
      attestationsInscription: attestationsInscription == null ? this.attestationsInscription : attestationsInscription.value,
      annulationInscription: annulationInscription == null ? this.annulationInscription : annulationInscription.value,
      ajoutModule: ajoutModule == null ? this.ajoutModule : ajoutModule.value,
      anomalies: anomalies == null ? this.anomalies : anomalies.value
    );
  }
  
  Etudiant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nom = json['nom'],
      _prenom = json['prenom'],
      _apogee = json['apogee'],
      _cin = json['cin'],
      _cycle = amplify_core.enumFromString<Cycle>(json['cycle'], Cycle.values),
      _email = json['email'],
      _owner = json['owner'],
      _filiere = json['filiere'] != null
        ? json['filiere']['serializedData'] != null
          ? Filiere.fromJson(new Map<String, dynamic>.from(json['filiere']['serializedData']))
          : Filiere.fromJson(new Map<String, dynamic>.from(json['filiere']))
        : null,
      _absences = json['absences']  is Map
        ? (json['absences']['items'] is List
          ? (json['absences']['items'] as List)
              .where((e) => e != null)
              .map((e) => Absence.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['absences'] is List
          ? (json['absences'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Absence.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _attestationsInscription = json['attestationsInscription']  is Map
        ? (json['attestationsInscription']['items'] is List
          ? (json['attestationsInscription']['items'] as List)
              .where((e) => e != null)
              .map((e) => AttestationInscription.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['attestationsInscription'] is List
          ? (json['attestationsInscription'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => AttestationInscription.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _annulationInscription = json['annulationInscription']  is Map
        ? (json['annulationInscription']['items'] is List
          ? (json['annulationInscription']['items'] as List)
              .where((e) => e != null)
              .map((e) => AnnulationInscription.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['annulationInscription'] is List
          ? (json['annulationInscription'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => AnnulationInscription.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _ajoutModule = json['ajoutModule']  is Map
        ? (json['ajoutModule']['items'] is List
          ? (json['ajoutModule']['items'] as List)
              .where((e) => e != null)
              .map((e) => AjoutModule.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['ajoutModule'] is List
          ? (json['ajoutModule'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => AjoutModule.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _anomalies = json['anomalies']  is Map
        ? (json['anomalies']['items'] is List
          ? (json['anomalies']['items'] as List)
              .where((e) => e != null)
              .map((e) => Anomalies.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['anomalies'] is List
          ? (json['anomalies'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Anomalies.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nom': _nom, 'prenom': _prenom, 'apogee': _apogee, 'cin': _cin, 'cycle': amplify_core.enumToString(_cycle), 'email': _email, 'owner': _owner, 'filiere': _filiere?.toJson(), 'absences': _absences?.map((Absence? e) => e?.toJson()).toList(), 'attestationsInscription': _attestationsInscription?.map((AttestationInscription? e) => e?.toJson()).toList(), 'annulationInscription': _annulationInscription?.map((AnnulationInscription? e) => e?.toJson()).toList(), 'ajoutModule': _ajoutModule?.map((AjoutModule? e) => e?.toJson()).toList(), 'anomalies': _anomalies?.map((Anomalies? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
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
    'filiere': _filiere,
    'absences': _absences,
    'attestationsInscription': _attestationsInscription,
    'annulationInscription': _annulationInscription,
    'ajoutModule': _ajoutModule,
    'anomalies': _anomalies,
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
  static final FILIERE = amplify_core.QueryField(
    fieldName: "filiere",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Filiere'));
  static final ABSENCES = amplify_core.QueryField(
    fieldName: "absences",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Absence'));
  static final ATTESTATIONSINSCRIPTION = amplify_core.QueryField(
    fieldName: "attestationsInscription",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AttestationInscription'));
  static final ANNULATIONINSCRIPTION = amplify_core.QueryField(
    fieldName: "annulationInscription",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AnnulationInscription'));
  static final AJOUTMODULE = amplify_core.QueryField(
    fieldName: "ajoutModule",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AjoutModule'));
  static final ANOMALIES = amplify_core.QueryField(
    fieldName: "anomalies",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Anomalies'));
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
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Operateurs" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["apogee"], name: "byApogee"),
      amplify_core.ModelIndex(fields: const ["cycle"], name: "byCycle"),
      amplify_core.ModelIndex(fields: const ["email"], name: "byEmail"),
      amplify_core.ModelIndex(fields: const ["filiereId"], name: "byFiliereEtudiant")
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
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Etudiant.FILIERE,
      isRequired: false,
      targetNames: ['filiereId'],
      ofModelName: 'Filiere'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Etudiant.ABSENCES,
      isRequired: false,
      ofModelName: 'Absence',
      associatedKey: Absence.ETUDIANT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Etudiant.ATTESTATIONSINSCRIPTION,
      isRequired: false,
      ofModelName: 'AttestationInscription',
      associatedKey: AttestationInscription.ETUDIANT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Etudiant.ANNULATIONINSCRIPTION,
      isRequired: false,
      ofModelName: 'AnnulationInscription',
      associatedKey: AnnulationInscription.ETUDIANT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Etudiant.AJOUTMODULE,
      isRequired: false,
      ofModelName: 'AjoutModule',
      associatedKey: AjoutModule.ETUDIANT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Etudiant.ANOMALIES,
      isRequired: false,
      ofModelName: 'Anomalies',
      associatedKey: Anomalies.ETUDIANT
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