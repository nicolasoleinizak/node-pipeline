# This script is executed after the application is installed on the EC2 instance

# Copy the app.tar.gz file from the S3 bucket to the EC2 instance
aws s3 cp s3://pruebas-microservicios-webappdeploymentbucket-kiyqmiamkemq/app.tar.gz /home/ec2-user/nodeserver

# Navigate to the directory where the app.tar.gz file is located
cd /home/ec2-user/nodeserver

# Extract the contents of the app.tar.gz file
tar -xvf app.tar.gz

# Remove the app.tar.gz file
rm -rf app.tar.gz

