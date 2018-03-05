.PHONY: build
build:
	@mix escript.build

.PHONY: install
install:
	@mv desk ~/local/bin
