GOARCH = amd64

NAME = vault-plugin-secrets-catzzz

UNAME = $(shell uname -s)

ifndef OS
	ifeq ($(UNAME), Linux)
		OS = linux
	else ifeq ($(UNAME), Darwin)
		OS = darwin
	endif
endif

.DEFAULT_GOAL := all

all: fmt build start

build:
	GOOS=$(OS) GOARCH="$(GOARCH)" go build -o vault/plugins/$(NAME) cmd/main.go

start:
	vault server -dev -dev-root-token-id=root -dev-plugin-dir=./vault/plugins

enable:
	vault secrets enable -path=catzzz-secrets $(NAME)

clean:
	rm -f ./vault/plugins/$(NAME)

fmt:
	go fmt $$(go list ./...)

.PHONY: build clean fmt start enable
