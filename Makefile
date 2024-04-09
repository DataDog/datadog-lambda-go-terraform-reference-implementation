.PHONY: build clean deploy

build:
	GOARCH=arm64 GOOS=linux go build -tags lambda.norpc -o ./build/bin/bootstrap
	(cd build/bin && zip -FS bootstrap.zip bootstrap)
clean:
	rm -rf ./build

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy
