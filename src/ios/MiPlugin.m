/********* MiPlugin.m Cordova Plugin Implementation *******/

//Paquetes requeridos por Cordova
#import <Cordova/CDV.h>

//API Nativo
#import <UIKit/UIKit.h>

@interface MiPlugin : CDVPlugin {
  // variables y métodos de la interface

- (void)showWidget:(CDVInvokedUrlCommand*)command;
@end

@implementation MiPlugin

- (void)showWidget:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        UIViewController *uvc = [[[UIApplication sharedApplication] keyWindow] rootViewController];

        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Mi Plugin"
                           message:echo
                           preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {}];

        [alert addAction:defaultAction];
        [uvc presentViewController:alert animated:YES completion:nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
