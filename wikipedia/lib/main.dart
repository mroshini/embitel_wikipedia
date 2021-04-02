import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia/core/api_helper/api_service_helper.dart';
import 'package:wikipedia/core/repositories/search_data_repository.dart';
import 'package:wikipedia/core/view_models/search_data_view_model.dart';
import 'package:wikipedia/router_map.dart';
import 'package:wikipedia/ui/res/style.dart';
import 'package:wikipedia/ui/routes/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: ApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchDataViewModel(
            searchDataRepository: SearchDataRepository(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'WikiPedia',
        debugShowCheckedModeBanner: false,
        theme: ThemeChanger().lightTheme,
        onGenerateRoute: RouterNavigation.generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}
