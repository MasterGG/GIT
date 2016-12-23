CXX :=gcc
CXX_FLAGS :=
ARM_CXX := aarch64-linux-android-gcc
ARM_CXX_FLAGS := -mfloat-abi=softfp -mfpu=neon

#ARM_CXX := $(CXX)
#ARM_CXX_FLAGS := $(CXX_FLAGS)

all : memcpy test
.PHONY : all

memcpy : main.o data_create.o memcpy_unloop.o memcpy_word.o memcpy_neon.o 
	$(ARM_CXX) $(ARM_CXX_FLAGS)  -o memcpy main.o data_create.o memcpy_unloop.o memcpy_word.o memcpy_neon.o

test : test.o data_create.o memcpy_unloop.o memcpy_neon.o
	$(ARM_CXX) $(ARM_CXX_FLAGS) -o test data_create.o memcpy_unloop.o test.o memcpy_neon.o

test.o :test.c
	$(ARM_CXX) $(ARM_CXX_FLAGS) -c test.c
main.o :main.c
	$(ARM_CXX) $(ARM_CXX_FLAGS) -c main.c 

data_create.o :data_create.c
	$(ARM_CXX) $(ARM_CXX_FLAGS) -c data_create.c

memcpy_unloop.o :memcpy_unloop.c
	$(ARM_CXX) $(ARM_CXX_FLAGS) -c memcpy_unloop.c

memcpy_word.o :memcpy_word.c
	$(ARM_CXX) $(ARM_CXX_FLAGS) -c memcpy_word.c

memcpy_neon.o :memcpy_neon.c
	$(ARM_CXX)
.PHONY : clean
clean:
	rm *.o input_data.txt memcpy test
