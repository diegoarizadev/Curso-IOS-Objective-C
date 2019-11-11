//
//  AppDelegate.m
//  PlanetCollections
//
//  Created by Alejandro Ariza on 10/15/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Se llama cuando se está creando una nueva sesión de escena.
    // Utilice este método para seleccionar una configuración con la que crear la nueva escena.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Se llama cuando el usuario descarta una sesión de escena.
    // Si alguna de las sesiones se descartó mientras la aplicación no se estaba ejecutando, esto se llamará poco después de la aplicación:didFinishLaunchingWithOptions.
    // Utilice este método para liberar cualquier recurso que fuera específico para las escenas descartadas, ya que no volverán.
}


@end
