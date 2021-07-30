PROGRAM := updlist.exe
PREFIX := i686-w64-mingw32-
SUFFIX := -win32
CXX := $(PREFIX)g++$(SUFFIX)
WINDRES := $(PREFIX)windres
SRCS := $(shell find . -name '*.cpp')
DEPS := $(SRCS:%.cpp=%.d)
OBJS := $(SRCS:%.cpp=%.o)
CXXFLAGS := -O0 -DUNICODE -D_UNICODE -mwin32 -municode --static -static-libgcc -static-libstdc++
SUFFIXES := .cpp .o .d
LIBS := -l version -l shlwapi -l crypt32

.PHONY: all clean

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
