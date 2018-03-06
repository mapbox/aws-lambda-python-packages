"""handler_rio"""

import rasterio


def handler(event, context):
    """
    Handle bounds requests
    """
    print(event, context)

    return True
