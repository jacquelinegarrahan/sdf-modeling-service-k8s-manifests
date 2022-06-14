NAMESPACE ?= modeldb

operator-helm:
	helm repo add mysql-operator https://mysql.github.io/mysql-operator/
	helm repo update
	helm template mysql-operator mysql-operator/mysql-operator --namespace=$(NAMESPACE) > mysql-operator.yaml
	curl https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-crds.yaml > mysql-crd.yaml

operator-yaml:
	curl https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-operator.yaml > mysql-operator.yaml
	curl https://raw.githubusercontent.com/mysql/mysql-operator/trunk/deploy/deploy-crds.yaml > mysql-crd.yaml
 
operator: operator-helm

dump:
	kubectl kustomize .

run-apply:
	kubectl apply -k .

apply: operator run-apply
	
