#!/bin/bash

echo "Choose an option:"
echo "1. Simple Interest"
echo "2. Compound Interest"
read option

if [ $option -eq 1 ]; then
    # Simple Interest calculation
    echo "Enter the principal:"
    read p

    # Input validation for principal amount
    if ! [[ "$p" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid principal amount (numeric)."
        exit 1
    fi

    echo "Enter rate of interest per year:"
    read r

    # Input validation for interest rate
    if ! [[ "$r" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Please enter a valid interest rate (numeric)."
        exit 1
    fi

    echo "Enter time period in years:"
    read t

    # Input validation for time period
    if ! [[ "$t" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid time period (numeric)."
        exit 1
    fi

    s=$(echo "scale=2; $p * $t * $r / 100" | bc)
    echo "The simple interest is: $s"

elif [ $option -eq 2 ]; then
    # Compound Interest calculation
    echo "Enter the principal:"
    read p

    # Input validation for principal amount
    if ! [[ "$p" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid principal amount (numeric)."
        exit 1
    fi

    echo "Enter rate of interest per year:"
    read r

    # Input validation for interest rate
    if ! [[ "$r" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Please enter a valid interest rate (numeric)."
        exit 1
    fi

    echo "Enter time period in years:"
    read t

    # Input validation for time period
    if ! [[ "$t" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid time period (numeric)."
        exit 1
    fi

    # Calculate compound interest
    ci=$(echo "scale=2; $p * (1 + ($r / 100)) ^ $t - $p" | bc)
    echo "The compound interest is: $ci"

else
    echo "Invalid option. Please choose either 1 or 2."
    exit 1
fi
