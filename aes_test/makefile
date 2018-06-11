#objects = key_schedule.o gfmul.o aes_gcm.o \
	decrypt.o test_aes.o
objects = key_schedule.o aes_gcm.o \
	decrypt.o test_aes.o

Flags = -O3 -maes -mavx2 -mpclmul -march=native -g
#Flags = -maes -mavx2 -mpclmul -g
aes_gcm : $(objects)
	gcc -o aes_gcm $(Flags) $(objects)

test_aes.o: test_aes.c
	gcc -c $(Flags) test_aes.c 
decrypt.o: decrypt.c
	gcc -c $(Flags) decrypt.c
aes_gcm.o: aes_gcm.c 
	gcc -c  $(Flags) aes_gcm.c
#gfmul.o: gfmul.c
#	gcc -c $(Flags) gfmul.c
key_schedule.o: key_schedule.c
	gcc -c $(Flags) key_schedule.c
clean:
	rm -rf aes_gcm $(objects)
