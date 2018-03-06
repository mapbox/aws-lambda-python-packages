
SHELL = /bin/bash

################################################################################
# BASES
python:
	docker build -f Dockerfiles/python2.7 --tag lambda:python2.7 .

python3:
	docker build -f Dockerfiles/python3.6 --tag lambda:python3.6 .

lambda:
	docker build -f Dockerfiles/lambda --tag lambda:runtime .

################################################################################
# BUILDS
rasterio:
	docker build -f Dockerfiles/python3.6 --tag lambda:python3.6 .
	docker build -f Dockerfiles/rasterio --tag lambda:rasterio .
	docker run --name lambda -itd lambda:rasterio
	docker cp lambda:/tmp/package.zip package_rio.zip
	docker stop lambda
	docker rm lambda

image:
	docker build -f Dockerfiles/python3.6 --tag lambda:python3.6 .
	docker build -f Dockerfiles/imagemagik --tag lambda:rasterio .
	docker run --name lambda -itd lambda:rasterio
	docker cp lambda:/tmp/package.zip package_image.zip
	docker stop lambda
	docker rm lambda

geospatial:
	docker build -f Dockerfiles/python3.6 --tag lambda:python3.6 .
	docker build -f Dockerfiles/gdal --tag lambda:gdal .
	docker build -f Dockerfiles/geospatial --tag lambda:geospatial .
	docker run --name lambda -itd lambda:geospatial
	docker cp lambda:/tmp/package.zip package_geo.zip
	docker stop lambda
	docker rm lambda

opencv:
	docker build -f Dockerfiles/python3.6 --tag lambda:python3.6 .
	docker build -f Dockerfiles/opencv --tag lambda:opencv .
	docker run --name lambda -itd lambda:opencv
	docker cp lambda:/tmp/package.zip package_opencv.zip
	docker stop lambda
	docker rm lambda

scipy:
	docker build -f Dockerfiles/python3.6 --tag lambda:python3.6 .
	docker build -f Dockerfiles/scipy --tag lambda:scipy .
	docker run --name lambda -itd lambda:scipy
	docker cp lambda:/tmp/package.zip package_scipy.zip
	docker stop lambda
	docker rm lambda

################################################################################
# TESTS
test-rio:
	docker build -f Dockerfiles/lambda --tag lambda:runtime .
	docker run -w /var/task/ --name lambda --volume $(shell pwd)/:/data -itd lambda:runtime
	docker exec -it lambda bash -c 'unzip -q /data/package_rio.zip -d /var/task'
	docker exec -it lambda bash -c 'pip3 install boto3 jmespath python-dateutil -t /var/task'
	docker exec -it lambda python3 -c 'from handler import handler; print(handler("test", "test"))'
	docker stop lambda
	docker rm lambda

test-image:
	docker build -f Dockerfiles/lambda --tag lambda:runtime .
	docker run -w /var/task/ --name lambda --volume $(shell pwd)/:/data -itd lambda:runtime
	docker exec -it lambda bash -c 'unzip -q /data/package_image.zip -d /var/task'
	docker exec -it lambda bash -c 'pip3 install boto3 jmespath python-dateutil -t /var/task'
	docker exec -it lambda python3 -c 'from handler import handler; print(handler("test", "test"))'
	docker stop lambda
	docker rm lambda

test-geo:
	docker build -f Dockerfiles/lambda --tag lambda:runtime .
	docker run -w /var/task/ --name lambda --env GDAL_DATA=/var/task/share/gdal --volume $(shell pwd)/:/data -itd lambda:runtime
	docker exec -it lambda bash -c 'unzip -q /data/package_geo.zip -d /var/task'
	docker exec -it lambda bash -c 'pip3 install boto3 jmespath python-dateutil -t /var/task'
	docker exec -it lambda python3 -c 'from handler import handler; print(handler("test", "test"))'
	docker stop lambda
	docker rm lambda

test-opencv:
	docker build -f Dockerfiles/lambda --tag lambda:runtime .
	docker run -w /var/task/ --name lambda --volume $(shell pwd)/:/data -itd lambda:runtime
	docker exec -it lambda bash -c 'unzip -q /data/package_opencv.zip -d /var/task'
	docker exec -it lambda bash -c 'pip3 install boto3 jmespath python-dateutil -t /var/task'
	docker exec -it lambda python3 -c 'from handler import handler; print(handler("test", "test"))'
	docker stop lambda
	docker rm lambda

test-scipy:
	docker build -f Dockerfiles/lambda --tag lambda:runtime .
	docker run -w /var/task/ --name lambda --volume $(shell pwd)/:/data -itd lambda:runtime
	docker exec -it lambda bash -c 'unzip -q /data/package_scipy.zip -d /var/task'
	docker exec -it lambda bash -c 'pip3 install boto3 jmespath python-dateutil -t /var/task'
	docker exec -it lambda python3 -c 'from handler import handler; print(handler("test", "test"))'
	docker stop lambda
	docker rm lambda

################################################################################
clean:
	docker stop lambda
	docker rm lambda
