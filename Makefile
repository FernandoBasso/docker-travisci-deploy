##
# These are only really useful if we didn't have ‘docker-compose.yml’.
# Use ‘docker-compose up --build’ instead.
#
image-react-build:
	docker build \
		--tag fernandobasso/react:latest \
		--file Dockerfile.dev .

container-react-run: image-react-build
	docker run \
		-p 3000:3000 \
		-v /home/node/app/node_modules \
		-v "$(shell pwd):/home/node/app" \
		fernandobasso/react:latest

##
# ‘dev1’ is set in ‘docker-compose.yml’.
#
test:
	docker exec -it dev1 npm run test
