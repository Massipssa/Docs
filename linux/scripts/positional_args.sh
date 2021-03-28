# $@: all arguments
# $0: script name
# $#: number of the arguments
# $?: exist status of the last command

echo "All arg: $@"
for arg in "$@";
do
    echo "$arg"
done

echo "Script name: $0"
echo "Dir of the script: $(dirname "$0")"

echo "First arg: $1"
echo "Second arg: $2"

echo "Number of args: $#"

function my_function() {
    echo "Hello from function"
    return 100
    
}

my_function
echo "The last value returned by the command: $?"

if [ $# -lt 2 ]; then
    echo "USAGE: $0 arg1 arg2"
    exit 1
fi

