# - Try to find the Qt5 binding of the Poppler library
# Once done this will define
#
#  POPPLER_QT5_FOUND - system has poppler-qt5
#  POPPLER_QT5_INCLUDE_DIR - the poppler-qt5 include directory
#  POPPLER_QT5_LIBRARIES - Link these to use poppler-qt5
#  POPPLER_QT5_DEFINITIONS - Compiler switches required for using poppler-qt5
#

# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls

# Copyright (c) 2006, Wilfried Huss, <wilfried.huss@gmx.at>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

# Taken from kdelibs.git (http://quickgit.kde.org/index.php?p=kdelibs.git&a=tree)
# Revision fc1ab064b69be4117aac2fcab961b09f3dc7f410

find_package(PkgConfig)
pkg_check_modules(PC_POPPLERQT5 QUIET poppler-qt5)

set(POPPLER_QT5_DEFINITIONS ${PC_POPPLERQT5_CFLAGS_OTHER})

find_path(POPPLER_QT5_INCLUDE_DIR
  NAMES poppler-qt5.h
  HINTS ${PC_POPPLERQT5_INCLUDEDIR}
  PATH_SUFFIXES poppler/qt5 poppler
)

find_library(POPPLER_QT5_LIBRARY
  NAMES poppler-qt5
  HINTS ${PC_POPPLERQT5_LIBDIR}
)

set(POPPLER_QT5_LIBRARIES ${POPPLER_QT5_LIBRARY})

if (POPPLER_QT5_INCLUDE_DIR AND POPPLER_QT5_LIBRARIES)
  set(POPPLER_QT5_FOUND TRUE)
else (POPPLER_QT5_INCLUDE_DIR AND POPPLER_QT5_LIBRARIES)
  set(POPPLER_QT5_FOUND FALSE)
endif (POPPLER_QT5_INCLUDE_DIR AND POPPLER_QT5_LIBRARIES)

if (POPPLER_QT5_FOUND)
  if (NOT PopplerQt5_FIND_QUIETLY)
    message(STATUS "Found poppler-qt5: library: ${POPPLER_QT5_LIBRARIES}, include path: ${POPPLER_QT5_INCLUDE_DIR}")
  endif (NOT PopplerQt5_FIND_QUIETLY)
else (POPPLER_QT5_FOUND)
  if (PopplerQt5_FIND_REQUIRED)
    message(FATAL_ERROR "Could NOT find poppler-qt5")
  endif (PopplerQt5_FIND_REQUIRED)
endif (POPPLER_QT5_FOUND)

mark_as_advanced(POPPLER_QT5_INCLUDE_DIR POPPLER_QT5_LIBRARIES)
