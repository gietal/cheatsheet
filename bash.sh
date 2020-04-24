### using other variables in a string ###
world="world"
helloWorld="hello $world"

### for loop range ###
for i in {1..5}
do
   echo "hello $i times"
done

### test if string variable is empty ###
if [ -z "$var" ]
then
   echo "empty"
do
