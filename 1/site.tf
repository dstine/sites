// TODO: private hosted zone
// TODO: site content
// TODO: web traffic logging
// TODO: TLS

resource "aws_s3_bucket" "root" {
  bucket = "${var.root_domain}"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":
    [
      {
	"Sid": "PublicReadGetObject",
        "Effect": "Allow",
	  "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::${var.root_domain}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "www" {
  bucket = "www.${var.root_domain}"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "${var.root_domain}"
  }
}

