build_local:
	hadolint Dockerfile && \
		docker build . -t local/rails-alpine

test_local:
		inspec exec test --no-distinct-exit -t \
		docker://$$(docker run --name local-test -it --rm -d local/rails-alpine sh) && \
		docker stop local-test

test_all:
	inspec exec linux-baseline-2.3.0 cis-docker-benchmark-2.1.0 --no-distinct-exit -t \
		docker://$$(docker run --name local-test -it --rm -d local/rails-alpine sh) && \
		docker stop local-test

test_docker:
	docker build . -f Dockerfile.test -t local/test-image && \
		docker run --name test-image -p 3000:3000 --rm -d local/test-image && \
		sleep 5 && \
		curl localhost:3000 && \
		docker stop test-image
