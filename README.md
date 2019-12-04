# rails-alpine
Rails ready docker image based on Alpine

```
make buildlocal && make testlocal
```

# Sample Dockerfile

```
FROM marcosx/rails-alpine

# Add db specific libraries
RUN apk add --no-cache --update sqlite-dev

# Create layers for gems to allow for efficient caching
WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .
# Use as much cpu as possible to parallelize download
RUN bundle install --jobs $(grep -c 'cpu cores' < /proc/cpuinfo) --retry 3

# Copy application code and start rails server
COPY . .
EXPOSE 3000

# Bind to 0.0.0.0 to ensure localhost routing works as expected
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
```
