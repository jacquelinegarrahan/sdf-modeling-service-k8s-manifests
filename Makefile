
MODELDB_SECRET_PATH=secret/ard/ard--dev/mysql

secrets:
	mkdir -p etc/.secrets/
	# modeldb
	set -e; for i in rootPassword; do vault kv get --field=$$i $(MODELDB_SECRET_PATH) > etc/.secrets/$$i ; done

clear-secrets:
	rm -rf etc/.secrets/

run-apply:
	cd mongo-operator && make apply
	cd mysql-operator && make apply 
	kubectl apply -k .

apply: secrets run-apply clear-secrets
