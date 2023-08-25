# This script is executed after the application is installed on the EC2 instance

S3_BUCKET="s3://pruebas-microservicios-webappdeploymentbucket-kiyqmiamkemq/app.tar.gz"
DEST_DIR="/home/ec2-user/nodeserver"
TAR_FILE="$DEST_DIR/app.tar.gz"

# Copy the app.tar.gz file from the S3 bucket to the EC2 instance
if aws s3 cp "$S3_BUCKET" "$TAR_FILE"; then
    echo "Successfully copied app.tar.gz from S3 to $DEST_DIR"
else
    echo "Failed to copy app.tar.gz from S3" >&2
    exit 1
fi

# Navigate to the directory where the app.tar.gz file is located
cd "$DEST_DIR" || { echo "Failed to change directory to $DEST_DIR" >&2; exit 1; }

# Extract the contents of the app.tar.gz file
if tar -xvf "$TAR_FILE"; then
    echo "Successfully extracted app.tar.gz"
else
    echo "Failed to extract app.tar.gz" >&2
    exit 1
fi

# Remove the app.tar.gz file
if rm -rf "$TAR_FILE"; then
    echo "Successfully removed app.tar.gz"
else
    echo "Failed to remove app.tar.gz" >&2
    exit 1
fi