#!/bin/sh

mkdir -p build types
cd build

curl -s 'ftp://ftp2.census.gov/geo/tiger/GENZ2015/shp/' |
  grep '_500k.zip$' |
  sed 's|.* |http://www2.census.gov/geo/tiger/GENZ2015/shp/|' |
  while read -r URL; do [ -f ${URL##*/} ] || curl -O $URL; done

unzip -o '*.zip' '*.shp' '*.dbf'
rm -f *.geojson

for FILE in $(ls *.shp); do
  TYPE=$(echo $FILE | cut -d'_' -f 4)
  MAP='(d.id = d.properties.GEOID || d.properties.GEOID10, delete d.properties, d)'

  shp2json -n $FILE | ndjson-map "$MAP" >> ../build/$TYPE.geojson
done

for FILE in $(ls *.geojson); do
  TYPE=$(basename $FILE .geojson)
  geo2topo -q 1e5 -n $TYPE.geojson > ../types/$TYPE.json
done
