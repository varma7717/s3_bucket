resource "aws_s3_bucket" "pranay" {
   bucket = "pranay-ajay"
  tags = {
    Name = "ajay-pranay"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.pranay.id

  block_public_acls      = false
  ignore_public_acls     = false
  block_public_policy    = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "vinay-policy" {
  bucket = aws_s3_bucket.pranay.id
  policy = jsonencode({
    Id      = "Policy1730737344952"
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "Stmt1730737341855"
        Effect    = "Allow"
        Action    = "s3:GetObject"      
        Resource  = "${aws_s3_bucket.pranay.arn}/*"
        Principal = "*"
      }
    ]
  })
}

resource "aws_s3_object" "raju" {
    bucket = aws_s3_bucket.pranay.id
    key    = "AjayV"
    source = "C:/Users/Ajay Varma/Downloads/AjayV.pdf"
    content_type = "Application/pdf"
  
}