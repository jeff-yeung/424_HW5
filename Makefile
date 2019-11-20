CXX=g++

CXXFLAGS=-ggdb -Wall -Wextra -pedantic -fmax-errors=1 -O2
LDLIBS=

SRC=$(wildcard *.cpp) $(wildcard *.tpp)
TMP_OBJ=$(SRC:.tpp=.o)
OBJ=$(TMP_OBJ:.cpp=.o)

.PHONY: all clean perm run

all: yuvpsnr

clean:
	rm -f $(OBJ) yuvpsnr

# Run this to give executable permissions (on Linux)
perm: yuvpsnr
	chmod +x yuvpsnr

# Question 1a.
run: yuvpsnr
	./yuvpsnr glas40_test.qcif glas40.qcif 12 12 10


# Generate executables
# This seems to be generally correct for my case
yuvpsnr: yuvpsnr.o bits.o xform.o arith.o vidcodeclib.o videnc.o viddec.o quant.o 
	$(CXX) $(CXXFLAGS) $(LDLIBS) -o yupsnr yuvpsnr.o bits.o xform.o arith.o vidcodeclib.o videnc.o viddec.o quant.o

# Compile into object files
yuvpsnr.o: yuvpsnr.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c yuvpsnr.cpp
bits.o: bits.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c bits.cpp
xform.o: xform.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c xform.cpp
arith.o: arith.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c arith.cpp
vidcodeclib.o: vidcodeclib.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c vidcodeclib.cpp
videnc.o: videnc.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c videnc.cpp
viddec.o: viddec.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c viddec.cpp
quant.o: quant.cpp
	$(CXX) $(CXXFLAGS) $(LDLIBS) -c quant.cpp