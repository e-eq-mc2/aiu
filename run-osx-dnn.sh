#! /bin/sh
script_dir=$(cd $(dirname $0); pwd)
cd $script_dir

prg=`pgrep -of julius`

if [ -n "$prg" ]; then
  echo "Killing $prg"
  killall julius
fi

log=julius.log
bindir=./bin
$bindir/julius -C main.jconf -C am-dnn.jconf -dnnconf julius.dnnconf -module 10500  > $log 2>&1 &
#$bindir/julius -C main.jconf -C am-dnn.jconf -dnnconf julius.dnnconf #-module 10500  > $log 2>&1 &
