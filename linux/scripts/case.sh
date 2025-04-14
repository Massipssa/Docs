COMMAND=$1

if [  "$#" < 1 ] ; then
    echo "USAGE: $0 arg"
fi

if [ -z "$COMMAND" ]; then
    echo "USAGE: $0 arg"
    exit 1
fi

case $COMMAND in 
    -hello)
        TOTO="-hello"
        shift
        ;;
    -bye)
        TOTO="-bye"
        break
        ;;
    *)
        echo "Invalid choice"
        exit
        ;;
esac
