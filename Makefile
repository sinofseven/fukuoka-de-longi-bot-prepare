SHELL = /usr/bin/env bash -xeuo pipefail

stack_name:=fukuoka-de-long-bot-prepare


deploy:
	poetry run sam deploy \
		--stack-name $(stack_name) \
		--template-file template.yml \
		--capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
		--no-fail-on-empty-changeset
	poetry run aws cloudformation describe-stacks \
		--stack-name $(stack_name) \
		--query Stacks[0].Outputs

destroy:
	poetry run aws cloudformation delete-stack --stack-name $(stack_name)
	poetry run aws cloudformation wait stack-delete-complete --stack-name $(stack_name)

create-sam-deploy-user-access-key:
	poetry run python scripts/create_access_key.py $(stack_name) SAMDeployUser

create-ssm-deploy-user-access-key:
	poetry run python scripts/create_access_key.py $(stack_name) SSMDeployUser

.PHONY: \
	deploy \
	destroy \
	create-sam-deploy-user-access-key \
	create-ssm-deploy-user-access-key