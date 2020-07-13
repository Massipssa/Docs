echo "All arg: $@"
for arg in $@;
do
    echo $arg
done

echo "Script name: $0"
echo "Dir of the script: $(dirname $0)"

echo "First arg: $1"
echo "Second arg: $2"

echo "Number of args: $#"

function my_funtion() {
    echo "Hello from function"
    return 100
    
}

my_funtion
echo "The last value retured by the command: $?"

if [ $# -lt 2 ]; then
    echo "USAGE: $0 arg1 arg2"
    exit 1
fi

