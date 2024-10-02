#!bin/bash
tobin(){
    inp=$1
    out=""
    while [ $inp -gt 0 ];do
        ost=$(( $inp % 2 ))
        if [ $ost == 0 ];then
            out="0$out"
        else
            out="1$out"
        fi
        inp=$(( $inp / 2 ))
    done
    while [ ${#out} -lt 8 ];do
        out="0$out"
    done
    echo "$out"
}


read -p "Enter IPv4 address: " ip
if [[ $ip == [0-9]+"."[0-9]+"."[0-9]+"."[0-9]+ ]]; then
    array=`echo "$ip" | tr "." " "`
    result=""
    for i in $array; do
        if [ $i -lt 256 ]; then
            result="$result.`tobin $i`"
        else
            result="$result.err"
        fi
    done
    if [[ $result == *"err"* ]]; then
        echo "Entered incorrect data"
    else
        echo ${result:1}
    fi
else
    echo "Entered incorrect data"
fi