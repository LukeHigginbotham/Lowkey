import 'package:lowkey/components/bussiness_category.dart';
import 'package:lowkey/components/deals.dart';
import 'package:lowkey/components/manager.dart';
import 'package:lowkey/components/news.dart';

class Business {
  String _name = "";
  //String _address = "";
  String _description = "";
  int _longitude = 0;
  int _ladtitude = 0;

  late String _logo = "";

  late Manager _owner;

  List<Deals> _listOfDeals = [];
  List<Deals> _archivedDeals = [];

  List<News> _listOfNews = [];
  List<News> _archivedNews = [];

  late BussinessCategory _styleOfBussiness;

  late int _distanceFromUser;

  Business(
      String name, String description, BussinessCategory type, Manager owner) {
    _name = name;
    _description = description;
    _styleOfBussiness = type;
    _owner = owner;
  }

  String getName() {
    return _name;
  }

  Deals getDeal(int index) {
    return _listOfDeals[index];
  }

  void addDeals(Deals newDeal) {
    newDeal.setBussinessName(_name);
    _listOfDeals.add(newDeal);
    _listOfDeals.sort((a, b) => a.getStartDate().compareTo(b.getStartDate()));
  }

  News getNews(int index) {
    return _listOfNews[index];
  }

  void addNews(News newNews) {
    _listOfNews.add(newNews);
    _listOfNews.sort((a, b) => a.getDate().compareTo(b.getDate()));
  }

  void changeLogo(String logoPath) {
    _logo = logoPath;
  }

  void getDistance() {}
}
