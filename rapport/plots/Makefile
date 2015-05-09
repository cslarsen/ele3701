TARGETS := alarmer-land.pdf fylker-2014.pdf

all: $(TARGETS)

fylker-2014.pdf: fylker-2014.r
	Rscript $<

alarmer-land.pdf: landet.r
	Rscript $<

clean:
	rm -f $(TARGETS)
