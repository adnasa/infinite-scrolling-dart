import 'dart:core';
import 'dart:html';
import 'dart:convert';
import 'package:json_object/json_object.dart';
// import 'user.dart';


const String url = "http://api.randomuser.me/?results=20";

void main() {
  profileGenerate();
  document.addEventListener('scroll', checkScrollReady);
}

void checkScrollReady(Event e) {
  if (document.body.scrollHeight == (document.body.scrollTop + window.innerHeight)) {
    profileGenerate();
  }
}

void showLoader() {
  querySelector('#loader').setAttribute('class', 'block');
}

void hideLoader() {
  querySelector('#loader').setAttribute('class', 'hidden');
}

void profileGenerate() {
  showLoader();
  HttpRequest.getString(url).then(loadProfiles);
}

Element renderElement(JsonObject user) {
  Element k = new Element.tag('div');
  
  Element article = new Element.tag('article');
  article.setAttribute('class', 'profile');
  
  Element image = new Element.tag('img');
  image.setAttribute('src', user.picture);
  
  Element info = new Element.tag('article');
  info.setAttribute('class', 'profile-inner');
  
  JsonObject name = user.name;
  String firstName = name['first'];
  String lastName = name['last'];
  String nameInfo = firstName + ' ' + lastName;
  
  info.setInnerHtml(nameInfo);
  article.append(image);
  article.append(info);
  
  k.append(article);
  return k;
}

void loadProfiles(String result) {
  // Map resultMap = JSON.decode(result);
  JsonObject k = new JsonObject.fromJsonString(result);
  List elements = [];
  Element profiles = querySelector('#profiles');
  
  for (JsonObject i in k.results) {
    JsonObject user = i.user;
    Element element = renderElement(user);
    profiles.append(element);
  }
  hideLoader();
}





