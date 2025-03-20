build_i:
	cpp -o main.i main.c

build_s:
	gcc -S -o main.s main.i

build_o:
	as -o main.o main.s

build:
	make build_i
	make build_s
	make build_o

