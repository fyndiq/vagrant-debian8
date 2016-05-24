.PHONY : all clean packer

all : packer

packer:
	cd packer && \
	packer build debian-8-amd64.json

clean:
	rm -rf packer/{build,packer_cache} 2>/dev/null
