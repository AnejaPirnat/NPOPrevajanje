all: 
	make build
	make run

run:
	./demo_gcc

#-f je force
clean:
	rm -f main.i main.s main.o demo_gcc

#-m32 generira 32 bit kodo
#-o pomeni output
build_i:
	cpp -m32 -o main.i main.c

#gcc prevaja C kodo v asembler
#-S outputa assembly kodo (.s)
build_s:
	gcc -m32 -S -o main.s main.i

#--32 pove assemblerju da generira 32 bit kodo
build_o:
	as --32 -o main.o main.s

#ld je GNU linker
#-m elf_i386 naredi 32bit ELF format
#-lc linka
build: 
	make build_i
	make build_s
	make build_o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o demo_gcc /usr/lib32/crt1.o main.o -lc

