src=$(wildcard *.s)
obj=$(src:.s=.o)
exe=z

all: run

run: z
	@./z

%.o: %.s
	@as -o $@ $<

z: $(obj)
	@ld $^ -o z
	@rm $(obj)


