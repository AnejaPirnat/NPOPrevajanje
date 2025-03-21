all: 
	make build
	make run

run:
	./demo_gcc

clean:
	rm -f main.i main.s main.o demo_gcc

build_i:
	cpp -m32 -o main.i main.c

build_s:
	gcc -m32 -S -o main.s main.i

build_o:
	as --32 -o main.o main.s

build: 
	make build_i
	make build_s
	make build_o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o demo_gcc /usr/lib32/crt1.o main.o -lc

