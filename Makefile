PKGS := $(sh go list ./... | grep -v /vendor)

.PHONY: test
test: lint
	go test $(PKGS) test/*.go

BIN_DIR := $(GOPATH)/bin
GOMETALINTER := $(BIN_DIR)/gometalinter

$(GOMETALINTER):
	go get -u github.com/alecthomas/gometalinter
	gometalinter --install

.PHONY: lint
lint: $(GOMETALINTER)
	gometalinter src/* --vendor
