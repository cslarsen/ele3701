TARGETS := alarmer-land.pdf

all: $(TARGETS)

alarmer-land.pdf: landet.r
	Rscript $<

clean:
	rm -f $(TARGETS)
