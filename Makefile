pre: 
		minikube addons enable ingress


helm:
		@helmfile apply

create: 
		@minikube start --vm-driver=virtualbox

up: create pre helm

passwd:
		@echo "JENKINS:"
		@kubectl get secret -n jenkins jenkins -o json | jq -r '.data."jenkins-admin-password"' | base64 -d