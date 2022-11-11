all: docker/build security/check docker/publish


docker/build:
	docker build -t sotcsa/energi .

security/check:
	docker run aquasec/trivy image sotcsa/energi

docker/publish:
	docker push sotcsa/energi