#!/bin/bash

# Default values
DEFAULT_USER="root"
DEFAULT_PASSWORD="mesportal"
DEFAULT_HOST="old.db.mindseyesociety.dock"
DEFAULT_DBNAME="mesportal"
DEFAULT_FILENAME="dump-old-latest-tables-data.sql"

# Function to display help
display_help() {
    echo "Usage: ./dump_data.sh [options] dump"
    echo
    echo "Options:"
    echo "  -u, --user       MySQL username (default: $DEFAULT_USER)"
    echo "  -p, --password   MySQL password (default: $DEFAULT_PASSWORD)"
    echo "  -h, --host       MySQL host (default: $DEFAULT_HOST)"
    echo "  -d, --dbname     MySQL database name (default: $DEFAULT_DBNAME)"
    echo "  -f, --filename   Output filename for the dump (default: $DEFAULT_FILENAME)"
    echo
    echo "The 'dump' command must be the last argument."
    echo "Example: ./dump_data.sh --user michael dump"
    echo
    echo "All options are optional, except for the 'dump' command."
}

# Check for at least one argument
if [[ $# -eq 0 ]]; then
    display_help
    exit 1
fi

# Check if the last argument is 'dump'
if [[ "$1" != "dump" ]] && [[ "${@: -1}" != "dump" ]]; then
    echo "Error: The last argument must be 'dump'."
    display_help
    exit 1
fi

# Initialize variables with default values
USER="$DEFAULT_USER"
PASSWORD="$DEFAULT_PASSWORD"
HOST="$DEFAULT_HOST"
DBNAME="$DEFAULT_DBNAME"
FILENAME="$DEFAULT_FILENAME"

# Parse command-line options
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -u|--user) USER="$2"; shift ;;
        -p|--password) PASSWORD="$2"; shift ;;
        -h|--host) HOST="$2"; shift ;;
        -d|--dbname) DBNAME="$2"; shift ;;
        -f|--filename) FILENAME="$2"; shift ;;
        dump) shift; continue ;;
        *) echo "Unknown parameter passed: $1"; display_help; exit 1 ;;
    esac
    shift
done

# Execute mysqldump
mysqldump -u"$USER" -p"$PASSWORD" -h"$HOST" --no-create-info "$DBNAME" \
AccessToken Affiliate AuthCode Authorization Claim Client RefreshToken \
Renewal Transaction User UserNotificationsSet UserRolesSet credits \
ext_log_entries financial_transactions payment_instructions \
payments > "$FILENAME"

# Inform user of the dump completion
echo "Data from tables dumped to $FILENAME"

