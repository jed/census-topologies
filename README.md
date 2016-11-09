# census-topologies

This library contains boundaries published by the [U.S. Census Bureau](https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html). [All boundaries](http://www2.census.gov/geo/tiger/GENZ2015/) available at 1:500,000 resolution have been aggregated by type, quantized (to `100000`), and converted into [TopoJSON](https://github.com/topojson/topojson) files, with all properties by but `GEOID`s stripped.

API
---

Since all files are already in JSON format, you just need to require them as follows:

    require(`census-topologies/types/${NAME}`)

where `NAME` is one of the following:

- `aiannh` (American Indian Areas/Alaska Native Areas/Hawaiian Home Land)
- `anrc` (Alaska Native Regional Corporation)
- `bg` (Block Group)
- `cbsa` (Metropolitan Statistical Area / Micropolitan Statistical Area)
- `cd114` (Congressional District)
- `concity` (Consolidated City)
- `county` (County)
- `cousub` (County Subdivision)
- `csa` (Combined Statistical Area)
- `division` (Division)
- `necta` (New England City and Town Area)
- `place` (Place)
- `puma10` (Public Use Microdata Area (PUMA))
- `region` (National Region (Northeast, Southeast, Midwest and West))
- `sldl` (tate Legislative District - Lower Chamber)
- `sldu` (State Legislative District - Upper Chamber)
- `state` (State and Equivalent)
- `subbarrio` (SubMinor Civil Division (Subbarios in Puerto Rico))
- `tract` (Census Tract)
- `ua10` (Urban Area/Urban Cluster)
- `zcta510` (5-Digit ZIP Code Tabulation Area)
