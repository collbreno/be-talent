import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class Formatters {
  static final phone = MaskTextInputFormatter(mask: '+## (##) #####-####');
}
