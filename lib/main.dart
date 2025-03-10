import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Resources/Providers/app_state_provider.dart';
import 'Screens/splash/splah_loading.dart';

SharedPreferences? prefs;
GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  prefs = await SharedPreferences.getInstance();
  DateTime now = DateTime.now();
  DateTime date = DateTime.parse('2025-12-31');
  int comp = now.compareTo(date);
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   // await Hive.initFlutter(appDocumentDir.path.toString());
  //   await Hive.initFlutter();
  //   try {
  //     Hive.registerAdapter(customerModelAdapter());
  //     Hive.registerAdapter(articleModelAdapter());
  //     Hive.registerAdapter(depositModelAdapter());
  //     Hive.registerAdapter(CategoriesModelAdapter());
  //     Hive.registerAdapter(EntrepriseModelAdapter());
  //     Hive.registerAdapter(pricesModelAdapter());
  //     Hive.registerAdapter(DataModelAdapter());
  //     Hive.registerAdapter(userModelAdapter());
  //     Hive.registerAdapter(factureModelAdapter());
  //     Hive.registerAdapter(DepensesModelAdapter());
  //     await Hive.openBox<articleModel>(
  //       'services_controllers',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox<articleModel>(
  //       'Depenses',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox(
  //       'customers',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox(
  //       'invoices',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox(
  //       'deposits_users',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox<CategoriesModel>(
  //       'deposits_categories',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox(
  //       'data_facturation',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox<EntrepriseModel>(
  //       'enterprises',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox<pricesModel>(
  //       'prices_categories',
  //       crashRecovery: true,
  //     );
  //     await Hive.openBox<userModel>(
  //       'user',
  //       crashRecovery: true,
  //     );
  //   } catch (e) {
  //     print("error while initializing hive ====> ${e.toString()}");
  //     return Future.error(e);
  //   }
  // });
  //       'user',
  //       'enterprises',
  //       'accounts',
  //       'affectation_users',
  //       'attemptactivationaccounts',
  //       'bonuses',
  //       'categories_customer_controllers',
  //       'categories_services_controllers',
  //       'cautions',
  //       'colors',
  //       'comments',
  //       'customer_controllers',
  //       'debts',
  //       'debt_payments',
  //       'decision_chiefdepartments',
  //       'decision_decisionteams',
  //       'decision_teams',
  //       'defects',
  //       'departments',
  //       'deposits_categories',
  //       'deposits_users',
  //       'deposit_controllers',
  //       'deposit_services',
  //       'details_invoices_statuses',
  //       'details_requests',
  //       'document_types',
  //       'expenditures',
  //       'expenditures_limits',
  //       'failed_jobs',
  //       'fences',
  //       'fence_ticketings',
  //       'funds',
  //       'images',
  //       'invoices',
  //       'invoicesdetailscolors',
  //       'invoicesdetailsdefects',
  //       'invoicesdetailsmaterials',
  //       'invoicesdetailsreasons',
  //       'invoicesdetails_spots',
  //       'invoicesdetails_styles',
  //       'invoices_statuses',
  //       'invoice_details',
  //       'materials',
  //       'moneys',
  //       'money_conversions',
  //       'nbrdecisionteam_validations',
  //       'orders',
  //       'other_entries',
  //       'owners',
  //       'password_resets',
  //       'paymentmodes',
  //       'personal_access_tokens',
  //       'points',
  //       'point_of_sales',
  //       'posdeposits',
  // DateFormat('dd/MM/yyyy HH:mm:ss')
  //                                 .format(DateTime.now())
  //                                 .toString(),
  //       'pressing_stock_stories',
  //       'prices_categories',
  //       'provider_controllers',
  //       'reasons',
  //       'requestapprovments',
  //       'requests',
  //       'request_files',
  //       'request_histories',
  //       'request_references',
  //       'request_serveds',
  //       'roles',
  //       'safeguards',
  //       'self_references',
  //       'servants',
  //       'servicesadditionalfees',
  //       'services_controllers',
  //       'spots',
  //       'statuses',
  //       'stock_history_controllers',
  //       'styles',
  //       'systeminfos',
  //       'testmodesls',
  //       'ticket_offices',
  //       'unit_of_measure_controllers',
  //       'tables',
  //       'usersenterprises',
  //       'users_expenditures_limits',
  //       'users_point_of_sales',
  //       'users_ticket_offices',
  //       'validatedbydecisionteams'
  if (comp < 0) {
    initializeDateFormatting('fr_FR', null).then((_) =>  runApp(const MyApp()));
  
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map headers = {
      "Logos": "logo",
      "Nom": "nom",
      "Adresse": "address",
      "Description": "description",
      "Numéro d'Impôt": "numeroImpot",
      "ID. Nat": "idNat",
      "RCCM": "rccm",
      "Contact": "contact"
    };
    Map footers = {
      "Afficher le pied de page": "footer",
      "Total HT": "totalht",
      "TVA": "tva",
      "Réduction": "reduction",
      "Net à payer": "netpay",
      "Retour": "back",
      "Total réçu": "receive",
      "Nom client": "namecustomer",
      "Contact Client": "contactcustomer",
      "Total points": "point",
      "Total cautions": "caution",
      "Paiement en espèce": "cash",
      "Paiement en banque": "bank",
      "Paiement via Mobile Money": "mobmoney",
      "Configurer le message de pied de page": "pied",
      // code pour la facture
    };
    Map outData = {
      "Ventes cash": "cash",
      "Ventes credit": "credit",
      "Ventes bonus": "bonus",
      "Ventes caution": "caution",
      "Ventes points": "point",
      "Paiements dettes": "dette",
      "Depots cautions": "caution",
      "Depenses": "depense",
      "Entrees": "entry",
      "qrcode": "qrcode"
    };
    Map<String, bool> combinedConfig = {
      ...headers.map((key, value) => MapEntry(value, true)),
      ...footers.map((key, value) => MapEntry(value, true)),
      ...outData.map((key, value) => MapEntry(value, true)),
    };

    prefs?.setString("configViewPrint", jsonEncode(combinedConfig));
    return MultiProvider(
      providers: [
       
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
        
        


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Virunga Energy',
        theme: ThemeData(
          fontFamily: "Karla",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: navKey,
        home: prefs?.getBool('globalData') == null || prefs?.getBool('globalData')==false
            ? const SplashScreen(): Container(),
            // home: HomePage(),
        initialRoute: '/',
      ),
    );
  }
}
