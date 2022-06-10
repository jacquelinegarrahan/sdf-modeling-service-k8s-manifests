
SECRET_PATH=secret/ard/ard--dev/mysql

operator:
	helm repo add mysql-operator https://mysql.github.io/mysql-operator/
	helm repo update
	helm template mysql-operator mysql-operator/mysql-operator > mysql-operator.yaml

secrets:
	mkdir -p etc/.secrets/
	set -e; for i in rootPassword; do vault kv get --field=$$i $(SECRET_PATH) > etc/.secrets/$$i ; done

clear-secrets:
	rm -rf etc/.secrets/

dump:
	kubectl kustomize .

run-apply:
	kubectl apply -k .

apply: operator secrets run-apply clear-secrets
	
