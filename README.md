# XKRouter
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XKRouter是一款基于URL标准的、用于iOS系统的路由跳转策略。设计XKRouter最大的目的就是希望以后所有的页面跳转可以随心所欲的控制，不再受限于层级、状态、跳转方式、动画效果。当然了，这是一个美好的想法。所有美好的建筑，都是一砖一瓦积累出来的，一步一步走，一点一点实现，让它越来越完善。

## 一、XKRouter简介
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XKRouter是一款基于URL标准的、用于iOS系统的路由跳转策略。可以帮助使用者将零散的push/dismiss集中到一个路由核心当中，界面跳转也不再是硬编码的形式。如果与后台配合得当，所有的页面跳转，均可交由后台来控制，这样就可以更好的控制App。

重点重点，敲黑板了啊，目前，cocoapods上已经更新了 **1.0.1** 版本
直接：

`pod 'XKRouter'`

即可使用！


## 二、XKRouter用法
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在GitHub的[demo](https://github.com/buyu03/XKRouter)里已经给出了对应的例子，操作非常简单，注册完，调用一行代码即可跳转。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在这里，做一个提醒（敲黑板敲黑板），路由节点的注册务必在跳转之前，建议在XKRouter的基础上封装一层，这一层面向业务，推荐在appdelegate的

`- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions`

中进行统一注册，比如demo里的：**XKRouterConfigure**类，就是统一管理全局路由注册的地方。另外，在配置对应的path的时候，尽量使用全局静态常量的形式，防止在其他地方写错要跳转的URL地址，使用全局静态常量的话，只要配置一次，后面直接调用就好了，也不会出错，就算是真的把URL配置错了，也不会出现太大的影响，除非你错的很离谱（ps：此处请自行体罚）。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;另外，在定义跳转URL的时候，请按照URL的规范来，如：scheme://host/path，这样的形式，不要用不完整的URL，我们要优雅一点，然后再优雅一点。当然了，目前XKRouter只能解析常见的URL，对fragment暂时没有做处理，会在后期的版本中进行完善。

## 三、XKRouter的设计思路以及相关类的作用

### 1、设计思路
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其实，XKRouter的设计思路目前是很常见的，用一个URL去定位一个页面，这样可以解决界面跳转的硬编码问题，同时降低耦合，可以说将两个相关联页面之间的偶尔降到了最低（仅数据耦合）。基于这个思路，实现的过程中，就会涉及到URL的解析，URL与对应页面的关系绑定（强调一下，XKRouter注册的是一个VC初始化的过程，而非结果）等等。概念的东西我们不多说，通过代码来实际了解具体的实现过程

### 2、相关类
- XKRouter:相当于路由的manager，包含一下路由相关方法：

```
// 获取对应host的路由线路（XXRouterDefinition包含该路由线路下所有路由节点XKRouteNode）
+ (XXRouterDefinition *)routerDefinitionForHost:(NSString *)host;

// 直接注册路由线路
+ (void)registerRouterDefinition:(XXRouterDefinition *)routerDefinition;

// 移除对应host的路由线路
+ (void)unregisterRouterDefinitionForHost:(NSString *)host;
// 移除所有路由线路
+ (void)unregisterAllRouterDefinitions;

// 通过 url 注册一个路由节点（XKRouteNode）
+ (void)addRouteNodeForUrl:(NSString *)url handler:(UIViewController * _Nullable (^)(NSDictionary * _Nullable parameters))handlerBlock;

// 通过 url 移除一个路由节点
+ (void)removeRouteNodeForUrl:(NSString *)url;
// 移除 host 下所有路由节点
+ (void)removeAllRouteNodesForHost:(NSString *)host;
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XKRouter中有一个 **routerDefinitions** 属性，用于存储所有的路由线路（XKRouteDefinition），以注册路由节点时的URL的host作为key，以产生的XKRouteDefinition对象作为值，存储在 **routerDefinitions** 中，具体来说其存储形式为：

`{URL.host : routeDefinition}`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下面是 **XKRouter** 提供的两种跳转方案，push和present：

```
// 默认动画跳转接口
+ (BOOL)pushToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters;
+ (void)popFromViewController:(UIViewController *)viewController;

// 自定义动画跳转接口
+ (BOOL)pushToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters animationType:(XKPushAnimationType)animationType;
+ (void)popFromViewController:(UIViewController *)viewController animationType:(XKPopAnimationType)animationType;

+ (BOOL)presentToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters;
+ (void)dismissFromViewController:(UIViewController *)viewController;
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;两种跳转方案参数都可为空，也可以通过url带参，不管以哪种形式，所有传入的参数最终都会在路由节点注册方法的block里，以parameters的形式展现，即：block里的parameters = 本地传参 + url传参，具体可以看下面的调用方式，在demo里也有说明：

```
// 注册
[XKRouter addRouteNodeForUrl:PROFILE_PATH handler:^UIViewController * _Nullable(NSDictionary * _Nullable parameters) {
    XKProfileViewController *profileViewController = [[XKProfileViewController alloc] init];
    profileViewController.userName = [parameters objectForKey:@"userName"];
    profileViewController.password = [parameters objectForKey:@"password"];
    profileViewController.sex = [parameters objectForKey:@"sex"];
    
    return profileViewController;
  }];
  
  // 调用
  [XKRouter presentToUrl:[NSString stringWithFormat:@"%@?userName=小明&password=123456", PROFILE_PATH] sourceViewController:self parameters:@{@"sex" : @"男"}];

```

- XKRouterDefinition:XKRouter的内部类

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XKRouterDefinition的主要作用是存储某一线路下的所有路由节点（XKRouteNode）。比如你的应用有三个tab：首页，消息，我的。那么，建议将路由通过host拆分成三个线路，首页以及所有首页的子页面为一个线路，消息和我的tab同理，类似于导航栈一样。这样设计的原因是希望路由的线路能够更加清晰，而不是一股脑的把所有路由节点扔到一个字典里，那样是很不利于后期管理和扩展的。通过路由线路去管理，首先你的路由非常清晰，路径（path）和你的app的页面层次是一一对应的；第二，这样设计也是为了后面能把XKRouter做的更强大，比如，通过XKRouter进行页面回溯，直接返回到某一级页面，或者根据路径直接跳转到某个页面，并且将该页面的所有上层页面按序加入导航栈。当然了，这些只是目前的构想，后期会根据具体情况进行迭代。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XKRouterDefinition包含下面两个属性：

```
@property (nonatomic, strong) NSMutableDictionary *routeNodes;
@property (nonatomic, copy) NSString *host;
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**routeNodes** 用于存储该host下所有的路由节点（XKRouteNode），以字典作为容器，是为了提高读取的效率，同时每一个节点的权重也都是相同的。**host** 是该路由线路的唯一标识。

- XKRouteRequest、XKRouteResponse

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**XKRouteRequest** 的作用是解析url获得对应的scheme、host、path以及携带的参数，同时还和 **XKRouteResponse** 一起配合验证期望路由的节点是否合法。解析出来的参数，会在后期阶段组装到注册回调block的parameters中。**XKRouteRequest** 和 **XKRouteResponse** 是为了让整个流程更加抽象化，毕竟是面向对象编程，尽量让对象去帮助我们做想做的事情。