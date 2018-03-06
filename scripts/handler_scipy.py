"""handler_scipy"""

import sklearn
import scipy
import numpy
import rasterio


def handler(event, context):
    """
    Handle bounds requests
    """
    print(event, context)

    return True
