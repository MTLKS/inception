# get env variables from env file
export $(grep -v '^#' srcs/.env | xargs)

# generate ssl certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout srcs/requirements/nginx/ssl/$DOMAIN_NAME.key -out srcs/requirements/nginx/ssl/$DOMAIN_NAME.crt -subj "/C=MY/ST=Kuala Lumpur/L=Kuala Lumpur/O=42KL/OU=42KL/CN=$DOMAIN_NAME"