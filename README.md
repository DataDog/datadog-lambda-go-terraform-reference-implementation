# Datadog-Lambda-Go Reference Implementation using Terraform

## Contents

- Makefile  
- README.md  

-  main.tf: Sets up the Terraform provider and some variables
-  apigateway.tf: Sets up API Gateway so we can call our Lambda function via HTTPS
-  lambda.tf: Sets up the Lambda function, adds Datadog Extension and environment variables. Set your `DD_API_KEY` or `DD_API_KEY_SECRET_ARN` here.

-  main.go: Our lambda function. Instrumented using `Datadog-Lambda-Go`. 
-  go.mod: Dependencies for the lambda function
-  go.sum: Resolved dependencies


## Deploying

- Ensure your `AWS_ACCESS_KEY_ID` and `AWS_ACCESS_SECRET_KEY` environment variables are set.
- Set `DD_SITE` and  `DD_API_KEY` (or `DD_API_KEY_SECRET_ARN`) in lambda.tf. Also maybe `DD_SERVICE` and `DD_ENV`. 
- run `make init` to initialize your Terraform state
- run `make build` to build your Go lambda function
- run `make plan` to verify your Terraform definition has no glaring errors.
- run `make apply` to deploy your terraform function. This will output an API Gateway url.
- `curl` that URL to invoke your lambda function.


## Environment Variables
- `DD_SITE = "datadoghq.com"`: This is the Datadog datacenter you are using. Usually `datadoghq.com`
- `DD_API_KEY = "REDACTED"`: This is the Datadog API key you are using to submit metrics/logs/traces. For production use, it is recommended you add the API key to AWS Secrets Manager and use `DD_API_KEY_SECRET_ARN` instead.
- `DD_ENV = "dev"`: Your environment
- `DD_SERVICE = "go-terraform--test"`: The name of this service
- `DD_SERVERLESS_LOGS_ENABLED = "true"`: Whether or not the Extension should collect logs
- `DD_TRACE_ENABLED = "true"`: Whether or not the Extension should trace invocations

