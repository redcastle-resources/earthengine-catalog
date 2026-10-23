local id = 'projects/gtac-data-publish/assets/LANDFIRE/Product_Version/Topo-2020-1';
local subdir = 'gtac-data-publish';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local units = import 'units.libsonnet';
local versions = import 'versions.libsonnet';
local version_table = import 'templates/LANDFIRE_Topography_versions.libsonnet';
local version_config = versions(subdir, version_table, id);
local version = version_config.version;

local license = spdx.proprietary;

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
  title: 'LANDFIRE 2020 Topography ' + version,
  version: version,
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    LANDFIRE 2020 Topography is a 30-meter collection of elevation, aspect,
    slope in degrees, and slope in percent for the conterminous United States,
    Alaska, Hawaii, and Puerto Rico and the U.S. Virgin Islands. Each image
    represents one LANDFIRE study area.

    The LF 2020 topographic products were recalculated from U.S. Geological
    Survey 3D Elevation Program data. Aspect was calculated relative to true
    north, correcting inconsistencies in earlier LANDFIRE topographic products.
    Aspect value -1 represents flat terrain or no aspect; source value -9999 is
    NoData and is masked during ingestion.

    LANDFIRE topographic products are updated infrequently. Although delivered
    at 30-meter resolution, they are intended primarily for national, regional,
    and large subregional planning rather than analysis of individual pixels.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id) + version_config.version_links + [
    ee.link.license('https://www.landfire.gov/'),
    {
      rel: ee_const.rel.source,
      href: 'https://www.landfire.gov/topographic',
    },
  ],
  'gee:categories': ['elevation-topography'],
  keywords: [
    'aspect',
    'dem',
    'elevation',
    'landfire',
    'slope',
    'topography',
    'usda',
    'usfs',
    'usgs',
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
                    '2020-01-01T00:00:00Z', '2020-12-31T00:00:00Z'),
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
        description: 'LANDFIRE version name, such as LF_2020.',
        type: ee_const.var_type.string,
      },
      {
        name: 'landfire_version_number',
        description: 'Integer LANDFIRE version number, such as 220.',
        type: ee_const.var_type.int,
      },
    ],
    'eo:bands': [
      {
        name: 'Asp',
        description: |||
          Aspect in degrees clockwise from north. Value -1 represents flat
          terrain or no aspect. Source value -9999 is NoData and is masked.
        |||,
        'gee:units': units.degree,
      },
      {
        name: 'Elev',
        description: |||
          Elevation above sea level. Source value -9999 is NoData and is masked.
        |||,
        'gee:units': units.meter,
      },
      {
        name: 'SlpD',
        description: |||
          Terrain slope in degrees. Source value -9999 is NoData and is masked.
        |||,
        'gee:units': units.degree,
      },
      {
        name: 'SlpP',
        description: |||
          Terrain slope as percent rise. Source value -9999 is NoData and is
          masked.
        |||,
        'gee:units': units.percent,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Elevation',
        lookat: {lon: -112.0, lat: 40.0, zoom: 5},
        image_visualization: {
          band_vis: {
            bands: ['Elev'],
            min: [-100],
            max: [4500],
            palette: [
              '00204c',
              '2a4a84',
              '4d798e',
              '7ba66f',
              'c9cc57',
              'fee838',
            ],
          },
        },
      },
      {
        display_name: 'Aspect',
        lookat: {lon: -112.0, lat: 40.0, zoom: 8},
        image_visualization: {
          band_vis: {
            bands: ['Asp'],
            min: [0],
            max: [360],
            palette: [
              '30123b',
              '4675ed',
              '1bcfd4',
              '61fc6c',
              'd1e834',
              'fd8d3c',
              'c73e7b',
              '30123b',
            ],
          },
        },
      },
    ],
  },
  'sci:doi': '10.5066/P1LJEZ3G',
  'sci:citation': |||
    LANDFIRE. 2022. LANDFIRE 2020 Topographic Products, LANDFIRE 2.2.0. U.S.
    Department of the Interior, U.S. Geological Survey, and U.S. Department
    of Agriculture, Forest Service. Available from
    [LANDFIRE](https://www.landfire.gov/).
    [doi:10.5066/P1LJEZ3G](https://doi.org/10.5066/P1LJEZ3G).
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
