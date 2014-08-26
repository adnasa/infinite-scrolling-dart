library user;
import 'dart:core';
import 'package:json_object/json_object.dart';

class User extends Object {
  
  var JsonObject _objectData;
  
  User() {
    JsonObject _objectData = new JsonObject();
  }
  
  factory User.fromJsonObject(JsonObject user) {
    
    User context = new User();
    
    if (user._objectData.containsKey('picture')) {
      context['picture'] = user.picture; 
    }
    
    if (user._objectData.containsKey('name')) {
      Map name = user.name;
      if (name.containsKey('first')) {
        context._objectData.['firstName'] = name.first;
      }
      
      if (name._objectData.containsKey('last')) {
        context._objectData.['lastName'] = name.last;
      }
    }
    
    if (user._objectData.containsKey('email')) {
      context._objectData.['email'] = user.email;
    }
    
    context._objectData.['type'] = 'user';
    
    return context;
  }
}