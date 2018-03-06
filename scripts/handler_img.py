"""handler_img"""

import rasterio
from PIL import Image
from wand.image import Image as WImage


def handler(event, context):
    """
    Handle bounds requests
    """
    print(event, context)

    return True
