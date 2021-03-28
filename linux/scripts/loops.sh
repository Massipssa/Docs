# for 
for arg in "$@";
do
    echo "$arg"
done

# while
n=$#
while [ $n -lt 5 ]
do
    echo $n
    n=`expr $n + 1`
done