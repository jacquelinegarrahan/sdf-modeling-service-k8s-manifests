

apply:
	cd mongo-operator && make apply
	cd mysql-operator && make apply 
	kubectl apply -k .
