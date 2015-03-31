all:
	$(MAKE) -C skisse skisse.pdf
	$(MAKE) -C rapport rapport.pdf

clean:
	$(MAKE) -C skisse clean
	$(MAKE) -C rapport clean
