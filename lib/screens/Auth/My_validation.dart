import 'dart:async';
import 'package:flutter/foundation.dart';

mixin MyValidation {
  //TODO: Login
  static bool isEmail(String email) => email.contains('@');
  static bool isPasswordValidLength(String password) => password.length >= 5;

  //TODO: Forget Password
  static bool isForgetPassword(String email) => email.contains('@');
  static bool  isVerifyCodeLength(String text) => text.length == 6;
  static bool  isRestLength(String text) => text.length >= 8;

//TODO: Add new Theme
  static bool  isPrimaryAppNewThemeLength(String text) => text.length >= 3;
  static bool  isBgColorAppNewThemeLength(String text) => text.length >= 3;
  static bool  isTextAppNewThemeLength(String text) => text.length >= 3;
  static bool  isGrayAppNewThemeLength(String text) => text.length >= 3;
  static bool  isDGrayAppNewThemeLength(String text) => text.length >= 3;
  static bool  isWhiteAppNewThemeLength(String text) => text.length >= 3;
  static bool  isLinkAppNewThemeLength(String text) => text.length >= 3;
  static bool isAppNewThemeOwenIdLength(String owenId) => owenId.isNotEmpty;
  static bool isAppNewThemeImageLength(String file) => file.isNotEmpty;
///
  //TODO: Update Theme
  static bool isBGColorUpdateThemeLength(String text) => text.length>=2;
  static bool  isWhiteUpdateThemeLength(String text) => text.length >= 2;
  static bool isDGrayUpdateThemeLength(String text) => text.length>=2;
  static bool isGrayUpdateThemeLength(String text) => text.length>= 2;
  static bool  isTitleUpdateThemeLength(String text) => text.length >=2;
  static bool isLinkUpdateThemeLength(String text) => text.length>=2;
  static bool  isPrimaryUpdateThemeLength(String text) => text.length >=2;
  static bool isUpdateThemeOwenIdLength(String owenId) => owenId.isNotEmpty;
///
  //TODO: Add new Package
  static bool  isAddNewPackageNameLength(String text) => text.length >= 2;
  static bool  isAddNewPackageQuotaLength(String text) => text.length >= 2;
  static bool  isAddNewPackagePriceLength(String text) => text.length >= 2;
  static bool isAddNewPackageDurationLength(String text) => text.length >2;
  static bool isAddNewPackageOwnerIdLength(String owenId) => owenId.isNotEmpty;

  //TODO: Update Package
  static bool  isPackageNameLength(String text) => text.length >= 3;
  static bool  isPackageQuotaLength(String text) => text.length >= 2;
  static bool  isPackagePriceLength(String text) => text.length >= 2;
  static bool isPackageDurationLength(String text) => text.length >2;

//TODO: ALL VENDOR
  static bool  isVendorNameLength(String text) => text.length >= 3;
  static bool  isVendorEmailLength(String text) => text.length >= 2;
  static bool  isVendorCompanyLength(String text) => text.length >= 2;

  // TODO: ADD NEW USER
  static bool  isAddressAppNewUserLength(String text) => text.length >= 5;
  static bool  isPhoneNumberAppNewUserLength(String text) => text.length == 11;
  static bool  isZipCodeAppNewUserLength(String text) => text.length >= 4;
  static bool  isPurposeAppNewUserLength(String text) => text.length >= 4;
  static bool isAppNewUserOwenIdLength(String owenId) => owenId.isNotEmpty;

  ///TODO:UPDATE USER

   static bool  isUpdateUserNameLength(String text) => text.length >= 2;
  static bool  isUpdateUserEmailLength(String email) => email.contains('@');
   static bool  isUpdateUserJoiningLength(String text) => text.length >= 4;

  ///TODO:Edit USER
  static bool  isEditUserNameLength(String text) => text.length >= 2;
  static bool  isEditUserEmailLength(String email) => email.contains('@');
  static bool  isEditUserAddressLength(String text) => text.length >= 2;
  static bool  isEditUserPhoneNoLength(String text) => text.length >= 2;
  static bool  isEditUserZipCodeLength(String text) => text.length >= 2;
  static bool  isEditUserPurposeLength(String text) => text.length >= 2;

  ///TODO: ALL ROLE
  static bool isRoleEmailLength(String email) => email.contains('@');
  static bool  isRoleNameLength(String text) => text.length == 2;
  static bool  isRoleUpdateLength(String text) => text.length >= 6;
  static bool  isRoleOwnerIdLength(String text) => text.isNotEmpty;
  static bool  isRoleDecryptLength(String text) => text.length >= 2;

  ///
  //TODO: Login screen
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      if (kDebugMode) {
        print("getting text $value");
      }
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("getting error text $value");
      }
      sink.add("");
      sink.addError("field error");
    }
  });
///
  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("password error text > $value");
      }
      sink.add("");
      sink.addError("Password must be of 6 characters");
    }
  });
///
  //TODO: Forget Password
  final forgetPasswordValidate =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isForgetPassword(value)) {
      if (kDebugMode) {
        print("getting text $value");
      }
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("getting error text $value");
      }
      sink.add("");
      sink.addError("Enter valid email");
    }
  });
///
//TODO: Verify  password code
  final verifyForgetCodeValidate =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isVerifyCodeLength(value)) {
      if (kDebugMode) {
        print("getting text $value");
      }
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("getting error text $value");
      }
      sink.add("");
      sink.addError("Enter valid code");
    }
  });
///
  //TODO: Forget Password
  final restValidatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isRestLength(value)) {
      if (kDebugMode) {
        print("getting text $value");
      }
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("getting error text $value");
      }
      sink.add("");
      sink.addError("Password must be greater then 8 character");
    }
  });
///
//TODO: Add new Theme
  final primaryAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPrimaryAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final bgAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isBgColorAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final textAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isTextAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final whiteAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isWhiteAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final dGrayAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isDGrayAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final grayAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGrayAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final linkAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isLinkAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final appNewThemeOwenIdLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAppNewThemeOwenIdLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("OwenId > $value");
      }
      sink.add("");
      sink.addError("Required Integer");
    }
  });
  ///
  // final appNewThemeImageLength =
  // StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (isAppNewThemeImageLength(value)) {
  //     sink.add(value);
  //   } else {
  //     print("Theme Image > $value");
  //     sink.add("");
  //     sink.addError("Enter Your Image");
  //   }
  // });
  ///
  /// Update Theme
  final bgUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isBGColorUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final whiteUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isWhiteUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Theme > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final dGrayUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isDGrayUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("DGray > $value");
      }
      sink.add("");
      sink.addError("Required DGray Colors");
    }
  });
  ///
  final grayUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGrayUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New gray Colors > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final textUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isTitleUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Text > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final linkUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isLinkUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Enter Link> $value");
      }
      sink.add("");
      sink.addError("Required Colors");
    }
  });
  ///
  final primaryUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPrimaryUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New primary Colors > $value");
      }
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final owenIdUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateThemeOwenIdLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("OwenId > $value");
      }
      sink.add("");
      sink.addError("Required Integer");
    }
  });
  ///
//TODO: Add new User
  final addressAppNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddressAppNewUserLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New User > $value");
      }
      sink.add("");
      sink.addError("Enter your address");
    }
  });
///
  final phoneNumberNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPhoneNumberAppNewUserLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New User > $value");
      }
      sink.add("");
      sink.addError("Enter your phone");
    }
  });
///
  final zipCodeAppNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isZipCodeAppNewUserLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New User > $value");
      }
      sink.add("");
      sink.addError("Enter Your ZipCode");
    }
  });
///
  final purposeAppNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPurposeAppNewUserLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New User > $value");
      }
      sink.add("");
      sink.addError("Enter your purpose");
    }
  });
 ///
  final appNewUserOwenIdLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAppNewUserOwenIdLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("OwenId > $value");
      }
      sink.add("");
      sink.addError("Required Integer");
    }
  });
  /// TODO: UPDATE USER
  final updateUserNameLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Name > $value");
      }
      sink.add("");
      sink.addError("Enter valid Name");
    }
  });
///
  final updateUserEmailLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserEmailLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Email > $value");
      }
      sink.add("");
      sink.addError("Required Email");
    }
  });
///
  final updateUserJoiningLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserJoiningLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Joining Date > $value");
      }
      sink.add("");
      sink.addError("Enter valid Joining");
    }
  });

///TODO: Edit USER
  final editUserNameLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEditUserNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Name > $value");
      }
      sink.add("");
      sink.addError("Enter valid Name");
    }
  });
  ///
  final editUserEmailLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEditUserEmailLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Email > $value");
      }
      sink.add("");
      sink.addError("Required Email");
    }
  });
///
  final editUserAddressLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEditUserAddressLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Address > $value");
      }
      sink.add("");
      sink.addError("Required Address");
    }
  });
  ///
  final editUserPhoneNoLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEditUserPhoneNoLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Phone No > $value");
      }
      sink.add("");
      sink.addError("Required Phone No");
    }
  });
  ///
  final editUserZipCodeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEditUserZipCodeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Zip Code > $value");
      }
      sink.add("");
      sink.addError("Required Zip Code");
    }
  });
  ///
  final editUserPurposeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEditUserPurposeLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Purpose > $value");
      }
      sink.add("");
      sink.addError("Required Purpose");
    }
  });
  ///
// ///
//   final appUpdateUserRoleLength =
//   StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
//     if (isUpdateUserRoleLength(value)) {
//       sink.add(value);
//     } else {
//       print("user Role > $value");
//       sink.add("");
//       sink.addError("Required Role");
//     }
//   });
///
  //TODO: Add new Package
  final nameNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New User > $value");
      }
      sink.add("");
      sink.addError("Enter your Name");
    }
  });
///
  final quotaNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageQuotaLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Package > $value");
      }
      sink.add("");
      sink.addError("Enter your Quota");
    }
  });
///
  final priceNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackagePriceLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Package > $value");
      }
      sink.add("");
      sink.addError("Enter Your Price");
    }
  });
///
  final durationNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageDurationLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Package > $value");
      }
      sink.add("");
      sink.addError("Enter your Duration");
    }
  });
///
  final owenIdNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageOwnerIdLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("OwenId > $value");
      }
      sink.add("");
      sink.addError("Required Integer");
    }
  });
///
  ///TODO: Update Package
  final namePackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackageNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("name > $value");
      }
      sink.add("");
      sink.addError("Required Name");
    }
  });
///
  final quotaPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackageQuotaLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("quota > $value");
      }
      sink.add("");
      sink.addError("Required quota");
    }
  });
///
  final pricePackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackagePriceLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Price > $value");
      }
      sink.add("");
      sink.addError("Required Price");
    }
  });
///
  final durationPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackageDurationLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Duration > $value");
      }
      sink.add("");
      sink.addError("Required Duration");
    }
  });
///
  ///TODO: ALL Vendor
  final nameVendorLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isVendorNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("name > $value");
      }
      sink.add("");
      sink.addError("Required Name");
    }
  });
  ///
  final emailVendorLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isVendorEmailLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Email > $value");
      }
      sink.add("");
      sink.addError("Required Email");
    }
  });
  ///
  final companyVendorLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isVendorCompanyLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Company > $value");
      }
      sink.add("");
      sink.addError("Required Company");
    }
  });
  /// Role Get Api
  final appRoleNameLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isRoleNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Enter Your Name > $value");
      }
      sink.add("");
      sink.addError("Required Your Name");
    }
  });
  ///
  final appRoleEmailLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isRoleEmailLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Enter Your Email > $value");
      }
      sink.add("");
      sink.addError("Required Your Email ");
    }
  });
  ///
  final appRoleUpdateLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isRoleUpdateLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Enter Your Update Date > $value");
      }
      sink.add("");
      sink.addError("Required Your Update Date");
    }
  });
  ///
  final appRoleDecryptLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isRoleDecryptLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Enter Your Decrypt > $value");
      }
      sink.add("");
      sink.addError("Required Your Decrypt");
    }
  });
}