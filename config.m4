dnl $Id$
dnl config.m4 for extension extensions

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(extensions, for extensions support,
dnl Make sure that the comment is aligned:
dnl [  --with-extensions             Include extensions support])

dnl Otherwise use enable:

dnl PHP_ARG_ENABLE(extensions, whether to enable extensions support,
dnl Make sure that the comment is aligned:
dnl [  --enable-extensions           Enable extensions support])

if test "$PHP_EXTENSIONS" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-extensions -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/extensions.h"  # you most likely want to change this
  dnl if test -r $PHP_EXTENSIONS/$SEARCH_FOR; then # path given as parameter
  dnl   EXTENSIONS_DIR=$PHP_EXTENSIONS
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for extensions files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       EXTENSIONS_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$EXTENSIONS_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the extensions distribution])
  dnl fi

  dnl # --with-extensions -> add include path
  dnl PHP_ADD_INCLUDE($EXTENSIONS_DIR/include)

  dnl # --with-extensions -> check for lib and symbol presence
  dnl LIBNAME=extensions # you may want to change this
  dnl LIBSYMBOL=extensions # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $EXTENSIONS_DIR/$PHP_LIBDIR, EXTENSIONS_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_EXTENSIONSLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong extensions lib version or lib not found])
  dnl ],[
  dnl   -L$EXTENSIONS_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(EXTENSIONS_SHARED_LIBADD)

  PHP_NEW_EXTENSION(extensions, extensions.c, $ext_shared)
fi
