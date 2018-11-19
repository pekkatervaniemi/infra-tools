#!/bin/bash
#check hp server disk status with hpssacli prints server and NON OK disks status

export hostlist="/path/to/hostlist"
for i in $(cat $hostlist)
        do
            CTRL1=$(ssh $i sudo /opt/hp/hpssacli/bld/hpssacli controller slot=1 pd all show|grep physicaldrive|grep -v OK|wc -l)
            CTRL2=$(ssh $i sudo /opt/hp/hpssacli/bld/hpssacli controller slot=2 pd all show|grep physicaldrive|grep -v OK|wc -l)
                    if [ $CTRL1 -gt 0 ] ||  [ $CTRL2 -gt 0 ]
                      then
                        echo $i
                            ssh $i sudo /opt/hp/hpssacli/bld/hpssacli controller slot=1 pd all show|grep physicaldrive|grep -v OK
                            ssh $i sudo /opt/hp/hpssacli/bld/hpssacli controller slot=2 pd all show|grep physicaldrive|grep -v OK
                         fi
done
