#!/bin/sh
cd /root/bdsx
if [ ! -d ./bdsx ]
then
    git pull upstream master
fi

cd /root/bdsx

until [ -f /root/bdsx/bdsx/analyzer.ts ]
do
     sleep 5
done

# Uncomment this if you dont want the Testszenario's from BDSX
#rm -f index.ts
#touch index.ts

BDSX_YES=true npm i
npm run -s prepare
npx tsc -b

rm -f bdsx.sh
cp /root/bdsx.sh bdsx.sh

BDSX_YES=true BDSX_PERMANENT=true ./bdsx.sh