src=$(wildcard *.c ./sub/*.c)
src2=*.c  ./sub/*.c
dir=$(notdir $(src))
object=$(patsubst %.c,%.o,$(dir))
all:
	@echo $(src2)
	@echo $(src)
	@echo $(dir)
	@echo $(notdir ./sub/*.c)
	@echo $(object)
	@echo "end"
