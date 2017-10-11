#####################
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := tess


TESSERACT_PATH := $(LOCAL_PATH)/com_googlecode_tesseract_android/src
LEPTONICA_PATH := $(LOCAL_PATH)/com_googlecode_leptonica_android/src
LIBJPEG_PATH := $(LOCAL_PATH)/libjpeg
LIBPNG_PATH := $(LOCAL_PATH)/libpng


BLACKLIST_SRC_FILES := \
  %api/tesseractmain.cpp \
  %viewer/svpaint.cpp \
  %endiantest.c \
  %freetype.c \
  %xtractprotos.c

TESSERACT_SRC_FILES := \
  $(wildcard $(TESSERACT_PATH)/api/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/arch/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/ccmain/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/ccstruct/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/ccutil/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/classify/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/cube/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/cutil/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/dict/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/lstm/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/neural_networks/runtime/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/opencl/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/textord/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/viewer/*.cpp) \
  $(wildcard $(TESSERACT_PATH)/wordrec/*.cpp) \
  $(wildcard $(LEPTONICA_PATH)/src/*.c)

LOCAL_SRC_FILES := \
  $(filter-out $(BLACKLIST_SRC_FILES),$(subst $(LOCAL_PATH)/,,$(TESSERACT_SRC_FILES)))

LOCAL_C_INCLUDES := \
  $(TESSERACT_PATH)/api \
  $(TESSERACT_PATH)/arch \
  $(TESSERACT_PATH)/ccmain \
  $(TESSERACT_PATH)/ccstruct \
  $(TESSERACT_PATH)/ccutil \
  $(TESSERACT_PATH)/classify \
  $(TESSERACT_PATH)/cube \
  $(TESSERACT_PATH)/cutil \
  $(TESSERACT_PATH)/dict \
  $(TESSERACT_PATH)/lstm \
  $(TESSERACT_PATH)/neural_networks/runtime \
  $(TESSERACT_PATH)/opencl \
  $(TESSERACT_PATH)/textord \
  $(TESSERACT_PATH)/viewer \
  $(TESSERACT_PATH)/wordrec \
  $(LEPTONICA_PATH)/src \
  $(LIBJPEG_PATH)

LOCAL_CPPFLAGS := --std=c++11 

LOCAL_CFLAGS := \
  -fvisibility=hidden -fomit-frame-pointer \
  -include stdlib.h \
  -Wno-pointer-sign \
  -Wno-implicit-function-declaration \
  -DGRAPHICS_DISABLED \
  -DANDROID_NDK \
  -DHAVE_CONFIG_H \
  -DUSE_STD_NAMESPACE \
  -D'VERSION="Android"' \
  -include ctype.h \
  -include unistd.h \
  -fpermissive \
  -ftrapv \
  -Wno-deprecated \
  #-Wno-shift-negative-value \
  -D_GLIBCXX_PERMIT_BACKWARD_HASH   # fix for android-ndk-r8e/sources/cxx-stl/gnu-libstdc++/4.6/include/ext/hash_map:61:30: fatal error: backward_warning.h: No such file or directory


#LOCAL_ASFLAGS += $(common_ASFLAGS)

#LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)

# jni

LOCAL_SRC_FILES += \
  $(TESSERACT_PATH)/../pageiterator.cpp \
  $(TESSERACT_PATH)/../resultiterator.cpp \
  $(TESSERACT_PATH)/../tessbaseapi.cpp \
  $(LEPTONICA_PATH)/../box.cpp \
  $(LEPTONICA_PATH)/../boxa.cpp \
  $(LEPTONICA_PATH)/../pix.cpp \
  $(LEPTONICA_PATH)/../pixa.cpp \
  $(LEPTONICA_PATH)/../utilities.cpp \
  $(LEPTONICA_PATH)/../readfile.cpp \
  $(LEPTONICA_PATH)/../writefile.cpp \
  $(LEPTONICA_PATH)/../jni.cpp

LOCAL_C_INCLUDES += \
  $(TESSERACT_PATH)/.. \
  $(LEPTONICA_PATH)/.. \
  $(LEPTONICA_PATH)/src \
  $(LIBJPEG_PATH) \
  $(LIBPNG_PATH)

LOCAL_LDLIBS += \
  -latomic \
  -lz \
  -ljnigraphics \
  -llog \
  -landroid

LOCAL_LDFLAGS := \
  -fPIC \
  -llog

LOCAL_SHARED_LIBRARIES:= libjpgt libpngt
LOCAL_PRELINK_MODULE:= false

include $(BUILD_SHARED_LIBRARY)
