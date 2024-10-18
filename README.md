# flutter_completer_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


####

A Completer is an object used to manually complete a Future. When you create a Future, 
it represents a value that will be available at a later time. To manage this manually, we use a Completer. 

Imagine you’re ordering an item from an e-commerce app. After placing the order, you wait for the product to be delivered to your doorstep. In this scenario, the package you ordered represents the Future, and the person delivering it is the Completer.
The delivery person, like the Completer, has an app to complete the task of delivery. When the delivery person arrives at your doorstep, they mark the product as delivered, ask for the OTP, and confirm the delivery. This confirmation updates the status of the Future in your app, thanks to the Completer.
This is how a Completer works in Flutter.

Think of Completer like a Remote Control.
Think of Future like a Timer.

