# **********************************************************************
#
# Copyright (c) 2003-2014 ZeroC, Inc. All rights reserved.
#
# This copy of Ice Touch is licensed to you under the terms described in the
# ICE_TOUCH_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ../..

include $(top_srcdir)/config/Make.rules

SUBDIRS		= proxy \
		  ami \
		  operations \
		  exceptions \
		  inheritance \
		  facets \
		  objects \
		  optional \
		  interceptor \
		  invoke \
		  dispatcher \
		  defaultServant \
		  defaultValue \
		  enums \
		  faultTolerance \
		  location \
		  adapterDeactivation \
		  slicing \
		  binding \
		  hold \
		  retry \
		  stream \
		  timeout \
		  hash \
		  info \
		  metrics \
		  services

$(EVERYTHING)::
	@for subdir in $(SUBDIRS); \
	do \
	    echo "making $@ in $$subdir"; \
	    ( cd $$subdir && $(MAKE) $@ ) || exit 1; \
	done
