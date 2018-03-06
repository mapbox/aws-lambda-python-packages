# aws-lambda-python

How to create powerful AWS lambda python function that fits in a 250Mb package

More info: https://blog.mapbox.com/

##### Requirement
  - Docker (https://docs.docker.com/install/)

## Lambda package

### Rasterio

Lightweight python package with rasterio

- Modules:
  - numpy
  - rasterio (v1.0a12)
- Command: `make rasterio`
- Package size: 26.8Mb (95.9Mb)

### Image

Adding simple image processing modules

- Modules:
  - numpy
  - rasterio (v1.0a12)
  - Wand (ImageMagick)
  - Pillow (PIL)
- Command: `make image`
- Package size: 32.7Mb (113.8Mb)

### OpenCV

Image processing using OpenCV

- Modules:
  - numpy
  - rasterio (v1.0a12)
  - python-OpenCV (cv2)
- Command: `make opencv`
- Package size: 51.5Mb (166.8Mb)

### Geospatial

A complete suite of geospatial modules, using GDAL minimal driver support.

- Modules:
  - numpy
  - rasterio (v1.0a12)
  - shapely
  - mercantile
  - supermercado
  - fiona
  - psycopg2
- Command: `make geospatial`
- Package size: 27.7Mb (87.9Mb)


### Image Analysis / Machine learning ready

- Modules:
  - numpy
  - scipy
  - scikit-learn
  - rasterio
- Command: `make scipy`
- Package size: 44.8Mb (148Mb)


## Links
- libs included on AWS Lambda https://gist.github.com/vincentsarago/acb33eb9f0502fcd38e0feadfe098eb7

- Python modules included on AWS Lambda https://gist.github.com/gene1wood/4a052f39490fae00e0c3#file-all_aws_lambda_modules-txt

- How to create lightweight lambda package inspiration from https://github.com/jamesandersen/aws-machine-learning-demo/blob/master/keras-deeplearning/deploy-model/build-lambda-pkg.sh

- AWS Lambda docs http://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html

- scikit-learn on AWS Lambda https://serverlesscode.com/post/deploy-scikitlearn-on-lamba/
