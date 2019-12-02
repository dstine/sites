resource "aws_resourcegroups_group" "group" {
  name = "${var.project}"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::AllSupported"
  ],
  "TagFilters": [
    {
      "Key": "project",
      "Values": ["${var.project}"]
    }
  ]
}
JSON
  }

  tags = {
    project   = "${var.project}"
    terraform = true
  }
}

