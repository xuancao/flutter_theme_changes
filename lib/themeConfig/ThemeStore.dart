import 'package:flutter/material.dart' show StreamBuilder;
import 'package:flutter_theme_changes/themeConfig/ThemeModel.dart' show ThemeModel;
import 'package:provide/provide.dart';
import 'package:provide/provide.dart' show Provider,Provide,ProviderNode,Providers,ProvideMulti,ProviderScope;


class ThemeStore {

  static dynamic storeCtx = null;
  static dynamic widgetCtx = null;

  // 将会在main.dart中runAPP实例化init
  static init({model, child, dispose = true}) {
    final providers = Providers()
//      ..provide(Provider.value(UserModel())) ///需要管理多个状态只需要依次添加
      ..provide(Provider.value(ThemeModel()));

    return ProviderNode(child: child, providers: providers, dispose: dispose,);
  }

  ///设置数据层上下文
  static setStoreCtx(context){
    storeCtx = context;
  }

  ///设置Widget上下文
  static setWidgetCtx(context){
    widgetCtx = context;
  }

  /// 获取对应代泛型model类调对应调方法 eg： ThemeStore.valueNotCtx<ThemeModel>().getTheme();
  static T valueNotCtx<T>(){
    return Provide.value<T>(storeCtx);
  }

  ///根据 Context 获取  eg:   ThemeStore.value<ThemeModel>(context).getTheme();
  static T value<T>(context,{scope}){
    return Provide.value<T>(context,scope: scope);
  }

  static connect<T>({builder,child,scope}){
    return Provide<T>(builder: builder,child: child,scope: scope,);
  }


//  ///通过流的方式 监听
//  static stream<T>({builder, model, context}) {
//    return StreamBuilder<T>(
//        initialData: model,
//        stream: Provide.stream<T>(context),
//        builder: builder);
//  }
//
//  /// 链接多个类型
//  static multi(
//      {builder,
//        child,
//        List<Type> requestedValues,
//        Map<ProviderScope, List<Type>> requestedScopedValues}) {
//    return ProvideMulti(
//        builder: builder,
//        child: child,
//        requestedValues: requestedValues,
//        requestedScopedValues: requestedScopedValues);
//  }

}