PACKAGE=rabbitmq-empty-plugin
APPNAME=rabbit_empty_plugin # BUGBUG:  Plugin dev guide may need update?
DEPS=
INTERNAL_DEPS=
RUNTIME_DEPS=

include ../include.mk

# BUGBUG:  Hack...  I wouldn't have thought I'd needed this
ebin/$(APPNAME).app:
