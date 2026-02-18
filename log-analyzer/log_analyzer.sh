#!/bin/bash

#########################################
# Log Analyzer Script
# Usage: ./log_analyzer.sh /path/to/logfile
#########################################

# Exit Codes
# 1 - Missing argument
# 2 - File does not exist
# 3 - File not readable

# Validate argument
if [ "$#" -ne 1 ]; then
    echo "Error: Log file path must be provided." >&2
    exit 1
fi

LOG_FILE="$1"

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File does not exist: $LOG_FILE" >&2
    exit 2
fi

# Check if file is readable
if [ ! -r "$LOG_FILE" ]; then
    echo "Error: File is not readable: $LOG_FILE" >&2
    exit 3
fi

FILE_NAME=$(basename "$LOG_FILE")

# Get total lines
TOTAL_LINES=$(wc -l < "$LOG_FILE")

# Count log levels
ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOG_FILE")
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE")

# Get last ERROR line
LAST_ERROR=$(grep "ERROR" "$LOG_FILE" | tail -n 1)

# Print structured output
echo "----------------------------------------"
echo "Log Analysis Report"
echo "----------------------------------------"
echo "Log File      : $FILE_NAME"
echo "Total Lines   : $TOTAL_LINES"
echo "INFO Count    : $INFO_COUNT"
echo "WARNING Count : $WARNING_COUNT"
echo "ERROR Count   : $ERROR_COUNT"
echo "----------------------------------------"

echo "Last ERROR:"
if [ -z "$LAST_ERROR" ]; then
    echo "No ERROR entries found."
else
    echo "$LAST_ERROR"
fi

exit 0
