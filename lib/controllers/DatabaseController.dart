import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savey/Configuration/FontFunctions.dart';
import 'package:savey/Configuration/GeneralFunctions.dart';
import 'package:savey/Configuration/Palette.dart';
import 'package:savey/Widgets/StatsPageWidgets/StatsWalletLengend.dart';
import 'package:savey/models/Category.dart';
import 'package:savey/models/Transaction.dart';
import 'package:savey/models/Wallet.dart';
import 'package:savey/services/DatabaseHelper.dart';

class DatabaseController extends GetxController {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  RxString selectWalletIcon = RxString("wallet_1");
  RxString selectTransactionIcon = RxString("0");
  RxInt selectedCategoryColor = RxInt(4282339765);

  RxInt selectedCategoryId = 0.obs;

  RxInt startTIcon = 0.obs;
  RxInt endTIcon = 8.obs;

  final TextEditingController walletTitleController = TextEditingController();
  final TextEditingController walletAmountController = TextEditingController();
  final TextEditingController categoryTitleController = TextEditingController();
  final TextEditingController transactionTitleController =
      TextEditingController();
  final TextEditingController transactionAmountController =
      TextEditingController();

  RxList<Wallet> wallets = RxList<Wallet>();
  RxList<Category> categories = RxList<Category>();
  RxList<Transaction> transactions = RxList<Transaction>();

  get totalOfWalletsamounts => wallets.fold(
      0, (previousValue, Wallet element) => previousValue + element.amount);

  get totalOfTransactionsamount => transactions.fold(0,
      (previousValue, Transaction element) => previousValue + element.amount);

  @override
  void onInit() {
    super.onInit();
    getWallets();
    getCategories();
    getTransactions();
  }

  @override
  void onClose() {
    super.onClose();
    walletAmountController.dispose();
    walletAmountController.dispose();
    categoryTitleController.dispose();
    transactionAmountController.dispose();
    transactionTitleController.dispose();
  }

  changeWalletIcon(String value) {
    selectWalletIcon.value = value;
  }

  paginateMore() {
    startTIcon.value += 8;
    endTIcon.value += 8;
  }

  paginateLess() {
    startTIcon.value -= 8;
    endTIcon.value -= 8;
  }

  changeTransactionIcon(String value) {
    selectTransactionIcon.value = value;
  }

  changeCategoryID(int value) {
    selectedCategoryId.value = value;
  }

  insertWallet({BuildContext context}) async {
    if (walletTitleController.text.length == 0) {
      errorAlert(
        context,
        "Empty Title",
        "Please provide a title for this wallet",
      );
    } else if (walletAmountController.text.isEmpty) {
      errorAlert(
          context, "Empty amount", "Please provide an amount for this wallet");
    } else {
      Wallet wallet = Wallet(
          amount: double.parse(walletAmountController.text),
          icon: selectWalletIcon.value,
          id: DateTime.now().millisecondsSinceEpoch,
          title: walletTitleController.text);
      int id = await dbHelper.insertWallet(wallet);
      if (id != -1) {
        wallets.add(wallet);
        clearWalletControllers();
        successAlert(
            context: context,
            title: "Wallet added",
            message: "The wallet was added successfully !");
      } else {
        errorAlert(context, "Error occured", "Failed to add Wallet");
      }
    }
  }

  insertCategory(BuildContext context) async {
    if (categoryTitleController.text.isEmpty) {
      errorAlert(
        context,
        "Empty Title",
        "Please provide a title for this Category",
      );
    } else {
      Category category = Category(
          id: DateTime.now().millisecondsSinceEpoch,
          color: selectedCategoryColor.value,
          title: categoryTitleController.text);
      int id = await dbHelper.insertCategory(category);
      if (id != -1) {
        categoryTitleController.clear();
        categories.add(category);
        successAlert(
          context: context,
          title: "Category added",
          message: "The category was added successfully !",
          color: Color(selectedCategoryColor.value),
        );
      } else {
        errorAlert(context, "Error occured", "Failed to add Category");
      }
    }
  }

  insertTransaction(BuildContext context) async {
    if (transactionTitleController.text.isEmpty) {
      errorAlert(
        context,
        "Empty Title",
        "Please provide a title for this transaction",
      );
    } else if (transactionAmountController.text.isEmpty) {
      errorAlert(
        context,
        "Empty Amount",
        "Please provide an amount for this transaction",
      );
    } else if (selectedCategoryId.value == 0) {
      errorAlert(
        context,
        "Empty Category",
        "Please associate this transaction with a category",
      );
    } else if (double.parse(transactionAmountController.text) >
        (totalOfWalletsamounts - totalOfTransactionsamount)) {
      errorAlert(
        context,
        "Amount exceeds Balance",
        "The amount you are trying to add exceeds the current balance.\nCurrent Balance : ${totalOfWalletsamounts - totalOfTransactionsamount}",
      );
    } else {
      Transaction transaction = Transaction(
          amount: double.parse(transactionAmountController.text),
          icon: selectTransactionIcon.value,
          id: DateTime.now().millisecondsSinceEpoch,
          title: transactionTitleController.text,
          categoryId: selectedCategoryId.value);
      int id = await dbHelper.insertTransction(transaction);
      if (id != -1) {
        transactions.add(transaction);
        selectTransactionIcon.value = "0";
        selectedCategoryId.value = 0;
        transactionAmountController.clear();
        transactionTitleController.clear();
        successAlert(
            context: context,
            message: "The transaction was save successfully!",
            title: "Transaction Saved");
      } else {
        errorAlert(context, "Error occured", "Failed to add Transaction");
      }
    }
  }

  clearWalletControllers() {
    changeWalletIcon("wallet_1");
    walletAmountController.clear();
    walletTitleController.clear();
  }

  getWallets() async {
    List<Map<String, dynamic>> map = await dbHelper.getAllWallets();
    map.forEach((element) {
      wallets.add(Wallet.fromJson(element));
    });
  }

  getTransactions() async {
    transactions.clear();
    List<Map<String, dynamic>> map = await dbHelper.getAllTransactions();
    map.forEach((element) {
      transactions.add(Transaction.fromJson(element));
    });
  }

  sortTransactionsByName() {
    transactions.sort((a, b) => a.title.compareTo(b.title));
  }

  sortTransactionsByAmount() {
    transactions.sort((a, b) => a.amount.compareTo(b.amount));
  }

  sortTransactionsByDate() {
    transactions.sort((a, b) => a.id.compareTo(b.id));
  }

  getCategories() async {
    List<Map<String, dynamic>> map = await dbHelper.getAllCategories();
    map.forEach((element) {
      categories.add(Category.fromJson(element));
    });
  }

  List<PieChartSectionData> getWalletsSection() => wallets.reversed
      .toList()
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        double v = (data.amount / totalOfWalletsamounts) * 100;
        final value = PieChartSectionData(
            value: v,
            title: "${v.toStringAsFixed(1)} %",
            color: mainColor.withOpacity(
              v / 100,
            ),
            radius: 40,
            titleStyle: montserratStyle(color: white),
            showTitle: true);
        return MapEntry(index, value);
      })
      .values
      .toList();

  List<Widget> getWalletLegends() => wallets.reversed
      .toList()
      .asMap()
      .map<int, Widget>((key, data) {
        final value = WalletLegendStatsPage(
          data: data,
          totalOfWalletsamounts: totalOfWalletsamounts,
        );
        return MapEntry(key, value);
      })
      .values
      .toList();

  deleteTransaction({
    BuildContext context,
    Transaction transaction,
  }) {
    deleteAlert(
      context: context,
      type: "transaction",
      delete: () {
        Get.back();
        transactions.remove(transaction);
        dbHelper.deleteTransaction(transaction);
      },
    );
  }

  deleteWallet({BuildContext context, Wallet wallet}) {
    deleteAlert(
      context: context,
      type: "wallet",
      delete: () {
        if (canDeleteWallet(wallet)) {
          Get.back();
          wallets.remove(wallet);
          dbHelper.deleteWallet(wallet);
        } else {
          print("cannot");
          Get.back();
          errorAlert(context, "Error Occured",
              "Cannot delete wallet!Used balance greater than total income");
        }
      },
    );
  }

  deleteCategory({BuildContext context, Category category}) {
    // print(category.id);
    deleteAlert(
      context: context,
      type: "category",
      delete: () async {
        // print(category.id);
        int id = await dbHelper.deleteCategory(category);

        if (id != -1) {
          categories.remove(category);
          Get.back();
          successAlert(
              context: context,
              title: "Category Deleted",
              message: "The category has been deleted");
        } else {
          Get.back();
          errorAlert(context, "Error Occurred",
              "cannot delete category with associated transactions");
        }
      },
    );
  }

  bool canDeleteWallet(Wallet wallet) {
    return wallet.amount <= totalOfWalletsamounts - totalOfTransactionsamount;
  }
}
