<!--
Copyright 2019 The Google Earth Engine Community Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

# Google Earth Engine Public Data Catalog

This repository contains Earth Engine catalog content.

## Quick links

- [Edit existing entries](docs/simple_edits.md).
- [Add new publisher catalogs](docs/adding_catalogs.md).
- [Add new datasets](docs/adding_datasets.md).
- [See annotated examples](catalog/TEMPLATE).
- [Request to add a new dataset](https://issuetracker.google.com/issues?q=status:(open%20%7C%20new%20%7C%20assigned%20%7C%20accepted)%20componentid:1161680&p=1). If you'd like to maintain this dataset, make a note in the request.
- [Report a problem with an existing dataset](https://issuetracker.google.com/issues?q=status:(open%20%7C%20new%20%7C%20assigned%20%7C%20accepted)%20componentid:1161653).

# Google Earth Engine Public Data Catalog

This repository contains Earth Engine catalog content.

## Quick links

- [Edit existing entries](docs/simple_edits.md).
- [Add new publisher catalogs](docs/adding_catalogs.md).
- [Add new datasets](docs/adding_datasets.md).
- [See annotated examples](catalog/TEMPLATE).
- [Request to add a new dataset](https://issuetracker.google.com/issues?q=status:(open%20%7C%20new%20%7C%20assigned%20%7C%20accepted)%20componentid:1161680&p=1). If you'd like to maintain this dataset, make a note in the request.
- [Report a problem with an existing dataset](https://issuetracker.google.com/issues?q=status:(open%20%7C%20new%20%7C%20assigned%20%7C%20accepted)%20componentid:1161653).

# Updating Google Earth Engine Data Catalog Releases

Use this process to update the Jsonnet metadata for a Google Earth Engine (GEE) Data Catalog release and submit the changes to the upstream catalog.

## Prerequisites

1. Sign a [Google Open Source Contributor License Agreement (CLA)](https://cla.developers.google.com/clas).
2. Use a Google account to access the Earth Engine catalog documentation shared with the project.
3. Use the [RedCastle Resources fork of `earthengine-catalog`](https://github.com/redcastle-resources/earthengine-catalog), not the Forest Service enterprise Git account.
4. Confirm that Git and a GitHub authentication method are configured locally.

## Workflow for PR

1. Open the appropriate project branch in the RedCastle Resources fork, such as [`GTAC-LCMS`](https://github.com/redcastle-resources/earthengine-catalog/tree/GTAC-LCMS). For a new project, create a new topic branch from the current upstream base branch.
2. Clone the fork locally. If the repository is already cloned, fetch the latest changes instead.
3. Create and check out a descriptively named branch for the release, such as `LCMS-2022-8`.
4. Create or update the required files:
   - Jsonnet catalog description files
   - JSON example files
   - Preview scripts
5. Review the changes and run any catalog validation checks required by the Earth Engine contribution documentation.
6. Stage and commit the updated files with a concise message.
7. Push the topic branch to the GitHub fork.
8. In GitHub, open a pull request from the topic branch in the RedCastle Resources fork to the appropriate branch of [`google/earthengine-catalog`](https://github.com/google/earthengine-catalog).
9. Monitor the pull-request checks in the upstream repository. Correct validation errors, commit the fixes, and push them to the same topic branch; the pull request will update automatically.

> **Note:** A GitHub fork is created once at the repository level. Individual releases should normally use new branches within that fork rather than creating another fork.

## Example Git commands

Replace the repository URL, branch name, source file, destination file, and commit message as appropriate for the release.

```bash
git clone git@github.com:redcastle-resources/earthengine-catalog.git earthengine-catalog
cd earthengine-catalog
git checkout -b LCMS-2022-8
cp catalog/USFS/USFS_GTAC_LCMS_v2021-7.jsonnet catalog/USFS/USFS_GTAC_LCMS_v2022-8.jsonnet

# Edit and validate catalog/USFS/USFS_GTAC_LCMS_v2022-8.jsonnet.

git add catalog/USFS/USFS_GTAC_LCMS_v2022-8.jsonnet
git commit -m "USFS: Add version 2022-8 of LCMS"
git push -u origin LCMS-2022-8
```

After the push completes, use the pull-request URL printed by Git or open the branch on GitHub and select **Compare & pull request**.

## GitHub authentication

GitHub no longer accepts an account password for Git operations over HTTPS. If an HTTPS remote prompts for a password, create a GitHub personal access token and enter the token in place of the password. SSH remotes, such as the one in the example above, require a GitHub-configured SSH key instead.

# STAC and Jsonnet

[SpatioTemporal Asset Catalogs (STAC)](https://stacspec.org/) is a standard for
describing spatial datasets in a catalog.

Earth Engine uses STAC [Jsonnet](https://jsonnet.org) templates to generate the
[Earth Engine Public Data Catalog](https://developers.google.com/earth-engine/datasets/catalog)
and the
[STAC JSON catalog](https://console.cloud.google.com/storage/browser/earthengine-stac/catalog)
with
[the root catalog.json file here](https://storage.googleapis.com/earthengine-stac/catalog/catalog.json).
Using Jsonnet
allows repetitive content to be written one time and used across multiple
collections and items.

You can use these external services to browse the EE STAC catalog:

- [RadiantEarth STAC Browser](https://radiantearth.github.io/stac-browser/#/external/storage.googleapis.com/earthengine-stac/catalog/catalog.json)
- [STAC Index](https://stacindex.org/catalogs/google-earth-engine)
- [gee.stac.cloud](https://gee.stac.cloud/)


# Local Install Instructions

If you'd like to run validity checks locally (not via GitHub actions), see
[the local installation instructions](docs/install.md). Most people won't
need this.

# Non-commercial datasets

[non_commercial_datasets.jsonnet](https://github.com/google/earthengine-catalog/blob/main/non_commercial_datasets.jsonnet)
contains a list of datasets that have
licenses known to exclude commercial use. If you are using Earth Engine
in a commercial capacity, these datasets are not available.

# Other Earth Engine Github repositories

- Community tutorials: https://github.com/google/earthengine-community
- Earth Engine API: https://github.com/google/earthengine-api
