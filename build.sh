#!/bin/sh

mkdir -p types /tmp/census-topologies
cd /tmp/census-topologies

curl 'ftp://ftp2.census.gov/geo/tiger/GENZ2015/shp/' \
| grep '_500k.zip$' \
| sed 's|.* |http://www2.census.gov/geo/tiger/GENZ2015/shp/|' \
| while read -r URL; do [ -f ${URL##*/} ] || curl -O $URL; done

unzip -o '*.zip'

TYPES=$(ls *.shp | sed 's/cb_2015_.._\(.*\)_500k.shp$/\1/' | sort | uniq)

for TYPE in $TYPES; do
  for FILE in $(ls cb_2015_*_${TYPE}_500k.shp); do shp2json -n $FILE; done \
  | ndjson-map '(d.id = d.properties.GEOID || d.properties.GEOID10, delete d.properties, d)' \
  | geo2topo -n -q 1e5 $TYPE=- \
  > $OLDPWD/types/$TYPE.json
done
