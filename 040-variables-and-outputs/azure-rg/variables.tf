variable "tag_owner_value" {
  type        = string
  description = "the tag value of the owner."
  validation {
    condition     = length(var.tag_owner_value) > 4
    error_message = "the length of tag_owner_value must be longer than 4"
  }
  sensitive = true
}