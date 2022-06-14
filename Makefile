
MODELDB_SECRET_PATH=secret/ard/ard--dev/mysql

secrets:
	# resultsdb
	cd mongo-operator && make secrets
	# modeldb
	mkdir -p etc/.secrets/
	set -e; for i in rootPassword; do vault kv get --field=$$i $(MODELDB_SECRET_PATH) > etc/.secrets/$$i ; done

clear-secrets:
	rm -rf etc/.secrets/
	cd mongo-operator && make clear-secrets

run-apply:
	kubectl apply -k .

apply: secrets run-apply clear-secrets
