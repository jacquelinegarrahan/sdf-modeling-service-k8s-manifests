
SECRET_PATH=secret/ard/ard--dev/mongodb
MONGO_OPERATOR_VERSION=1.11.0

operator:
	helm repo add percona https://percona.github.io/percona-helm-charts/
	helm repo update
	helm template --version $(MONGO_OPERATOR_VERSION) mongodb-operator percona/psmdb-operator > mongo-operator.yaml
	curl https://raw.githubusercontent.com/percona/percona-helm-charts/main/charts/psmdb-operator/crds/crd.yaml > mongo-crd.yaml

operator-update:
	cd deps/mongo-operator/percona-server-mongodb-operator
	git pull

secrets:
	mkdir -p etc/.secrets/
	set -e; for i in MONGODB_BACKUP_PASSWORD MONGODB_CLUSTER_ADMIN_PASSWORD MONGODB_CLUSTER_MONITOR_PASSWORD MONGODB_USER_ADMIN_PASSWORD PMM_SERVER_PASSWORD S3_ACCESS_KEY S3_SECRET_KEY; do vault kv get --field=$$i $(SECRET_PATH) > etc/.secrets/$$i ; done

clear-secrets:
	rm -rf etc/.secrets/

dump:
	kubectl kustomize .

run-apply:
	kubectl apply -k .

apply: operator secrets run-apply clear-secrets
	
