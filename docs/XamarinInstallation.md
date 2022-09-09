Xamarin Installation Instructions:
==================================


First off, you will want to make sure your Jetbrains license is up to date. If you have used the Jetbrains Toolbox recently, go there. We want to install Rider.

Rider is Jetbrains answer to Visual Studio's .sln Solution Files. With Rider you can open a .sln file, and take full advantage of the Jetbrains tools and techniques you're already familiar with! 

Once you get Rider installed, you will want to open rider, and click on:

        Tools -> Android -> SDK Manager

From here you will want to click on Android 12.0 (S)


*** Please Note that we CANNOT build for iOS unless we have a Mac. I'll see what I can do with one of the Macs in LF105. Until then we will have to build the Android SDK.


Once the rom for the Android Emulator is finished installing, you will want to install Microsoft's version of OpenJDK. It is a Java SDK that you can install really easily. Go to the following link: 

https://docs.microsoft.com/en-us/java/openjdk/download

Click where it says Windows x64 msi: 


    Windows 	x64 	msi 	microsoft-jdk-17.0.4.1-windows-x64.msi 	sha256


Launch this JDK installer, and then reload Rider.


Next you will want to install the Android NDK.

The Android NDK is a toolset that lets you implement parts of your app in native code, using languages such as C and C++. For certain types of apps, this can help you reuse code libraries written in those languages. 


Just know that we need it in order to build Xamarin apps properly with the Android Emulator.


Go to the same Android Tools Menu as earlier:

    Tools -> Android -> SDK Manager

From here click on the SDK tools tab, and install NDK.




At this point you should be able to create a device from the Rider device box at the top right of the screen. This will launch a window that is the Android Emulator.


Finally click the Play button next to your new device you've created. 


This should build the whole project, and if any errors come up, let me know, I'll see if I can push you in the right direction!

 
