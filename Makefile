all:  $(addsuffix .txt,$(basename $(wildcard horse*.jpg))) $(addsuffix -hd.txt,$(basename $(wildcard horse*.jpg))) horse-14.txt horse-14-hd.txt
# I'm lazy
horse-14.jpg:
	cp horse-1.jpg horse-14.jpg
horse-%.txt: horse-%.pbm
	pbmtoascii $< > $@
horse-%.pbm: horse-%.jpg Makefile
	convert $< -scale 80x80 $@
horse-%-hd.txt: horse-%-hd.pbm
	pbmtoascii $< > $@
horse-%-hd.pbm: horse-%.jpg Makefile
	convert $< -scale 500x500 $@
dist:
	-rsync --delete -a ./ www.kly.no:/home/kly/public_html/friday
