# --- dynamodb/main.tf

resource "aws_dynamodb_table" "countDBtable" {
  name             = "visit-count-table"
  hash_key         = "ID"
  billing_mode     = "PAY_PER_REQUEST"
  
  # provisioned mode is a part of free tier... might need to look at that
  # Doubt we need the following
  #table_class = #STANDARD #STANDARD_INFREQUENT_ACCESS
  # probably don't need this
  #stream_enabled   = true
  #stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "ID"
    type = "S"
  }

  tags = var.common_tags
}