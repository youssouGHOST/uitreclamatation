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


/** This is an auto generated class representing the AjoutModule type in your schema. */
class AjoutModule extends amplify_core.Model {
  static const classType = const _AjoutModuleModelType();
  final String id;
  final Etudiant? _etudiant;
  final int? _module;
  final String? _semestre;
  final Status? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AjoutModuleModelIdentifier get modelIdentifier {
      return AjoutModuleModelIdentifier(
        id: id
      );
  }
  
  Etudiant? get etudiant {
    return _etudiant;
  }
  
  int get module {
    try {
      return _module!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get semestre {
    try {
      return _semestre!;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AjoutModule._internal({required this.id, etudiant, required module, required semestre, required status, createdAt, updatedAt}): _etudiant = etudiant, _module = module, _semestre = semestre, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AjoutModule({String? id, Etudiant? etudiant, required int module, required String semestre, required Status status}) {
    return AjoutModule._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      etudiant: etudiant,
      module: module,
      semestre: semestre,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AjoutModule &&
      id == other.id &&
      _etudiant == other._etudiant &&
      _module == other._module &&
      _semestre == other._semestre &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AjoutModule {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("etudiant=" + (_etudiant != null ? _etudiant!.toString() : "null") + ", ");
    buffer.write("module=" + (_module != null ? _module!.toString() : "null") + ", ");
    buffer.write("semestre=" + "$_semestre" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AjoutModule copyWith({Etudiant? etudiant, int? module, String? semestre, Status? status}) {
    return AjoutModule._internal(
      id: id,
      etudiant: etudiant ?? this.etudiant,
      module: module ?? this.module,
      semestre: semestre ?? this.semestre,
      status: status ?? this.status);
  }
  
  AjoutModule copyWithModelFieldValues({
    ModelFieldValue<Etudiant?>? etudiant,
    ModelFieldValue<int>? module,
    ModelFieldValue<String>? semestre,
    ModelFieldValue<Status>? status
  }) {
    return AjoutModule._internal(
      id: id,
      etudiant: etudiant == null ? this.etudiant : etudiant.value,
      module: module == null ? this.module : module.value,
      semestre: semestre == null ? this.semestre : semestre.value,
      status: status == null ? this.status : status.value
    );
  }
  
  AjoutModule.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _etudiant = json['etudiant'] != null
        ? json['etudiant']['serializedData'] != null
          ? Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']['serializedData']))
          : Etudiant.fromJson(new Map<String, dynamic>.from(json['etudiant']))
        : null,
      _module = (json['module'] as num?)?.toInt(),
      _semestre = json['semestre'],
      _status = amplify_core.enumFromString<Status>(json['status'], Status.values),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'etudiant': _etudiant?.toJson(), 'module': _module, 'semestre': _semestre, 'status': amplify_core.enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'etudiant': _etudiant,
    'module': _module,
    'semestre': _semestre,
    'status': _status,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AjoutModuleModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AjoutModuleModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ETUDIANT = amplify_core.QueryField(
    fieldName: "etudiant",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Etudiant'));
  static final MODULE = amplify_core.QueryField(fieldName: "module");
  static final SEMESTRE = amplify_core.QueryField(fieldName: "semestre");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AjoutModule";
    modelSchemaDefinition.pluralName = "AjoutModules";
    
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
      key: AjoutModule.ETUDIANT,
      isRequired: false,
      targetNames: ['etudiantId'],
      ofModelName: 'Etudiant'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AjoutModule.MODULE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AjoutModule.SEMESTRE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AjoutModule.STATUS,
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

class _AjoutModuleModelType extends amplify_core.ModelType<AjoutModule> {
  const _AjoutModuleModelType();
  
  @override
  AjoutModule fromJson(Map<String, dynamic> jsonData) {
    return AjoutModule.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AjoutModule';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AjoutModule] in your schema.
 */
class AjoutModuleModelIdentifier implements amplify_core.ModelIdentifier<AjoutModule> {
  final String id;

  /** Create an instance of AjoutModuleModelIdentifier using [id] the primary key. */
  const AjoutModuleModelIdentifier({
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
  String toString() => 'AjoutModuleModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AjoutModuleModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}