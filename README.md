# Android.mk-in-Tess-two

1.Included some changes in the file: Android.mk


2.Prevent to output several lib*.so(s) with internal dependencies.


3.The single output library: 

libtess.so 

can used in Unity3D project, since a Unity3D project on Android or IPhone doesn't support multiple dependencies of libraries.
