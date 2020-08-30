import 'package:verify_app/ui/helpers/basenotifier.dart';

class VerificationModel extends BaseNotifier {
  String _imagePath = '';
  String get image => _imagePath;

  void setImage(String image) {
    _imagePath = image;
    notifyListeners();
  }

  void clear() {
    _imagePath = '';
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _imagePath = '';
  }
}
