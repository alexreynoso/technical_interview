output "password" {
  value = aws_iam_user_login_profile.this.encrypted_password
}

output "user" {
  value = aws_iam_user.this.name
}

output "access_key" {
  value = aws_iam_access_key.this.id
}

output "secret_key" {
  value = aws_iam_access_key.this.encrypted_secret
}
