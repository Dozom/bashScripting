#!/bin/bash

# Decimal numbers for Alphanumeric Characters in ASCII Table from 32 to 126
dec=(32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126)

echo "The Alphanumeric Chars in ASCII Table are the following:"
for i in ${dec[@]};do
	printf "\\$(printf %o $i)"
done;
echo -e ""
echo -e "Paste your HEX String without quotes to get your String:"
read hex_string

# Hexadecimal to Decimal here
function get_dec(){
	number_length_iterator=$((`echo ${#1}` - 1))
	number=$1
	hex_value=0
	total_value=0
	cont=0
	for i in $(seq $number_length_iterator -1 0);do
		multiply_by=$((16 ** $i))
		hex_value=`echo ${number:cont:1}`
		if [ $hex_value -ne 0 ];then
			total_value=$(( $total_value + ($hex_value * $multiply_by) ))

		fi
		cont=$((cont+1))
	done;
#	echo $total_value
# Decimal to ASCII here
	printf "\\$(printf %o $total_value)"

}

# Parse The Big String Passed to valid Hex Values ex: 5060 -> 50 60
function parse_hex(){
	string_length_iterator=$((`echo ${#1}` - 1))
	string=$1
	for i in $(seq 0 2 $string_length_iterator);do
		hex_value=`echo ${string:i:2}`
		echo $(get_dec $hex_value)
	done;
}

echo "Printing ASCII.."
echo "Your ASCII String is the following:"
echo $(parse_hex $hex_string)
