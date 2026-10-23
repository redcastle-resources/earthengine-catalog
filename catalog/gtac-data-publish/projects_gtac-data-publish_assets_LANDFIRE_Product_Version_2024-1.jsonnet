local id = 'projects/gtac-data-publish/assets/LANDFIRE/Product_Version/2024-1';
local subdir = 'gtac-data-publish';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';
local versions = import 'versions.libsonnet';
local version_table = import 'templates/LANDFIRE_2024_versions.libsonnet';
local version_config = versions(subdir, version_table, id);
local version = version_config.version;

local license = spdx.proprietary;

local bands = import 'templates/LANDFIRE_2024_bands.libsonnet';

{
  'gee:status': 'beta',
  'gee:user_uploaded': true,

  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'LANDFIRE 2024 Update ' + version,
  version: version,
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    LANDFIRE 2024 Update is a 30-meter collection of vegetation, fuel, and
    disturbance products for the conterminous United States, Alaska, Hawaii,
    and Puerto Rico and the U.S. Virgin Islands. Each image represents one
    LANDFIRE study area and exposes the same ordered band schema.

    The collection combines current vegetation structure and type, canopy and
    surface fuel products, annual and preliminary disturbance products, and
    vegetation condition products. LANDFIRE creates these products from field
    and lidar reference data, satellite imagery, biophysical gradients,
    predictive landscape models, disturbance events, fire-program data, and
    remotely sensed landscape change. Derived disturbance bands provide
    normalized status, type, severity, and timing codes alongside the original
    LANDFIRE source codes.

    CFFDRS source data are available only for Alaska. SClass, VCC, and VDep
    source data are unavailable for Puerto Rico and the U.S. Virgin Islands.
    Images outside those source regions contain fully masked placeholder bands
    so all images remain homogeneous.

    Although LANDFIRE products are delivered at 30-meter resolution, they are
    intended for national, regional, and large subregional planning. Individual
    pixels or small groups of pixels should not be used without local review.
    Product applicability varies by layer, location, and use.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + version_config.version_links + [
    ee.link.license('https://www.landfire.gov/'),
    {
      rel: ee_const.rel.source,
      href: 'https://www.landfire.gov/data',
    },
  ],
  'gee:categories': ['fire', 'landuse-landcover'],
  keywords: [
    'disturbance',
    'fire',
    'fuel',
    'landcover',
    'landfire',
    'usda',
    'usfs',
    'usgs',
    'vegetation',
    'wildfire',
  ],
  providers: [
    ee.producer_provider(
      'LANDFIRE, U.S. Department of Agriculture Forest Service and U.S. '
      + 'Department of the Interior Geological Survey',
      'https://www.landfire.gov/'
    ),
    ee.host_provider(version_config.ee_catalog_url),
  ],
  extent: ee.extent(-175.1, 17.52, -63.66, 71.48,
                    '2023-10-01T00:00:00Z', '2024-10-01T00:00:00Z'),
  summaries: {
    gsd: [30],
    'gee:schema': [
      {
        name: 'study_area',
        description: |||
          LANDFIRE study area. Values are CONUS, AK, HI, and PRVI.
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'year',
        description: 'LANDFIRE product year.',
        type: ee_const.var_type.string,
      },
      {
        name: 'landfire_ver',
        description: 'LANDFIRE semantic version.',
        type: ee_const.var_type.string,
      },
      {
        name: 'landfire_version_name',
        description: 'LANDFIRE version name, such as LF_2024.',
        type: ee_const.var_type.string,
      },
      {
        name: 'landfire_version_number',
        description: 'Integer LANDFIRE version number, such as 250.',
        type: ee_const.var_type.int,
      },
    ],
    'eo:bands': bands.eo_bands,
    'gee:visualizations': bands.visualizations,
  },
  'sci:citation': |||
    LANDFIRE. 2024. LANDFIRE 2024 Update, LANDFIRE 2.5.0. U.S.
    Department of the Interior, U.S. Geological Survey, and U.S. Department
    of Agriculture, Forest Service. Available from
    [LANDFIRE](https://www.landfire.gov/).
  |||,
  'sci:publications': [
    {
      citation: |||
        Picotte, J. J., Dockter, D. J., Long, J., Tolk, B., Davidson, A.,
        Peterson, B., and Gage, J. D. 2023. LANDFIRE Remap technical
        documentation. U.S. Geological Survey Open-File Report 2023-1045.
        [doi:10.3133/ofr20231045](https://doi.org/10.3133/ofr20231045).
      |||,
      doi: '10.3133/ofr20231045',
    },
  ],
  'gee:terms_of_use': |||
    LANDFIRE data are public domain data with no use restrictions. If
    modifications or derivatives are created, add a descriptive modifier to
    the dataset name to avoid confusion with the source LANDFIRE product.
  |||,
}
