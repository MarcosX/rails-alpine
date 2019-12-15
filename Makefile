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
	sed 's/IMG_TAG/latest/g; s/IMG_NAME/local\/rails-alpine/g' Dockerfile.test > Dockerfile.test.local && \
		docker build . -f Dockerfile.test.local -t local/test-image && \
		docker run --name test-image -p 3000:3000 --rm -d local/test-image && \
		echo 'Waiting for docker container to be ready...' && sleep 7 && \
		curl -s -o /dev/null -w "Response code: %{http_code}\n" localhost:3000 && \
		echo 'Stopping test container' && docker stop test-image
