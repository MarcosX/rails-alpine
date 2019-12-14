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
