
/* Validation Rules
| -------------------------------------------------------------------------
| Add custom validation rules for your project in this file.
| Learn more https://nylo.dev/docs/5.20.0/validation#custom-validation-rules
|-------------------------------------------------------------------------- */

final Map<String, dynamic> validationRules = {
  /// Example
  // "simple_password": (attribute) => SimplePassword(attribute),
};

/// Example validation class
// class SimplePassword extends ValidationRule {
//   SimplePassword(String attribute)
//       : super(
//       attribute: attribute,
//       signature: "simple_password", // Use this signature for the validator
//       description: "The $attribute field must be between 4 and 8 digits long", // Toast description when an error occurs
//       textFieldMessage: "Must be between 4 and 8 digits long with one numeric digit"); // TextField description when an error occurs
//
//   @override
//   bool handle(Map<String, dynamic> info) {
//     super.handle(info);
//
//     /// info['rule'] = Validation rule i.e "min".
//     /// info['data'] = Data the user has passed into the validation.
//     /// info['message'] = Overriding message to be displayed for validation (optional).
//
//     RegExp regExp = RegExp(r'^(?=.*\d).{4,8}$');
//     return regExp.hasMatch(info['data']);
//   }
// }
