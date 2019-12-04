buildlocal:
	docker build . -t local/rails-alpine

testlocal:
	docker build . -f Dockerfile.test -t local/test && \
		docker run -d -p 3000:3000 local/test
