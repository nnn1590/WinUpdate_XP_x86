PROGRAM := updlist.exe
PREFIX := i686-w64-mingw32-
SUFFIX := -win32
CXX := $(PREFIX)g++$(SUFFIX)
WINDRES := $(PREFIX)windres
#OBJS := banner.o certificates.o cmpupdate.o fver.o help.o kb2900986.o kb914798.o kb980195.o mbsa.o nfxdetect.o nfxupdate.o notify.o options.o registry.o script.o stdafx.o trim.o updlist.o vcredist.o winsku.o winupdate.o
SRCS := $(shell find . -name '*.cpp')
DEPS := $(SRCS:%.cpp=%.d)
OBJS := $(SRCS:%.cpp=%.o)
CXXFLAGS := -O0 -DUNICODE -D_UNICODE -mwindows -mwin32 -municode
SUFFIXES := .cpp .o .d
LIBS := -l version -l shlwapi -l crypt32

.PHONY: all clean

#all: /dev/null /dev/zero
#	echo $@ $?

all: $(PROGRAM)

-include $(DEPS)

$(PROGRAM): $(OBJS) updlist.res
	$(CXX) $(CXXFLAGS) -o $(PROGRAM) $^ $(LIBS)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -MMD -MP $<

updlist.res: updlist.rc
	$(WINDRES) --output-format=coff -o $@ $<

clean:
	$(RM) $(OBJS) $(DEPS) updlist.res $(PROGRAM)
