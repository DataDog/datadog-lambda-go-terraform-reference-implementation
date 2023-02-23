.PHONY: build clean deploy

build:
		GOOS=linux GOARCH=amd64 go build -v -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -o build/bin/app main.go

clean:
	rm -rf ./build

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply --auto-approve

destroy:
	terraform destroy --auto-approve
