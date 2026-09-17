locals {

  singapore_user_data = <<-EOF
    #!/bin/bash

    apt-get update -y
    apt-get install -y nginx

    systemctl enable nginx
    systemctl start nginx

    cat > /var/www/html/index.html <<HTML
    <!DOCTYPE html>
    <html>
    <head>
        <title>Singapore Nginx Server</title>
    </head>
    <body>
        <h1>Welcome to Singapore Nginx Server</h1>
        <p>Deployed using Terraform</p>
        <p>AWS Region: ap-southeast-1</p>
    </body>
    </html>
    HTML
  EOF


  us_east_user_data = <<-EOF
    #!/bin/bash

    apt-get update -y
    apt-get install -y nginx

    systemctl enable nginx
    systemctl start nginx

    cat > /var/www/html/index.html <<HTML
    <!DOCTYPE html>
    <html>
    <head>
        <title>US East Nginx Server</title>
    </head>
    <body>
        <h1>Welcome to US East Nginx Server</h1>
        <p>Deployed using Terraform</p>
        <p>AWS Region: us-east-1</p>
    </body>
    </html>
    HTML
  EOF
}
