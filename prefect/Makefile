

helm:
	helm repo add prefecthq https://prefecthq.github.io/server/
	helm repo update
	helm template prefect-server prefecthq/prefect-server  > helm.yaml 

postgres-operator:
	#git clone https://github.com/zalando/postgres-operator.git zalando-postgres-operator/deps/postgres-operator || true
	git submodule add https://github.com/zalando/postgres-operator.git zalando-postgres-operator/deps/postgres-operator || true
	cd zalando-postgres-operator/deps/postgres-operator && git pull
	
run-apply:
	kubectl apply -k .

apply: run-apply
