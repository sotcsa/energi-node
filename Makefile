all: docker/build security/check docker/publish


docker/build:
	docker build -t sotcsa/energi .
	docker tag sotcsa/energi sotcsa/energi:$$(git log -1 --format=%h)

security/check:
	docker run aquasec/trivy image sotcsa/energi

docker/publish:
	docker push sotcsa/energi
	docker push sotcsa/energi:$$(git log -1 --format=%h)
	