PROGRAM := updlist.exe
PREFIX := i686-w64-mingw32-
SUFFIX := -win32
CXX := $(PREFIX)g++$(SUFFIX)
WINDRES := $(PREFIX)windres
SRCS := $(shell find . -name '*.cpp')
DEPS := $(SRCS:%.cpp=%.d)
OBJS := $(SRCS:%.cpp=%.o)
SPECS := $(PREFIX)g++$(SUFFIX).specs
CXXFLAGS := -specs=$(SPECS) -DUNICODE -D_UNICODE -mwin32 -municode --static -static-libgcc -static-libstdc++
SUFFIXES := .cpp .o .d
LIBS := -lversion -lshlwapi -lcrypt32 -lmsvcr120

.PHONY: all clean

all: $(PROGRAM)

-include $(DEPS)

$(PROGRAM): $(SPECS) $(OBJS) updlist.res
	$(CXX) $(CXXFLAGS) -o $(PROGRAM) $(OBJS) updlist.res $(LIBS)

.cpp.o: $(SPECS)
	$(CXX) $(CXXFLAGS) -c -MMD -MP $<

updlist.res: updlist.rc
	$(WINDRES) --output-format=coff -o $@ $<

$(SPECS):
	$(CXX) -dumpspecs | sed -e 's/-lmsvcrt/-lmsvcr120/g' > $@

clean:
	$(RM) $(OBJS) $(DEPS) updlist.res $(PROGRAM) $(SPECS)
