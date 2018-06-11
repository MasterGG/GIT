objects = key_schedule.o gfmul.o aes_gcm.o \
	decrypt.o test_aes.o
Flags = -O3 -maes -mavx2 -mpclmul -march=native
edit : $(objects)
	gcc -o edit  $(Flags) -g $(objects)

test_aes.o: test_aes.c
	gcc -c $(Flags) test_aes.c 
decrypt.o: decrypt.c
	gcc -c $(Flags) decrypt.c
aes_gcm.o: aes_gcm.s 
	gcc -c $(Flags) aes_gcm.s
gfmul.o: gfmul.s
	gcc -c $(Flags) gfmul.s
key_schedule.o: key_schedule.c
	gcc -c $(Flags) key_schedule.c
clean:
	rm -rf edit $(objects)
