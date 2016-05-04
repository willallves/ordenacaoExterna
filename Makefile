all: compilar_objeto compilar_binario

compilar_objeto:
	gcc -c ./src/gerar_arquivo_main.c ./src/gerar_arquivo.c
	gcc -c ./src/ordenar_arquivo_main.c ./src/ordenar_arquivo.c
	gcc -c ./src/ler_arquivo_gerado.c


compilar_binario:
	gcc gerar_arquivo_main.o gerar_arquivo.o -o gerador -lm
	gcc ordenar_arquivo_main.o ordenar_arquivo.o -o ordenar -lm
	gcc ./src/ler_arquivo_gerado.o -o ler

gerar:
	./gerador 1GB.bin 1000
#	./gerador 6GB.bin 6000

ordenar:
	./ordenar 1GB.bin out1GB.bin 100 10
#	./ordenar 6GB.bin out6GB.bin 600 10

ler:
	./ler 1GB.bin > 1GB.txt
	./ler out1GB.bin > out1GB.txt

excluir:
	rm -f *.o *.out *.bin
