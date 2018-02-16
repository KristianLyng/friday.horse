all:  $(addsuffix .txt,$(basename $(wildcard horse*.jpg))) horse-14.txt

# I'm lazy
horse-14.jpg:
	cp horse-1.jpg horse-14.jpg
horse-%.txt: horse-%.pbm
	pbmtoascii $< > $@
horse-%.pbm: horse-%.jpg Makefile
	convert $< -scale 100x100 $@
