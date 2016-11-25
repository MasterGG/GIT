CXX := gcc
CXX_FLAGS := -std=c++11
ARM_CXX := armv7a-mediatek451_001_vfp-linux-gnueabi-g++
ARM_CXX_FLAGS := -mfloat-abi=softfp -mfpu=neon

all : memcpy test
.PHONY : all

memcpy : main.o data_create.o memcpy_unloop.o memcpy_word.o 
	$(CXX)  -o memcpy main.o data_create.o memcpy_unloop.o memcpy_word.o 

test : test.o data_create.o memcpy_unloop.o 
	gcc -o test data_create.o memcpy_unloop.o test.o

test.o :test.c
	gcc -c test.c
main.o :main.c
	gcc -c main.c 

data_create.o :data_create.c
	gcc -c data_create.c

memcpy_unloop.o :memcpy_unloop.c
	gcc -c memcpy_unloop.c

memcpy_word.o :memcpy_word.c
	gcc -c memcpy_word.c

.PHONY : clean
clean:
	rm *.o *.txt memcpy memcpy test
