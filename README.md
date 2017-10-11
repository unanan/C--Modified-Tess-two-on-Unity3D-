# Android.mk-in-Tess-two

1.Included some changes in the file: Android.mk


2.Prevent to output several lib*.so(s) with internal dependencies.


3.The single output library: 

libtess.so 

can used in Unity3D project, since a Unity3D project on Android or IPhone doesn't support multiple dependencies of libraries.

###########################
由于有需要将tesseract整合进Unity3D中，而Unity3D中不支持.so等库的多依赖问题（就是生成的libtess.so会调用另一个liblept.so）。

因此将其（4个库）合并为一个。

涉及Android.mk配置文件的编写，涉及众多编译过程中的标志位的配置。

其中越过很多坑，减少网友的时间成本，现post到github主页上供各位下载使用。

############################
P.S. The reason for using Tess-two but not the original source of Tesseract is that from the official version of Tesseract, I couldn't find the Android.mk and Application.mk, which are essencial for building a library of Android application.
