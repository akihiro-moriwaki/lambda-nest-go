.PHONY: deps build start deploy

deps:
	go get -u ./...

build:
	sam build -t templates/dev/template.yaml

start:
	sam local start-api

deploy:
	@make build
	aws cloudformation package --template-file .aws-sam/build/template.yaml --s3-bucket $(BUCKET_NAME) --s3-prefix $(PREFIX_NAME) --output-template-file package.yaml --profile $(AWS_PROFILE)
	aws cloudformation deploy --template-file package.yaml --stack-name lambda-go-nest --profile $(AWS_PROFILE) --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND
