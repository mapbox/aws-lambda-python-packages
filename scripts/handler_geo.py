"""handler_geo"""

import rasterio
import fiona
import shapely
import mercantile
import supermercado
import psycopg2


def handler(event, context):
    """
    Handle bounds requests
    """
    print(event, context)

    return True
